`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2024 03:36:18 AM
// Design Name: 
// Module Name: mov
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


module mov #(parameter n = 8) (r2, r1);
input [n-1:0] r2;
output [n-1:0] r1;

genvar i;
generate
    for (i=0; i<n; i=i+1)
    begin
        and_s equal(r1[i],r2[i],1);
    end
endgenerate

endmodule
