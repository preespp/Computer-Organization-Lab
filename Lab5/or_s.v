module or_s(out,a,b);

input a,b;
output out;

wire out1, out2;

nand nand1 (out1,a,a);
nand nand2 (out2,b,b);
nand nand3 (out,out1,out2);


endmodule