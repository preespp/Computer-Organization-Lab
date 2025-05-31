`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:19:01 10/16/2015 
// Design Name: 
// Module Name:    Pipeline 
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
module Pipeline(
	input clk,
	input rst,
	input [31:0] InstrIn,
	output [31:0] Out
   );


	// The naming format for wire: Source_Destination_portname
	//wires out of stage 1 
	wire [4:0] S1_Reg_ReadSelect1;
	wire [4:0] S1_Reg_ReadSelect2;
	wire [31:0] S1_S2_IMM;
	wire S1_S2_Data_Source;
	wire [2:0] S1_S2_ALU_OP;
	wire [4:0] S1_S2_WriteSelect;
	wire S1_S2_WriteEnable;
	
	//wires out of reg
	wire [31:0] Reg_S2_ReadData1;
	wire [31:0] Reg_S2_ReadData2;
	
	//wires out of stage 2
	wire [4:0] S2_S3_WriteSelect;
	wire S2_S3_WriteEnable;
	
	//wires for mux
	wire [31:0] RD2, IMM;
	wire DataSource;
	wire [2:0] op;
	
	// Wires for ALU
	wire [31:0] R2, R3, R1;
	
	//wires out of stage3
    wire [4:0] S3_Reg_WriteSelect;
    wire S3_Reg_WriteEnable;

	S1_Register S1_Reg(
		.clk(clk),
		.rst(rst),
		.InstrIn(InstrIn),
		.S1_ReadSelect1(S1_Reg_ReadSelect1),
		.S1_ReadSelect2(S1_Reg_ReadSelect2),
		.S1_WriteSelect(S1_S2_WriteSelect),
		.S1_WriteEnable(S1_S2_WriteEnable),
		.S1_IMM(S1_S2_IMM),
		.S1_Data_Source(S1_S2_Data_Source),
		.S1_ALU_OP(S1_S2_ALU_OP)
   );


	nbit_register_file Register_File (
		.write_data(Out),								
		.read_data_1(Reg_S2_ReadData1),
		.read_data_2(Reg_S2_ReadData2),
		.read_sel_1(S1_Reg_ReadSelect1),
		.read_sel_2(S1_Reg_ReadSelect2),
		.write_address(S3_Reg_WriteSelect),
		.RegWrite(S3_Reg_WriteEnable),
		.clk(clk)
	);
		
	
	S2_Register S2_Reg(
		.clk(clk),
		.rst(rst),
		.Reg_ReadData1(Reg_S2_ReadData1),
		.Reg_ReadData2(Reg_S2_ReadData2),
		.S1_WriteSelect(S1_S2_WriteSelect),
		.S1_WriteEnable(S1_S2_WriteEnable),
		.S2_ReadData1(R2),
		.S2_ReadData2(RD2),
		.S2_WriteSelect(S2_S3_WriteSelect),
		.S2_WriteEnable(S2_S3_WriteEnable),
		.S1_IMM(S1_S2_IMM),
		.S1_Data_Source(S1_S2_Data_Source),
		.S1_ALU_OP(S1_S2_ALU_OP),
		.S2_IMM(IMM),
		.S2_Data_Source(DataSource),
		.S2_ALU_OP(op)
   );
   
   R3_Mux mux (
        .S2_ReadData2(RD2),
        .S2_IMM(IMM),
        .S2_Data_Source(DataSource),
        .R3(R3)
   );
   
   ALU #(32) alu1 (
        .R1(R1),
        .R2(R2),
        .R3(R3),
        .S2_ALU_OP(op),
        .clk(clk)
   );
   
   S3_Register S3_Reg(
        .clk(clk),
        .rst(rst),
        .R1(R1),
        .S2_WriteSelect(S2_S3_WriteSelect),
        .S2_WriteEnable(S2_S3_WriteEnable),
        .ALU_OUT(Out),
        .S3_WriteSelect(S3_Reg_WriteSelect),
        .S3_WriteEnable(S3_Reg_WriteEnable)
   );


endmodule
