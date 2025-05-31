`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2024 07:39:10 PM
// Design Name: 
// Module Name: Sixty_Four_bit_RCA_tb
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


module Sixty_Four_bit_RCA_tb();

	// Inputs
	reg [63:0] a;
	reg [63:0] b;
	reg c_in;
	
	reg clk;

	// Outputs
	wire c_out;
	wire [63:0]sum;
	wire c_out_verify;
	wire [63:0] sum_verify;
	wire error_flag;


	// Instantiate the Unit Under Test (UUT)
    Sixty_Four_bit_RCA HugeRCA(
		.c_out(c_out), 
		.sum(sum), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);
	
	// Verification module
	Verification_64bit VerificationHuge (
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
	// for randomizing the possible inputs
	//always #10 a[0] = ~a[0];
	//always #20 a[4] = ~a[4];
	//always #40 a[6] = ~a[6];
	//always #80 b[9] = ~b[9];
	//always #160 b[10] = ~b[10];
	//always #320 b[2] = ~b[2];
	//always #640 c_in = ~c_in;

	initial begin
		// Initialize Inputs
		clk = 0;
		
		//case force carry out
		a = 64'hFFFFFFFFFFFFFFFF;
		b = 56;
		c_in = 1;
		
		// case Random Large A&B
		#130
		a = 64'hFFFFFF35FFFFFFFF;
		b = 64'hFFFFF5FA0000FFFF;
		c_in = 1;
		
		#130
		a = 64'hFFFFFFFFFFFFFFFA;
		b = 64'hFEBFFFFFFF33742F;
		c_in = 0;
		
		// case Random Small A&B
		#130
		a = 64'hBCD;
		b = 64'hA34;
		c_in = 1;
		
		#130
		a = 64'h3958;
		b = 64'h362;
		c_in = 0;

        // random condition
        
        #130
		a = 64'hFFF34343F4EAFA;
		b = 64'hF0000EB33742F;
		c_in = 0;
		
        #130
        a = 64'hFFA;
		b = 64'h25369;
		c_in = 0;
		
        #130
        a = 64'h0;
		b = 64'hF;
		c_in = 1;    
	end





endmodule
