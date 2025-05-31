`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2024 01:40:06 PM
// Design Name: 
// Module Name: SLT_par
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


module SLT_par #(parameter n = 32) (r1,r2,r3);
input signed [n-1:0] r2,r3;
output signed [n-1:0] r1;

reg result;

//SUB
wire signed [n-1:0] r_3;
wire signed [n-1:0] subresult;
wire c_out_2;
not_bitwise_par #(n) notr3 (r3,r_3);            //flip r3 since its being subtracted
FA_par #(n) SUB (c_out_2, r2, r_3, subresult, 1);      //c_in = 1 for subtraction, these two steps perform 2's compliment

always @ * 
begin
    if(subresult == 0)
        result <= 0;
    else
        case ({r2[n-1],r3[n-1]})
            2'b00: result <= (subresult < 0) ? 1 : 0;
            2'b01: result <= r2[n-1];
            2'b10: result <= r2[n-1];
            2'b11: result <= (subresult < 0) ? 1 : 0;
        endcase
end

assign r1 = result;

endmodule
