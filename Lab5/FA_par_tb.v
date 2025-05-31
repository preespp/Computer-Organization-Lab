`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2024 07:36:18 PM
// Design Name: 
// Module Name: FA_par_tb
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


module FA_par_tb();
parameter n = 4;
    reg [n-1:0] a;
    reg [n-1:0] b;
    reg c_in;
    
    wire [n-1:0] sum;
    wire c_out;
    
    FA_par #(n) ourtest(.a(a),.b(b),.sum(sum),.c_in(c_in),.c_out(c_out));
    
    initial begin
        a = 0; b = 0;c_in = 0;
        #10;
    end
        
    always #10
    {c_in,a,b} = {c_in,a,b} + 1;

endmodule
