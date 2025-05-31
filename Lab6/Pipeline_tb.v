`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:34:40 10/16/2015
// Design Name:   Pipeline
// Module Name:   C:/Users/Ethan/Desktop/Pre_Lab6/Pre_Lab6/Pipeline_tb.v
// Project Name:  Pre_Lab6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Pipeline
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Pipeline_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [31:0] InstrIn;

	// Outputs
	wire [31:0] Out;

	// Instantiate the Unit Under Test (UUT)
	Pipeline uut (
		.clk(clk), 
		.rst(rst), 
		.InstrIn(InstrIn), 
		.Out(Out)
	);

	// Define clk
	always #5 assign clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		InstrIn = 0;

		// Wait 10 ns for global reset to finish
		#10;
		rst = 0;
		// Initiliaze in n bit register r0 = 0 r1 = 10 
	//	InstrIn = 32'b000000_00000_00000_00000_00000000000;				// Do nothing
		
		#30;      
		InstrIn = 32'b011011_00001_00001_0000000000001010;              // I type, ADDI r1 with 0000000A => r1 =00000014
		
		#30;
        InstrIn = 32'b011110_00010_00010_0000000000000010;              // I type, SUBI r2 with 00000002 => r2 =00000012
        
        #30;
        InstrIn = 32'b010011_00011_00001_00010_00000000000;             // R type, ADD r1(00000014) with r2(00000012) => r3 = 00000026
        
        #30;
        InstrIn = 32'b010110_00100_00001_00010_00000000000;             // R type, SUB r1(00000014) from r2(00000012) => r4 = 00000002
        
        #30;
        InstrIn = 32'b010000_00001_00000_0000000000000000;             // I type, MOV r0 => r1 r1 = 0
        
        #30;
        InstrIn = 32'b010001_00001_00000_0000000000000000;            // I type not r0 => r1 r1 = ffffffff

        #30;
        InstrIn = 32'b010100_00101_00001_00000_00000000000;             // R type, Nor r0,r1 => r5 = 0

        #30;
        InstrIn = 32'b010101_00100_00001_00001_00000000000;             // R type, Nand r1, r1 => r4 = 0
        
        #30;
        InstrIn = 32'b010010_00110_00001_00010_00000000000;             // R type, And r1,r2 => r6 = 00000012
        
        #30;
        InstrIn = 32'b010111_00001_00100_00110_00000000000;             // R type, Slt r4,r6 => r1 = 1


	end
      
endmodule

