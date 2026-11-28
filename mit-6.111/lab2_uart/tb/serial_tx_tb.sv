
`timescale 1ns / 1ps
module serial_tx_tb;
    logic clk;
    logic rst;
    logic trigger;
    logic[7:0] val;
    logic data;

    serial_tx my_serial(    .clk(clk),
                            .rst(rst),
                            .trigger(trigger),
                            .data(val),
                            .out_data(data));
    always #5 clk = !clk;

     initial begin
        clk = 0;
        rst = 0;
        trigger = 0;
        val = 8'b0;
        #10000;
        rst = 1;
        #10;
        rst = 0;
        #10;
        val = 8'b1010_1010;
        #40;
        trigger = 1;
        #10;
        trigger = 0;
        #100000;
        $finish;
     end
endmodule