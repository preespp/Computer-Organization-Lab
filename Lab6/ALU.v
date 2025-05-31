`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2024 01:22:34 PM
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


module ALU #(parameter n = 32)(R1,R2,R3,S2_ALU_OP,clk);

input [n-1:0] R2, R3;
input [2:0] S2_ALU_OP;
input clk;
output [n-1:0]R1;

reg [n-1:0]result;

// initial begin result1 = 0; end

always @ (*) 
begin
    case (S2_ALU_OP)
        0: result = R2;
        1: result = ~R2;
        3: result = R2+R3; 
        4: result = ~(R2 | R3);
        6: result = R2-R3;
        5: result = ~(R2 & R3);
        2: result = (R2 & R3);
        7: result = (R2<R3);
    endcase
end

assign R1 = result;

endmodule
