`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:16:02 02/28/2022 
// Design Name: 
// Module Name:    FA_str 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module FA_str(c_out, sum, a, b, c_in);

//parameter D = 0;		

input		a, b, c_in; //declare inputs a, b and c_in, 1 bit each
output	c_out, sum; //declare outputs c_out and sum, 1 bit each
//declare wires for values being passed between different gates
wire		not_a, not_b, not_c;
wire		and1_out, and2_out, and3_out, and4_out;
wire		and5_out, and6_out, and7_out, and8_out;
wire        out_1, out_2,out_3,out_4,out_5,out_6;

not_s	   not1		(not_a, a);
not_s	   not2		(not_b, b);
not_s		not3    (not_c, c_in);

// get sum
and_s       and_1       (out_1, not_b, not_c);
and_s		and1		(and1_out, a, out_1);
and_s       and_2       (out_2, b, not_c);
and_s		and2		(and2_out, not_a,out_2);
and_s       and_3       (out_3, not_b,c_in);
and_s		and3		(and3_out, not_a,out_3);
and_s       and_4       (out_4,a,b);
and_s		and4		(and4_out, c_in, out_4);
or_s        or11        (out_5, and1_out, and2_out);
or_s        or22        (out_6,and3_out,and4_out);
or			or1	       	(sum, out_5, out_6);

// get c_out							
and_s			and5		(and5_out, a, b);
and_s			and6		(and6_out, b, c_in);
and_s			and7		(and7_out, a, c_in);
and_s			and8		(and8_out, out_4, c_in);
or_s            or33        (out_7,and5_out, and6_out);
or_s            or44        (out_8,and7_out, and8_out);
or_s			or2		    (c_out, out_7,out_8);


endmodule
