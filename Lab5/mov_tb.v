`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2024 03:39:39 AM
// Design Name: 
// Module Name: mov_tb
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


module mov_tb(

    );
    
    parameter n = 4;
    reg[n-1:0] r2;
    wire[n-1:0] r1;
    wire errorflag;
    
    mov #(n) equals(.r2(r2), .r1(r1));
    
    initial begin
        r2 = 1;
    end
    
    always #10 r2=r2+1;
    always@(*)
        if(r2==0) $finish;
       
    
    assign errorflag = (r2==r1); //error flag just makes sure the that r1 is indeed = r2 after op
    
endmodule
