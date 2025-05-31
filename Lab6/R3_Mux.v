`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2024 06:00:52 PM
// Design Name: 
// Module Name: R3_Mux
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


module R3_Mux(
    input [31:0] S2_ReadData2,
    input [31:0] S2_IMM,
    input S2_Data_Source,
    output [31:0] R3
    );
    
    //if data soruce is 1 then immediate passed
    assign R3 = S2_Data_Source ? S2_IMM : S2_ReadData2;
    
endmodule
