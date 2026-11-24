`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: counter_extended_tb
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


module counter_extended_tb;
    reg [11:0] in; 
    reg load; 
    reg p;
    reg clr;
    reg clk; 
    wire rco;
    wire [11:0] out;
    
    counter_extended ctr(.in(in), .load(load), .p(p), .clr(clr), .clk(clk), .rco(rco), .out(out));
    
    initial clk = 0;
    always #5 clk = ~clk;
    
    initial begin
        in = 12'h000;
        load = 1;
        p = 1;
        clr = 0;
        #20;
	load = 0;
        #100;
        
        in = 12'h0FC;
        load = 1;
        p = 0;
        clr = 0;
        #20;
	load = 0;
        p = 1;
        #100;
        
        clr = 1;
        #20;
        
        $finish;
    end
endmodule
