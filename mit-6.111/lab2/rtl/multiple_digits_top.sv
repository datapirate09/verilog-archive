module multiple_digits_top(input clk, input rst, input [15:0] sw, input btnu, input btnc, input btn1, output reg [6:0] cat_out, output reg [7:0] an_out);
    logic clean_out;
    logic edge_out;
    logic [15:0] count_out;
    logic [15:0] scaled_count_out;
    logic [15:0] mux_out;
    logic scaled_clock;
    debounce d1(.clk_in(clk), .rst_in(rst), .bouncey_in(btnu), .clean_out(clean_out));
    edge_detector e1(.clk(clk), .rst(rst), .debounced_input(clean_out), .edge_out(edge_out));
    simple_counter s1(.clk_in(clk), .rst_in(rst), .evt_in(edge_out), .count_out(count_out));

    clock_divider c1(.clk(clk), .rst(rst), .scaled_clock(scaled_clock));
    non_event_counter n(.clk_in(scaled_clock), .rst_in(rst), .count_out(scaled_count_out));

    mux_3_1 m1(.button_ctr_in(count_out), .sw(sw), .clock_divider_in(scaled_count_out), .btnc(btnc), .btn1(btn1), .out(mux_out));
    seven_seg_controller segment(.in(mux_out), .clk(clk), .rst(rst), .cat_out(cat_out), .an_out(an_out));
endmodule
