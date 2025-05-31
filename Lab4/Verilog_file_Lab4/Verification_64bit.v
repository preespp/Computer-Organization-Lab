`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2024 07:35:41 PM
// Design Name: 
// Module Name: Verification_64bit
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


module Verification_64bit(c_out, sum, a, b, c_in);

    input [63:0] a;
    input [63:0] b;
    input c_in;
    output [63:0] sum;
    output c_out;
   
    assign {c_out, sum} = a + b + c_in;
    
endmodule
