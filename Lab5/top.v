`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2024 01:47:47 PM
// Design Name: 
// Module Name: top
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


module top #(parameter n = 8)(op_code, a, b, c_in, clk, q);

input c_in, clk;
input [n-1:0] a;
input [n-1:0] b;
input op_code;
output [n-1:0] q;

    wire c_out;
    wire [n-1:0] sum;
    wire [n-1:0] not_a;
    wire [n-1:0] final;

    FA_par #(n) first (c_out, a, b, sum, c_in);
    
    not_bitwise_par #(n) not_s (a, not_a);
    
    assign final = op_code ? sum : not_a;
    
    register #(n) register1 (q, final, clk);
    
endmodule
