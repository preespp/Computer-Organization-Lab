`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2024 01:59:19 PM
// Design Name: 
// Module Name: verification
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


module verification#(parameter n = 8) (op_code, a, b, c_in, clk, q);

input c_in, clk;
input op_code;
input [n-1:0] a;
input [n-1:0] b;
output [n-1:0] q;

reg [n-1:0] q_1;

always@ (posedge clk) begin
    q_1 <= op_code ? a+b : ~a;
end

assign q = q_1;

endmodule
