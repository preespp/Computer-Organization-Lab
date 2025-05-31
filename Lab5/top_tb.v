`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2024 01:57:40 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb #(parameter n = 8) ();

        //for parametrized module
    reg c_in, clk, op_code;
    reg[n-1:0] a,b;
    wire[n-1:0] q;
    
    //for verification module
    wire[n-1:0] verq;
    wire error_flag;
    
    top #(n) top1(.a(a),.b(b), .c_in(c_in), .clk(clk), .q(q), .op_code(op_code));
    verification #(n) verification(.a(a),.b(b), .c_in(c_in), .clk(clk), .q(verq),.op_code(op_code));
    
    assign error_flag = (q != verq);
    
    always@(*) begin
        if(error_flag)
            $display("Error occurs when a = %d and b = %d",a,b);
    end
    
    initial begin c_in = 0; a = 0; b = 0; clk = 0; op_code = 0; end
    
    wire temp = n*10;
    
    always begin
        #20 a=a+1;
        #10 op_code = ~op_code;
        #temp b=b+1;
    end
    
    always #1 clk = ~clk;



endmodule
