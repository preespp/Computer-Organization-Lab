`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2024 05:55:54 PM
// Design Name: 
// Module Name: Mux_begin
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


module Mux_begin( output [31:0] PCTrue, input [31:0] HAZARDPC, input [31:0] PCIn, input HazardMuxSelect);

assign PCTrue = HazardMuxSelect ? HAZARDPC : PCIn;

endmodule
