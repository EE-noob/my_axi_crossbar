`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/15 23:07:58
// Design Name: 
// Module Name: REG_DUAL_RAM_96M
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



module dual_ram#(parameter DATA_WIDTH = 16, parameter ADDR_SIZE = 4)
                (wr_clk, wr_rstn, wr_en, full, wr_addr, wr_data, rd_clk, rd_addr,
                 rd_data);
        input wr_clk, rd_clk;
        input wr_rstn;
        input wr_en;
        input full;
        input [ADDR_SIZE - 1 : 0] wr_addr;
        input [ADDR_SIZE - 1 : 0] rd_addr;
        input [DATA_WIDTH - 1 : 0] wr_data;
        output [DATA_WIDTH - 1 : 0] rd_data;

        reg [DATA_WIDTH - 1 : 0] mem [(1 << (ADDR_SIZE)) - 1 : 0];

        integer i;
        always @(posedge wr_clk or negedge wr_rstn) begin
            if(!wr_rstn)begin
                for(i = 0; i < (1 << ADDR_SIZE); i = i + 1) begin:MEM_INITIAL_96M
                    mem[i] <= 'b0;
                end
            end
            else if(wr_en && ~full) begin
                mem[wr_addr] <= wr_data;
            end
            else begin
                for(i = 0; i < (1 << ADDR_SIZE); i = i + 1) begin:MEM_RELOAD_96M
                    mem[i] <= mem[i];
                end
            end
        end

        assign rd_data = mem[rd_addr];
        

endmodule
