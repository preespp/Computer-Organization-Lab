`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2024 03:18:20 PM
// Design Name: 
// Module Name: SLT_par_tb
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


module SLT_par_tb();

    parameter n = 32;
    reg signed [n-1:0] r3;
    reg signed [n-1:0] r2;
    
    wire [n-1:0] r1;
    
    wire errorflag;
    
    SLT_par #(n) test (.r1(r1),.r2(r2),.r3(r3));
    
    initial begin r2=0; r3= 0; end;
    initial begin
       #10
      r2 =32'hffffffff; r3 = 32'h00000005;
      #10;
    // r2 = r3 0
    r2 = 0; r3 = 0;
        #10;
    // r2 = r3 < 0
    r2 = 32'hffffffff; r3 = 32'hffffffff;
        #10;
    // r2 = r3 > 0
    r2 = 25; r3 = 25;
        #10;
    // both positive and r2 > r3
    r2 = 37; r3 = 25;
        #10;
    // both positive and r2 < r3;
    r2 = 32'h7ffffffe; r3 = 32'h7fffffff;
        #10;
        r2 = 32'h7fffffff; r3 = 32'h7ffffffe;
        #10;
    // both negative and r2 > r3
       r2 = 32'hfffffffe;
        r3 = 32'hffffffff;
     #10
  //Test case: R2 positive and R3 negative
     r2 = 5;
        r3 = 32'hffffffff;
      #10
    // both negative and r2 < r3
   r2 = 32'hffff0000; r3 = 32'hfffffffe;
      //Test case: R2 = negative, R3 =0
       #10 r2 = 32'hffffffff;
      r3 = 0;
    #10;
    // r2 >=0 and r3 < 0 ---> r2>r3
    r2 = 32'h00000000; r3 = 32'hffffffff;
        //Test case: R2 = 0, R3 positive
        #10 r2 = 0;
        r3 = 2;
        //Test case: R2 = 0, R3 negative
        #10 r2 = 0;
        r3 = 32'hffffffff;
        //Test case: R2 = positive, R3 =0
        #10 r2 = 7;
        r3 = 32'h0;
        //Test case: Subtraction overflow
        #10 r2 = 32'h7fffffff;
        r3 = 32'h80000001;
            // r2 < 0 and r3 >= 0 --> r3>r2
    end
    
    assign errorflag = ((r2<r3) == r1);

endmodule
