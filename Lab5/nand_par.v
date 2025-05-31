`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2024 04:02:43 AM
// Design Name: 
// Module Name: nand_par
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


module nand_par #(parameter n = 4) (r1,r2,r3);
input [n-1:0] r2,r3;
output[n-1:0] r1;

genvar i;
generate
    for (i=0; i<n; i=i+1)
    begin
        nand no(r1[i],r2[i],r3[i]);
    end
endgenerate

endmodule
