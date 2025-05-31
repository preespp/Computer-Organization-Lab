`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2024 07:12:21 PM
// Design Name: 
// Module Name: Sixty_Four_bit_RCA
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


module Sixty_Four_bit_RCA(c_out, sum, a, b, c_in);
    
    input [63:0] a;
    input [63:0] b;
    input c_in;
    output [63:0] sum;
    output c_out;
    
    wire c_out_1;
    
    Thirtytwo_bit_RCA      BigRCA1     (c_out_1, sum[31:0], a[31:0], b[31:0], c_in);
    Thirtytwo_bit_RCA      BigRCA2     (c_out, sum[63:32], a[63:32], b[63:32], c_out_1);
    
endmodule
