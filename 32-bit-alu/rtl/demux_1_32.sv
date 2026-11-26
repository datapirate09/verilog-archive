`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: demux_1_32
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


module demux_1_32(
    input [4:0] addr, input en, output reg [31:0] out
    );
    always @ (*) begin
        out = 32'b0;
        if (en) out[addr] = 1'b1;
    end
endmodule
