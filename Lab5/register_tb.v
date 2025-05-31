`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2024 07:42:52 PM
// Design Name: 
// Module Name: register_tb
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


module register_tb();
parameter n = 8;

reg[n-1:0] d;
reg clk;

wire [n-1:0] q;

register #(n) ourtest2 ( .d(d),.q(q),.clk(clk));

initial begin 
    
    d = 0; clk = 0;
    #100;
    
end

always
#5 clk = ~clk;

always
#20 d = d+1;

endmodule
