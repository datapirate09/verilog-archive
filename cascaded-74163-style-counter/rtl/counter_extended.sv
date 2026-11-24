`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: counter_extended
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


module counter_extended(
    input [11:0] in, input load, input p, input clr, input clk, output rco, output [11:0] out
    );
    wire r1, r2, r3;
    counter c1(.in(in[3:0]), .load(load), .clr(clr), .p(p), .clk(clk), .rco(r1), .out(out[3:0]));
    counter c2(.in(in[7:4]), .load(load), .clr(clr), .p(r1), .clk(clk), .rco(r2), .out(out[7:4]));
    counter c3(.in(in[11:8]), .load(load), .clr(clr), .p(r2 & r1), .clk(clk), .rco(r3), .out(out[11:8]));
    assign rco = r3;
endmodule
