`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2024 05:20:48 PM
// Design Name: 
// Module Name: ALU
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


module ALU #(parameter n = 32)(op_code, R3, R2, R0,c_out, clk, zero,overflow);

input  signed [n-1:0] R2;
input  signed [n-1:0] R3;
input [2:0] op_code;
input clk;
output signed [n-1:0] R0;
output c_out,zero,overflow;

    wire c_out_1, c_out_2,c_out_3;
    wire [n-1:0] R1_0;  //MOV
    wire [n-1:0] R1_1;  //NOT
    wire [n-1:0] R1_2;  //ADD
    wire [n-1:0] R1_3;  //NOR
    wire signed [n-1:0] R1_4;  //SUB
    wire [n-1:0] R1_5;  //NAND
    wire [n-1:0] R1_6;  //AND
    wire [n-1:0] R1_7;  //SLT
    wire [n-1:0] R1;
    wire zero_1;
    reg overflow_add, overflow_sub;
    wire overflow_1;
    
    //overflow calculation
    always@*
    begin
        if ((R2 > 0 && R3 >0 && R1_2 <= 0) || (R2 < 0 && R3 < 0 && R1_2 >=0))
            overflow_add = 1;
        else
            overflow_add = 0;
    end
    
    always@*
    begin
        if ((R2 > 0 && (~R3 + 1) >0 && R1_4 <= 0) || (R2 < 0 && (~R3 + 1) < 0 && R1_4 >= 0))
            overflow_sub = 1;
        else
            overflow_sub = 0;
    end
    
    //MOV
    mov #(n) MOV (R2, R1_0);
    //NOT
    not_bitwise_par #(n) not_s (R2, R1_1);
    //ADD
    FA_par #(n) ADD (c_out_1, R2, R3, R1_2, 0);      //c_in = 0 for addition
    //NOR
    nor_par #(n) NOR (R1_3, R2, R3);
    //SUB
    wire signed [n-1:0] r_3;
    not_bitwise_par #(n) notr3 (R3,r_3);            //flip r3 since its being subtracted
    FA_par #(n) SUB (c_out_2, R2, r_3, R1_4, 1);      //c_in = 1 for subtraction, these two steps perform 2's compliment
    //NAND
    nand_par #(n) NAND (R1_5, R2, R3);
    //AND
    and_par #(n) AND (R1_6, R2, R3);
    //SLT
    SLT_par #(n) SLTPar (R1_7,R2,R3);
    
    assign c_out_3 = op_code[2] ? (op_code[1] ? (op_code[0] ? 0: 0): (op_code[0] ? 0: 0)) : (op_code[1] ? (op_code[0] ? 0 : c_out_1): (op_code[0] ? 0: 0));
    assign R1 = op_code[2] ? (op_code[1] ? (op_code[0] ? R1_7: R1_6): (op_code[0] ? R1_5: R1_4)) : (op_code[1] ? (op_code[0] ? R1_3 : R1_2): (op_code[0] ? R1_1: R1_0));
    assign zero_1 = R1 ? 0 : 1;
    assign overflow_1 = op_code[2] ? (op_code[1] ? (op_code[0] ? 0: 0): (op_code[0] ? 0: overflow_sub)) : (op_code[1] ? (op_code[0] ? 0 : overflow_add): (op_code[0] ? 0: 0));
    
    register #(n) register1 (R0, R1, clk);
    register #(1) register2 (c_out, c_out_3, clk);
    register #(1) register3 (overflow, overflow_1, clk);
    register #(1) register4 (zero, zero_1, clk);
    
    


endmodule
