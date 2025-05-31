`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2024 05:22:29 PM
// Design Name: 
// Module Name: Sixty_Four_bit_CSA
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


module Sixty_Four_bit_CSA(
    input [63:0] a,
    input [63:0] b,
    input c_in,
    output [63:0] sum,
    output c_out
    );
    
    wire carryselect;
    wire cout0, cout1;  //couts assuming carryselect is 0/1
    wire [31:0] sum0, sum1; //secodn half sums assuming carryselect is 0/1
    
    //RCA for first half
    Thirtytwo_bit_RCA BigRCA1 (carryselect, sum[31:0], a[31:0], b[31:0], c_in);
    
    //RCA assuming carryselect is 0
    Thirtytwo_bit_RCA BigRCA2 (cout0, sum0, a[63:32], b[63:32], 0);
    //RCA assuming carryselect is 1
    Thirtytwo_bit_RCA BigRCA3 (cout1, sum1, a[63:32], b[63:32], 1);
    
    //mux to select the right outputs for second half
    //if carryselect is 1 then choose the outputs that assumed carry select is 1
    //else carryselect is 0 so choose the outputs that assumed carry select is 0
    assign sum[63:32] = carryselect ? sum1 : sum0;
    assign c_out = carryselect ? cout1 : cout0;
    
endmodule
