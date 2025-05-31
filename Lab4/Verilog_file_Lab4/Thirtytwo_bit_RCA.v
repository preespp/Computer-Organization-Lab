`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2024 07:20:34 PM
// Design Name: 
// Module Name: Thirtytwo_bit_RCA
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


module Thirtytwo_bit_RCA(c_out, sum, a, b, c_in);
    
    input [31:0] a;
    input [31:0] b;
    input c_in;
    output [31:0] sum;
    output c_out;
    
    wire c_out_1, c_out_2, c_out_3, c_out_4, c_out_5, c_out_6, c_out_7;
    
    // 8 x 4-bit RCA to result in 32-bit of sum
    
    Four_bit_FA      RCA1     (c_out_1, sum[3:0], a[3:0], b[3:0], c_in);
    Four_bit_FA      RCA2     (c_out_2, sum[7:4], a[7:4], b[7:4], c_out_1);
    Four_bit_FA      RCA3     (c_out_3, sum[11:8], a[11:8], b[11:8], c_out_2);
    Four_bit_FA      RCA4     (c_out_4, sum[15:12], a[15:12], b[15:12], c_out_3);
    Four_bit_FA      RCA5     (c_out_5, sum[19:16], a[19:16], b[19:16], c_out_4);
    Four_bit_FA      RCA6     (c_out_6, sum[23:20], a[23:20], b[23:20], c_out_5);
    Four_bit_FA      RCA7     (c_out_7, sum[27:24], a[27:24], b[27:24], c_out_6);
    Four_bit_FA      RCA8     (c_out, sum[31:28], a[31:28], b[31:28], c_out_7);
    
endmodule
