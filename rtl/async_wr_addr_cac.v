`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/15 23:07:58
// Design Name: 
// Module Name: wr_addr_cac_96M
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



module async_wr_addr_cac #(parameter ADDR_SIZE = 4 )
                    ( wr_clk, wr_en, wr_rstn, rd_addr_gray,
                      wr_addr, wr_addr_gray, full);
    input wr_clk;
    input wr_en;
    input wr_rstn; 
    input [ADDR_SIZE : 0] rd_addr_gray;
    output [ADDR_SIZE - 1 : 0] wr_addr;
    output reg [ADDR_SIZE : 0] wr_addr_gray;
    output reg full;

    reg [ADDR_SIZE : 0 ]  rd_addr_rsyn1;
    reg [ADDR_SIZE : 0 ]  rd_addr_rsyn2;

    wire wr_vld;
    reg [ADDR_SIZE : 0] wr_addr_binary;
    wire [ADDR_SIZE : 0] wr_addr_binary_next;
    wire [ADDR_SIZE : 0] wr_addr_gray_next;

    wire full_next;

    always @(posedge wr_clk or negedge wr_rstn) begin
        if(!wr_rstn) begin
            rd_addr_rsyn1 <= 'b0;
            rd_addr_rsyn2 <= 'b0;
        end
        else begin
            rd_addr_rsyn1  <= rd_addr_gray;
            rd_addr_rsyn2  <= rd_addr_rsyn1;
        end
    end       


    always @(posedge wr_clk or negedge wr_rstn) begin
        if(!wr_rstn) begin
            wr_addr_binary <= 'b0;
            wr_addr_gray <= 'b0;
        end else begin
            wr_addr_binary <= wr_addr_binary_next;
            wr_addr_gray <= wr_addr_gray_next;
        end
    end

    assign wr_vld = (~full) && wr_en;
    assign wr_addr = wr_addr_binary[ADDR_SIZE - 1 : 0];
    assign wr_addr_binary_next = wr_addr_binary + (wr_vld);
    assign wr_addr_gray_next = (wr_addr_binary_next >> 1) ^ wr_addr_binary_next;
        
    assign full_next = (wr_addr_gray_next == {~rd_addr_rsyn2[ADDR_SIZE : ADDR_SIZE - 1] , rd_addr_rsyn2[ADDR_SIZE - 2 : 0]});

    always @ (posedge wr_clk) begin
        if(!wr_rstn) begin
            full <= 1'b0;
        end else begin 
            full <= full_next;
        end

    end
    
    
endmodule
