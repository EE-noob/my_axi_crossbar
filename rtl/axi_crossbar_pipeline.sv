`timescale 1ps/1ps
`default_nettype none

module axi_crossbar_pipeline#(parameter DATA_BUS_W = 16,
                              parameter PIPELINE_NB = 1)
                             (aclk, aresetn, srst, i_valid, i_data, o_ready,
                              o_valid, o_data, i_ready);
    input  wire  aclk;
    input  wire  aresetn;
    input  wire  srst;
    input  wire  i_valid;
    input  wire  [DATA_BUS_W - 1 : 0] i_data;
    input  wire  o_ready;
    output logic o_valid;
    output logic [DATA_BUS_W - 1 : 0] o_data;
    output logic i_ready;

    generate
        if(PIPELINE_NB == 0) begin : NO_PIPELINE
            assign o_valid = i_valid;
            assign o_data = i_data;
            assign i_ready = o_ready;
        end else if(PIPELINE_NB == 1) begin : ONE_STAGE_PIPELINE
            logic full;

            always @(posedge aclk or negedge aresetn) begin
                if(!aresetn) begin
                    o_valid <= 'b0;
                    o_data  <= 'b0;
                end else if (srst) begin
                    o_valid <= 'b0;
                    o_data  <= 'b0;
                end else if(!full) begin
                //slv_if/mst_if的sync都能在pull拉高的下一个周期输出下一个读指针的结果
                    o_valid <= i_valid;
                    o_data  <= i_data;
                end else begin
                    o_valid <= o_valid;
                    o_data  <= o_data;
                end
            end

            assign full = (o_valid && (~o_ready));
            assign i_ready = !full;
        end else begin : N_STAGE_PIPELINE
            logic pipe_valid;
            logic pipe_ready;
            logic [DATA_BUS_W - 1 : 0] pipe_data;

            axi_crossbar_pipeline#(.DATA_BUS_W(DATA_BUS_W),
                                   .PIPELINE_NB(1))
                            pipe_n(.aclk(aclk), 
                                   .aresetn(aresetn), 
                                   .srst(srst), 
                                   .i_valid(i_valid), 
                                   .i_data(i_data), 
                                   .o_ready(pipe_ready),
                                   .o_valid(pipe_valid), 
                                   .o_data(pipe_data), 
                                   .i_ready(i_ready));

            axi_crossbar_pipeline#(.DATA_BUS_W(DATA_BUS_W),
                                   .PIPELINE_NB(PIPELINE_NB - 1))
                          pipe_n_1(.aclk(aclk), 
                                   .aresetn(aresetn), 
                                   .srst(srst), 
                                   .i_valid(pipe_valid), 
                                   .i_data(pipe_data), 
                                   .o_ready(o_ready),
                                   .o_valid(o_valid), 
                                   .o_data(o_data), 
                                   .i_ready(pipe_ready));
        end
    endgenerate

endmodule

`resetall           