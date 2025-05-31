`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2024 07:56:17 PM
// Design Name: 
// Module Name: not_bitwise_par
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


module not_bitwise_par #(parameter n = 8)(in,out);

input [n-1:0] in;
output [n-1:0] out;

genvar i;
generate
    for (i=0; i<n; i=i+1)
    begin
        not_s not_s1(out[i],in[i]);
    end
endgenerate

endmodule
