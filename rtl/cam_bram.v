`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/06 23:29:08
// Design Name: 
// Module Name: cam_bram
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
//若mst的oustanding能力为4.则需要深度为12的查找表，这里设置RAM的深度为16
module cam_bram#(parameter DATA_WIDTH = 4,
                 parameter CAM_TARGET_WIDTH = 4,
                 //memory size is log2(DATA_WIDTH)
                 parameter ADDR_WIDTH = 3)
                (input clk,
                 input rstn,
                
                 input [DATA_WIDTH - 1 : 0] write_data,
                 input write_delete,
                 input write_enable,

                 input [CAM_TARGET_WIDTH - 1 : 0] write_target,
                //  input compare_enable,
                 input [DATA_WIDTH - 1 : 0] compare_data,
                 output match,
                 output [CAM_TARGET_WIDTH - 1 : 0] match_target,
                 output match_valid,
                 output write_busy);


    localparam [2 : 0]
        STATE_INIT = 3'd0,
        STATE_IDLE = 3'd1,
        STATE_WRITE_1 = 3'd2,
        STATE_WRITE_2 = 3'd3,
        STATE_DELETE_1 = 3'd4,
        STATE_DELETE_2 = 3'd5;
    
    wire ram_dout;
    wire [CAM_TARGET_WIDTH - 1 : 0] ram_target_dout;

    //检查compare_data变化后的第二个周期
    reg match_valid_der;
    //检查是否是compare_data变化的第一个周期
    reg match_counter;
    reg compare_change;

    reg match_valid_reg;
    //在变化的同时match_valid拉低，后面一个周期也要拉低，只能引入组合逻辑
    assign match_valid = match_valid_reg;


    reg wr_en;
    reg [ADDR_WIDTH - 1 : 0] compare_addr_ex;
    reg [ADDR_WIDTH - 1 : 0] compare_addr;
    reg [ADDR_WIDTH - 1 : 0] ram_addr_ex;
    reg [ADDR_WIDTH - 1 : 0] ram_addr;
    reg ram_din;
    reg [CAM_TARGET_WIDTH - 1 : 0] ram_target;

    reg [3 : 0] state_reg;
    reg [3 : 0] state_next;
    reg write_busy_reg;
    reg [DATA_WIDTH - 1 : 0] write_data_next;
    reg [DATA_WIDTH - 1 : 0] compare_data_next;
    reg [CAM_TARGET_WIDTH - 1 : 0] write_target_next;
    reg [DATA_WIDTH - 1 : 0] write_data_reg;
    reg [DATA_WIDTH - 1 : 0] compare_data_reg; 
    reg [CAM_TARGET_WIDTH - 1 : 0] write_target_reg;
    reg write_enable_next;
    reg write_delete_next;
    reg write_enable_reg;
    reg write_delete_reg;

    reg wr_del;

    // reg compare_enable_buf;
    reg [DATA_WIDTH - 1 : 0] compare_data_buf;


    assign write_busy = write_busy_reg;

    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            // compare_enable_buf <= 'b0;
            compare_data_buf <= 'h0;
        end else begin
            // compare_enable_buf <= compare_enable;
            compare_data_buf <= compare_data;
        end
    end

    //主机的WID在收到i_wready前没有理由变化，可以据此来调整match_valid输出
    //根据compare_enable的上升沿初始化为0，两个周期后置一
    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            match_counter <= 'h0; 
        end else if(compare_data_buf != compare_data) begin
            match_counter <= 'b0;
        end else if(match_counter == 'h1) begin
            match_counter <= match_counter;
        end else begin
            match_counter <= match_counter + 'b1;
        end
    end

    //连续比较
    always @(*) begin
        compare_change <= (compare_data_buf != compare_data);
        // compare_change <= write_delete;
    end

    //match_counter非0且match_valid_der为1
    always @(*) begin
        match_valid_reg <= (~ compare_change) & match_valid_der & match_counter;
    end

    // wire debug;
    // assign debug = match_counter  && (~write_busy_reg);

    always @ (posedge clk or negedge rstn) begin
        if(!rstn) begin
            match_valid_der <= 'b0;
        end else if(write_enable) begin
            match_valid_der <= 'b0;
        end else if(write_delete) begin
            match_valid_der <= 'b0;
        end
        //正在写入或者删除过程中查找结果无效
        else if(match_counter == 'h1 && (~write_busy_reg))begin
            match_valid_der <= 'b1;
        end else begin
            match_valid_der <= 'b0;
        end
    end
    
    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            state_reg <= STATE_INIT;
            write_busy_reg <= 'b1;
            write_data_reg <= 'h0;
            write_target_reg <= 'b0;
            compare_data_reg <= 'h0;
            write_enable_reg <= 'b0;
            write_delete_reg <= 'b0;
        end else begin
            state_reg <= state_next;
            write_busy_reg <= (state_next != STATE_IDLE) | (state_reg != STATE_IDLE);
            write_data_reg <= write_data_next;
            write_target_reg <= write_target_next;
            compare_data_reg <= compare_data_next;
            write_enable_reg <= write_enable_next;
            write_delete_reg <= write_delete_next;      
        end
    end

    always @(*) begin
        if(!rstn) begin
            // wr_en <= 'h0;
            state_next <= STATE_IDLE;
        end else begin
            state_next <= STATE_IDLE;
            // wr_en <= 'b0;
            // write_data_next <= write_data_reg;
            // compare_data_next <= compare_data_reg;
            write_data_next <= write_data;
            write_target_next <= write_target;
            compare_data_next <= compare_data;
            write_enable_next <= write_enable;
            write_delete_next <= write_delete;
            

            case(state_reg)
                STATE_INIT: begin
                    // wr_en <= 'h0;

                    state_next <= STATE_IDLE;
                end

                STATE_IDLE: begin
                    compare_data_next <= compare_data;
                    write_data_next <= write_data;
                    write_target_next <= write_target;
                    write_enable_next <= write_enable;
                    write_delete_next <= write_delete;
                    

                    if(write_enable) begin
                        state_next <= STATE_WRITE_1;
                    end else if(write_delete) begin
                        state_next <= STATE_DELETE_1;
                    end
                    else begin
                        state_next <= STATE_IDLE;
                    end

                    // if(compare_enable) begin
                    //     compare_data_next <= compare_data;
                    // end else begin
                    //     compare_data_next <= compare_data_reg;
                    // end
                end

                //要考虑连续写的情况
                STATE_WRITE_1: begin
                    if(write_enable) begin
                        state_next <= STATE_WRITE_1;
                    end else if(write_delete)begin
                        state_next <= STATE_DELETE_1;
                    end else begin
                        state_next <= STATE_WRITE_2;
                    end
                end

                STATE_WRITE_2: begin
                    // wr_en  <= 'b1;
                    // ram_din <= 'b1;
                    if(write_enable) begin
                        state_next <= STATE_WRITE_1;
                    end else if(write_delete)begin
                        state_next <= STATE_DELETE_1;
                    end else begin
                        state_next <= STATE_IDLE;
                    end
                end

                //考虑连续删除的情况
                STATE_DELETE_1: begin
                    if(write_delete) begin
                        state_next <= STATE_DELETE_1;
                    end else if(write_enable)begin
                        state_next <= STATE_WRITE_1;
                    end else begin
                        state_next <= STATE_DELETE_2;
                    end
                end

                STATE_DELETE_2: begin
                    // wr_en  <= 'b1;
                    // ram_din <= 'b0;
                    if(write_delete) begin
                        state_next <= STATE_DELETE_1;
                    end else if(write_enable)begin
                        state_next <= STATE_WRITE_1;
                    end else begin
                        state_next <= STATE_IDLE;
                    end
                end

            endcase
        end
    end

    //注意：这里的compare_addr_ex不能随意赋值，应该赋值到没有例化的位置
    always @(*) begin
        if(!rstn) begin
            compare_addr_ex <= 'hf;
        end else begin
            case(compare_data_reg[2 +: 2])
                'h1: begin
                    case(compare_data_reg[2 +: 2])
                        'h0:begin
                            compare_addr_ex <= 'h0;
                        end
                        'h1:begin
                            compare_addr_ex <= 'h1;
                        end
                        'h2:begin
                            compare_addr_ex <= 'h2;
                        end
                        'h3:begin
                            compare_addr_ex <= 'd3;
                        end
                        default:begin
                            compare_addr_ex <= 'hf;
                        end
                    endcase
                end
                'h2: begin
                    case(compare_data_reg[0 +: 2])
                        'h0:begin
                            compare_addr_ex <= 'h4;
                        end
                        'h1:begin
                            compare_addr_ex <= 'h5;
                        end
                        'h2:begin
                            compare_addr_ex <= 'h6;
                        end
                        'h3:begin
                            compare_addr_ex <= 'h7;
                        end
                        default:begin
                            compare_addr_ex <= 'hf;
                        end
                    endcase
                end
                'h3: begin
                    case(compare_data_reg[0 +: 2])
                        'h0:begin
                            compare_addr_ex <= 'h8;
                        end
                        'h1:begin
                            compare_addr_ex <= 'h9;
                        end
                        'h2:begin
                            compare_addr_ex <= 'ha;
                        end
                        'h3:begin
                            compare_addr_ex <= 'hb;
                        end
                        default:begin
                            compare_addr_ex <= 'hf;
                        end
                    endcase
                end
                // 'h8:begin
                //     case(compare_data_reg[0 +: 4])
                //         'h0:begin
                //             compare_addr_ex <= 'hc;
                //         end
                //         'h1:begin
                //             compare_addr_ex <= 'hd;
                //         end
                //         'h2:begin
                //             compare_addr_ex <= 'he;
                //         end
                //         'h3:begin
                //             compare_addr_ex <= 'hf;
                //         end
                //         default:begin
                //             compare_addr_ex <= 'hf;
                //         end
                //     endcase
                // end
                default: begin
                    compare_addr_ex <= 'hf;
                end
            endcase
        end
    end

    always @(*) begin
        if(!rstn) begin
            ram_addr_ex <= 'h0;
        end else begin
            case(write_data_reg[2 +: 2])
                'h1: begin
                    case(write_data_reg[0 +: 2])
                        'h0:begin
                            ram_addr_ex <= 'h0;
                        end
                        'h1:begin
                            ram_addr_ex <= 'h1;
                        end
                        'h2:begin
                            ram_addr_ex <= 'h2;
                        end
                        'h3:begin
                            ram_addr_ex <= 'd3;
                        end
                        default:begin
                            ram_addr_ex <= 'h0;
                        end
                    endcase
                end
                'h2: begin
                    case(write_data_reg[0 +: 2])
                        'h0:begin
                            ram_addr_ex <= 'h4;
                        end
                        'h1:begin
                            ram_addr_ex <= 'h5;
                        end
                        'h2:begin
                            ram_addr_ex <= 'h6;
                        end
                        'h3:begin
                            ram_addr_ex <= 'h7;
                        end
                        default:begin
                            ram_addr_ex <= 'h0;
                        end
                    endcase
                end
                'h3: begin
                    case(write_data_reg[0 +: 2])
                        'h0:begin
                            ram_addr_ex <= 'h8;
                        end
                        'h1:begin
                            ram_addr_ex <= 'h9;
                        end
                        'h2:begin
                            ram_addr_ex <= 'ha;
                        end
                        'h3:begin
                            ram_addr_ex <= 'hb;
                        end
                        default:begin
                            ram_addr_ex <= 'h0;
                        end
                    endcase
                end
                // 'h8:begin
                //     case(write_data_reg[0 +: 4])
                //         'h0:begin
                //             ram_addr_ex <= 'hc;
                //         end
                //         'h1:begin
                //             ram_addr_ex <= 'hd;
                //         end
                //         'h2:begin
                //             ram_addr_ex <= 'he;
                //         end
                //         'h3:begin
                //             ram_addr_ex <= 'hf;
                //         end
                //         default:begin
                //             ram_addr_ex <= 'h0;
                //         end
                //     endcase
                // end
                default: begin
                    ram_addr_ex <= 'h0;
                end
            endcase
        end
    end



    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            wr_en <= 'h0;
            ram_addr <= 'h0;
            ram_din <= 'h0;
            ram_target <= 'h0;
        end else if (write_enable_reg) begin
            wr_en <= 'h1;
            ram_addr <= ram_addr_ex;
            ram_din <= 'h1;
            ram_target <= write_target_reg;
        end else begin
            wr_en <= 'h0;
            ram_addr <= ram_addr;
            ram_din <= ram_din;
            ram_target <= ram_target;
        end
    end

    always @(posedge clk or rstn) begin
        if(!rstn) begin
            wr_del <= 'b0;
            compare_addr <= 'h0;
        end else if(write_delete_reg) begin
            wr_del <= 'b1;
            compare_addr <= compare_addr_ex;
        end else begin
            wr_del <= 'b0;
            compare_addr <= compare_addr_ex;
        end
    end

    ram_dp#(.DATA_WIDTH('b1),
            .ADDR_WIDTH(ADDR_WIDTH))
    ram_lut(.clk(clk),
            .rstn(rstn),
            .a_we(wr_del),
            .a_addr(compare_addr),
            .a_din('b0),
            .a_dout(match),
            .b_we(wr_en),
            .b_addr(ram_addr),
            .b_din(ram_din),
            .b_dout(ram_dout));

    //存放每个ID对应的slv_w_target
    ram_dp#(.DATA_WIDTH(CAM_TARGET_WIDTH),
            .ADDR_WIDTH(ADDR_WIDTH))
    target_store(.clk(clk),
            .rstn(rstn),
            .a_we(wr_del),
            .a_addr(compare_addr),
            .a_din('h0),
            .a_dout(match_target),
            .b_we(wr_en),
            .b_addr(ram_addr),
            .b_din(ram_target),
            .b_dout(ram_target_dout));

endmodule

