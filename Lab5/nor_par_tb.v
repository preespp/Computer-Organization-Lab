`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2024 03:55:13 AM
// Design Name: 
// Module Name: nor_par_tb
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


module nor_par_tb(

    );
    
    parameter n = 3;
    reg [n-1:0] r2,r3;
    wire [n-1:0] r1;
    wire errorflag;
    
    nor_par #(n) no(.r1(r1),.r2(r2),.r3(r3));
    
    initial begin 
        r2=0;
        r3=1;
    end
    
    always #2 r2=r2+1;
    always #16 r3=r3+1;
    
    always@(*)
        if(r3==0) $finish;
    
    assign errorflag = (r1!=(r2|r3));
    
endmodule
