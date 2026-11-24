`timescale 1ns / 1ps

module register_file_tb;

    reg [4:0] write_addr;
    reg write_en;
    reg [31:0] write_data;
    reg clk;
    reg [4:0] read_port_a;
    reg [4:0] read_port_b;

    wire [31:0] a;
    wire [31:0] b;

    register_file dut (
        .write_addr(write_addr),
        .write_en(write_en),
        .write_data(write_data),
        .clk(clk),
        .read_port_a(read_port_a),
        .read_port_b(read_port_b),
        .a(a),
        .b(b)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        write_addr = 5'd5;
        write_en = 1'b1;
        write_data = 32'd18;
        read_port_a = 5'd5;
        read_port_b = 5'd6;

        #10;

        write_addr = 5'd6;
        write_en = 1'b1;
        write_data = 32'h12345678;

        #10;

        write_addr = 5'd5;
        write_en = 1'b0;
        write_data = 32'hA5A5A5A5;
        #10;

        write_en = 1'b1;
        #10;

        write_addr = 5'd31;
        write_en = 1'b1;
        write_data = 32'd7;
        read_port_a = 5'd31;
        #10;

        read_port_a = 5'd5;
        #10;
        $finish;
    end

endmodule