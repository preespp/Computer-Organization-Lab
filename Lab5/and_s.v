`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2024 05:55:32 PM
// Design Name: 
// Module Name: and_s
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


module and_s(out,a,b);

input a,b;
output out;

wire out1, out2;

nand nand1 (out1,a,b);
nand nand2 (out2,a,b);
nand nand3 (out,out1,out2);

endmodule
