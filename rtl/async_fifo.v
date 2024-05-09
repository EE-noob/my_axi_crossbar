`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/15 23:07:58
// Design Name: 
// Module Name: Async_FIFO_96M
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



module Async_FIFO#(parameter DATA_WIDTH = 16, parameter ADDR_SIZE = 4) 
                  ( wr_clk, rd_clk, wr_rstn, rd_rstn, rd_en, wr_en, din,
                   full, empty, dout);
      input wr_clk;
      input rd_clk;
      input wr_rstn;
      input rd_rstn;
      input rd_en;
      input wr_en;
      input [DATA_WIDTH - 1 : 0] din;
      output full;
      output empty;
      output [DATA_WIDTH - 1 : 0] dout;      
      

      wire [ADDR_SIZE : 0] rd_addr_gray;
      wire [ADDR_SIZE : 0] wr_addr_gray;
      wire [ADDR_SIZE - 1 : 0] wr_addr;
      wire [ADDR_SIZE - 1 : 0] rd_addr;

      async_wr_addr_cac#(.ADDR_SIZE(ADDR_SIZE))
            wr_addr_cac(.wr_clk(wr_clk), 
                        .wr_en(wr_en), 
                        .wr_rstn(wr_rstn), 
                        .rd_addr_gray(rd_addr_gray),
                        .wr_addr(wr_addr), 
                        .wr_addr_gray(wr_addr_gray), 
                        .full(full));

      async_rd_addr_cac#(.ADDR_SIZE(ADDR_SIZE))
            rd_addr_cac(.rd_clk(rd_clk), 
                        .rd_en(rd_en), 
                        .rd_rstn(rd_rstn), 
                        .wr_addr_gray(wr_addr_gray),
                        .rd_addr_gray(rd_addr_gray), 
                        .rd_addr(rd_addr), 
                        .empty(empty));
      
      dual_ram#(.DATA_WIDTH(DATA_WIDTH), .ADDR_SIZE(ADDR_SIZE))
            fifo_ram(.wr_clk(wr_clk), 
                     .wr_rstn(wr_rstn), 
                     .wr_en(wr_en), 
                     .full(full), 
                     .wr_addr(wr_addr), 
                     .wr_data(din), 
                     .rd_clk(rd_clk), 
                     .rd_addr(rd_addr),
                     .rd_data(dout));


endmodule
