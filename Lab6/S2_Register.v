`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:12:43 10/16/2015 
// Design Name: 
// Module Name:    S2_Register 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module S2_Register(
	input clk,
	input rst,
	input [31:0] Reg_ReadData1,
	input [31:0] Reg_ReadData2,
	input [4:0] S1_WriteSelect,
	input S1_WriteEnable,
	output reg [31:0] S2_ReadData1,
	output reg [31:0] S2_ReadData2,
	output reg [4:0] S2_WriteSelect,
	output reg S2_WriteEnable,
	
	//add inputs/outputs
	input [31:0] S1_IMM, 
	input S1_Data_Source,
	input [2:0] S1_ALU_OP,
	output reg [31:0] S2_IMM, 
	output reg S2_Data_Source,
	output reg [2:0] S2_ALU_OP
   );

	always@(posedge clk)
		begin
		if (rst)
			begin
			S2_ReadData1	<= 32'd0;
			S2_ReadData2	<= 32'd0;
			S2_WriteSelect  <= 5'd0;
			S2_WriteEnable  <= 1'b0;
			
			//new
			S2_IMM <= 0;
            S2_Data_Source <= 0;
            S2_ALU_OP <= 0;
			end
		else
			begin
			S2_ReadData1	<= Reg_ReadData1;
			S2_ReadData2	<= Reg_ReadData2;
			S2_WriteSelect <= S1_WriteSelect;
			S2_WriteEnable <= S1_WriteEnable;
			
			//new
			S2_IMM <= S1_IMM;
            S2_Data_Source <= S1_Data_Source;
            S2_ALU_OP <= S1_ALU_OP;
			end
		end

endmodule

