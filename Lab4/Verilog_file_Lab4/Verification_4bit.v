`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2024 05:35:02 PM
// Design Name: 
// Module Name: Verification_4bit
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


module Verification_4bit(c_out, sum, a, b, c_in);

	input	 [3:0]a;
	input [3:0]b;
	input c_in; //declare inputs a, b, and c_in
	output c_out;
	output [3:0]sum; //declare outputs c_out and sum

	assign {c_out, sum} = a + b + c_in;
	
endmodule
