`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/06 22:36:18
// Design Name: 
// Module Name: ram_dp
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


module ram_dp#(parameter  CAM_DATA_WIDTH = 8,
               parameter  CAM_ADDR_WIDTH = 3)
              (input clk,
               input rstn,
               //port A
               input a_we,
               input [CAM_ADDR_WIDTH - 1 : 0] a_addr,
               input [CAM_DATA_WIDTH - 1 : 0] a_din,
               output [CAM_DATA_WIDTH - 1 : 0] a_dout,

               //port B
               input b_we,
               input [CAM_ADDR_WIDTH - 1 : 0] b_addr,
               input [CAM_DATA_WIDTH - 1 : 0] b_din,
               output [CAM_DATA_WIDTH - 1 : 0] b_dout);
    
    reg [CAM_DATA_WIDTH - 1 : 0] a_dout_reg;
    reg [CAM_DATA_WIDTH - 1 : 0] b_dout_reg;

    reg [CAM_DATA_WIDTH - 1 : 0] mem [(1<<CAM_ADDR_WIDTH) - 1 : 0];

    assign a_dout = a_dout_reg;
    assign b_dout = b_dout_reg;

    integer i;

    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            for(i = 0; i < (1<<CAM_ADDR_WIDTH) ; i = i +1 ) begin
                mem[i] <= 'd0;
            end
            a_dout_reg <= 'd0;
            b_dout_reg <= 'd0;
        end
        else if(a_we && !b_we) begin
            mem[a_addr] <= a_din;
            a_dout_reg <= a_din;
            b_dout_reg <= mem[b_addr];
        end
        else if (b_we && !a_we) begin
            mem[b_addr] <= b_din;
            a_dout_reg <= mem[a_addr];
            b_dout_reg <= b_din;
        end
        else if(a_we && b_we) begin
            mem[a_addr] <= a_din;
            mem[b_addr] <= b_din;
            a_dout_reg <= a_din;
            b_dout_reg <= b_din;
        end
        else begin
            for(i = 0; i < (1<<CAM_ADDR_WIDTH) ; i = i +1 ) begin
                mem[i] <= mem[i];
            end
            a_dout_reg <= mem[a_addr];
            b_dout_reg <= mem[b_addr];
        end
    end 


endmodule
