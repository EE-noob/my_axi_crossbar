`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/15 23:12:50
// Design Name: 
// Module Name: rd_addr_cac_96M
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



module async_rd_addr_cac#( parameter ADDR_SIZE = 4)
                   (rd_clk, rd_en, rd_rstn, wr_addr_gray,
                    rd_addr_gray, rd_addr, empty);
    input rd_clk;
    input rd_en;
    input rd_rstn;
    input [ADDR_SIZE : 0] wr_addr_gray;
    output reg [ADDR_SIZE : 0] rd_addr_gray;
    output reg empty; 
    output [ADDR_SIZE - 1 : 0] rd_addr;
    
    reg [ADDR_SIZE : 0] wr_addr_rsyn1 ;
    reg [ADDR_SIZE : 0] wr_addr_rsyn2 ;

    wire  rd_vld;
    reg  [ADDR_SIZE : 0] rd_addr_binary;
    wire [ADDR_SIZE : 0] rd_addr_binary_next;
    wire [ADDR_SIZE : 0] rd_addr_gray_next;
    wire empty_next;

    always @(posedge rd_clk) begin
        if(!rd_rstn) begin
            wr_addr_rsyn1 <= 'b0;
            wr_addr_rsyn2 <= 'b0;
        end
        else begin
            wr_addr_rsyn1 <= wr_addr_gray;
            wr_addr_rsyn2 <= wr_addr_rsyn1;
        end
    end

    assign rd_vld = (~empty)&&rd_en;
    assign rd_addr = rd_addr_binary[ADDR_SIZE - 1: 0];
    assign rd_addr_binary_next = rd_addr_binary + rd_vld;
    assign rd_addr_gray_next = (rd_addr_binary_next >> 1) ^ rd_addr_binary_next;
    assign empty_next = (rd_addr_binary_next == wr_addr_rsyn2);

    
    always@(posedge rd_clk or negedge rd_rstn) begin
        if(!rd_rstn) begin
            rd_addr_binary <= 'b0;
            rd_addr_gray   <= 'b0;
        end else begin
            rd_addr_binary <= rd_addr_binary_next;
            rd_addr_gray   <= rd_addr_gray_next;
        end
    end

    always @(posedge rd_clk or negedge rd_rstn) begin
        if(!rd_rstn) begin
            empty <= 'b0;
        end else begin
            empty <= empty_next;
        end
    end
    
    
endmodule