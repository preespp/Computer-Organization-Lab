`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2024 05:27:00 PM
// Design Name: 
// Module Name: Four_bit_FA_tb
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


module Four_bit_FA_tb();

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg c_in;
	
	reg clk;

	// Outputs
	wire c_out;
	wire [3:0]sum;
	wire c_out_verify;
	wire [3:0] sum_verify;
	wire error_flag;


	// Instantiate the Unit Under Test (UUT)
	Four_bit_FA FourFA(
		.c_out(c_out), 
		.sum(sum), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);
	
	// Verification module
	Verification_4bit VerificationFour (
		.c_out(c_out_verify), 
		.sum(sum_verify), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);
	
	// Assign Error_flag
	assign error_flag = (c_out != c_out_verify || sum != sum_verify);
	
	// Verification logic
	always@(posedge clk)
		begin
		if(error_flag)
			// Use $display here instead of $monitor
			// $monitor will display the message whenever there's a change of a, b, c_in
			// $display will only display once when it's been executed
			$display("Error occurs when a = %d, b = %d, c_in = %d\n", a, b, c_in);
		end
		
	// Derfine clk signal for Verfication purpose
	always #5 clk = ~clk;
	// for all possible input
	always #10 a[0] = ~a[0];
	always #20 a[1] = ~a[1];
	always #40 a[2] = ~a[2];
	always #80 a[3] = ~a[3];
	always #160 b[0] = ~b[0];
	always #320 b[1] = ~b[1];
	always #640 b[2] = ~b[2];
	always #1280 b[3] = ~b[3];
	always #2560 c_in = ~c_in;

	initial begin
		// Initialize Inputs
		clk = 0;
		
		a = 0;
		b = 0;
		c_in = 1;


	end

endmodule
