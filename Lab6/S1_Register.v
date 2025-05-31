`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:51:40 10/16/2015 
// Design Name: 
// Module Name:    S1_Register 
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
module S1_Register(
	input clk,
	input rst,
	input [31:0] InstrIn,
	output reg [4:0] S1_ReadSelect1,
	output reg [4:0] S1_ReadSelect2,
	output reg [4:0] S1_WriteSelect,
	output reg S1_WriteEnable,
	
	//added outputs
	output reg [31:0] S1_IMM,
	output reg S1_Data_Source,
    output reg [2:0] S1_ALU_OP
   );
    
    
	always@(posedge clk)
		begin
		if (rst)
			begin
			S1_ReadSelect1 <= 5'd0;
			S1_ReadSelect2 <= 5'd0;
			S1_WriteSelect <= 5'd0;
			S1_WriteEnable <= 1'b0;
			
			//new
			S1_IMM <= 0;
            S1_Data_Source <= 0;  //1 if immediate
            S1_ALU_OP <= 0;
			end
		else
			begin
			S1_ReadSelect1 <= InstrIn[20:16];
			S1_ReadSelect2 <= InstrIn[15:11];
			S1_WriteSelect <= InstrIn[25:21];
			S1_WriteEnable <= 1'b1;
			
			//new
			S1_IMM <= InstrIn[15:0];
            S1_Data_Source <= InstrIn[29];  //1 if immediate
            S1_ALU_OP <= InstrIn[28:26];
			end
		end

endmodule
