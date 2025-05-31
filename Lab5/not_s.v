module not_s(out,a);

input a;
output out;

nand nand1 (out,a,a);

endmodule