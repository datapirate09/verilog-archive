`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: counter
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


module counter(
    input[3:0] in, input load, input clr, input p, input clk, output rco, output reg [3:0] out
    );
    always @ (posedge clk) begin
        if (clr) out <= 4'b0;
        else if (load) out <= in;
        else if (p) out <= out + 1;
        else out <= out;
    end
    
    assign rco = p & out[3] & out[2] & out[1] & out[0]; // added p cause when counter is stopped theres no point in giving rco as next one might see rco as 1 and continue to count
endmodule
