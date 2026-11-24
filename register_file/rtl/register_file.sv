`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: register_file
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


module register_file(
    input [4:0] write_addr,
    input write_en,
    input [31:0] write_data,
    input clk,
    input [4:0] read_port_a,
    input [4:0] read_port_b,
    output reg [31:0] a,
    output reg [31:0] b
    );

    wire [31:0] register_write_enables;
    wire [31:0] register_output[31:0];
    demux_1_32 dmux(.addr(write_addr), .en(write_en), .out(register_write_enables));
    genvar i;
    generate
        for (i=0; i<32;i++) begin : gen_regs
            if (i == 31) begin
                assign register_output[i] = 32'd0;
            end
            else begin
                register_clocked register_inst(.in(write_data), .en(register_write_enables[i]), .clk(clk), .out(register_output[i]));
            end
        end
    endgenerate

    mux_32_1 ma(.in(register_output), .sel(read_port_a), .out(a));
    mux_32_1 mb(.in(register_output), .sel(read_port_b), .out(b));

endmodule

