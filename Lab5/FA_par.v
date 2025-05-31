`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2024 01:44:51 PM
// Design Name: 
// Module Name: FA_par
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


module FA_par #(parameter n = 8) (c_out, a, b, sum, c_in);

input c_in;
input  [n-1:0] a, b;
output  [n-1:0] sum;
output c_out;

wire [n:0]carry;
assign  carry[0] = c_in;
assign c_out = carry[n];
genvar i;
generate
    for (i=0; i<n; i=i+1)
    begin
        FA_str full(carry[i+1],sum[i], a[i], b[i], carry[i]);
    end
endgenerate


endmodule
