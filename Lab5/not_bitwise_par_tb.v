`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2024 08:01:02 PM
// Design Name: 
// Module Name: not_bitwise_par_tb
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


module not_bitwise_par_tb();

    parameter n = 8;
    reg [n-1:0] in;
    wire [n-1:0] out;
    
    not_bitwise_par #(n) ourtest2(.in(in),.out(out));
    
    initial begin
        in = 0;
        #10;
    end
        
    always #10
    in = in + 1;
    
endmodule
