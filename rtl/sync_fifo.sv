`timescale 1ps/1ps
`default_nettype none

module sync_fifo#(parameter ADDR_WIDTH = 4,
                  parameter DATA_WIDTH = 16)
                 (aclk, aresetn, srst, data_in, push, pull,
                  full, empty, data_out);
    input  wire aclk;
    input  wire aresetn;
    input  wire srst;
    input  wire push;
    input  wire pull;
    input  wire [DATA_WIDTH - 1 : 0] data_in;
    output wire full;
    output wire empty;
    output wire [DATA_WIDTH - 1 : 0] data_out;

    logic wr_en;
    logic [ADDR_WIDTH : 0] wr_ptr;
    logic [ADDR_WIDTH : 0] rd_ptr;
    logic empty_next;
    logic full_next;
    logic [DATA_WIDTH - 1 : 0] data_fifo;


    //write pointer caculator
    always @(posedge aclk or negedge aresetn) begin
        if(!aresetn) begin
            wr_ptr <= 'b0;
        end else if(srst) begin
            wr_ptr <= 'b0;
        end else if(push && !full_next) begin
            wr_ptr <= wr_ptr + 1;
        end else begin
            wr_ptr <= wr_ptr;
        end
    end

    //read pointer caculator
    always @(posedge aclk or negedge aresetn) begin
        if(!aresetn) begin
            rd_ptr <= 'b0;
        end else if(srst) begin
            rd_ptr <= 'b0;
        end else if(pull && !empty_next) begin
            rd_ptr <= rd_ptr + 1;
        end else begin
            rd_ptr <= rd_ptr;
        end
    end

    assign wr_en = push && !full_next;
    assign empty_next = wr_ptr == rd_ptr;
    assign full_next = (wr_ptr[ADDR_WIDTH] == !rd_ptr[ADDR_WIDTH]) && (wr_ptr[0 +: ADDR_WIDTH] == rd_ptr[0 +: ADDR_WIDTH]);

    sync_fifo_ram #(.ADDR_WIDTH(ADDR_WIDTH),
                    .DATA_WIDTH(DATA_WIDTH)) 
           sync_ram(.aclk(aclk),
                    .aresetn(aresetn),
                    .srst(srst),
                    .wr_en(wr_en),
                    .addr_in(wr_ptr),
                    .data_in(data_in),
                    .addr_out(rd_ptr),
                    .data_out(data_fifo));
    
    assign empty = empty_next;
    assign full = full_next;
    assign data_out = data_fifo;

endmodule

`resetall