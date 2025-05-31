`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2024 01:40:05 PM
// Design Name: 
// Module Name: register
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


module register #(parameter n = 8) (q, d, clk);

input clk;
input [n-1:0] d;
output [n-1:0] q;

genvar i;
generate
    for (i = 0; i<n; i=i+1)
    begin:registerblk
        dff one(q[i],d[i],clk);
    end
endgenerate


endmodule
