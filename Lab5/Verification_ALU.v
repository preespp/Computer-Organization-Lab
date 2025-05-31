`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2024 01:22:34 PM
// Design Name: 
// Module Name: Verification_ALU
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


module Verification_ALU #(parameter n = 32)(c_out,out,a,b,select,clk,zero,overflow);

input signed [n-1:0] a, b;
input [2:0] select;
input clk;
output c_out;
output signed [n-1:0]out;
output zero, overflow;

reg signed [n-1:0]result;
reg [n-1:0] result1;
reg c_out_1;
reg c_out_2;
reg overflow_1;
reg zero_1;

initial begin c_out_1 = 0; c_out_2 = 0; result1 = 0; end

always @ (posedge clk) 
begin
    case (select)
        0: result = a;
        1: result = ~a;
        2: {c_out_1,result1} = a+b; 
        3: result = ~(a | b);
        4: result = a-b;
        5: result = ~(a & b);
        6: result = (a & b);
        7: result = (a<b);
    endcase
end

always@(posedge clk)
begin
       if ((a > 0 && b >0 && result1 <= 0 && select == 2) || (a < 0 && b < 0 && result1 >= 0 && select == 2))
            overflow_1 = 1;
       else if ((a > 0 && (~b + 1) > 0 && result <= 0 && select == 4) || (select == 4 && a < 0 && (~b + 1) < 0 && result >= 0))
            overflow_1 = 1;
       else
            overflow_1 = 0;
end

always@(posedge clk)
begin
    if ((result==0 && select != 2) || (result1==0 && select == 2))
        zero_1 = 1;
    else
        zero_1 = 0;    
end

assign out = select[2] ? result : (select[1] ? (select[0] ? result : result1): result);
assign c_out = select[2] ? (select[1] ? (select[0] ? 0: 0): (select[0] ? 0: 0)) : (select[1] ? (select[0] ? 0 : c_out_1): (select[0] ? 0: 0));
assign zero = zero_1;
assign overflow = overflow_1;

endmodule
