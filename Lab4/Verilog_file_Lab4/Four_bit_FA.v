`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2024 05:19:21 PM
// Design Name: 
// Module Name: Four_bit_FA
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


module Four_bit_FA(c_out, sum, a, b, c_in);

    input [3:0] a;
    input [3:0] b;
    input c_in;
    output [3:0] sum;
    output c_out;
    
    wire c_out_1, c_out_2, c_out_3;
    
    FA_str      FA1     (c_out_1, sum[0], a[0], b[0], c_in);
    FA_str      FA2     (c_out_2, sum[1], a[1], b[1], c_out_1);
    FA_str      FA3     (c_out_3, sum[2], a[2], b[2], c_out_2);
    FA_str      FA4     (c_out, sum[3], a[3], b[3], c_out_3);
    
    
endmodule
