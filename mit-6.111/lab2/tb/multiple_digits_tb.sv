module multiple_digits_tb;
    reg clk;
    reg rst;
    reg [15:0] sw;
    reg btnu;
    reg btnc;
    reg btn1;
    wire [6:0] cat_out;
    wire [7:0] an_out;

    multiple_digits_top m(.clk(clk), .rst(rst), .sw(sw), 
        .btnu(btnu), .btnc(btnc), .btn1(btn1), .cat_out(cat_out), .an_out(an_out));
    
    initial begin
        clk = 0;
        rst = 1;
        btnc = 0;
        btn1 = 0;
        btnu = 0;
    end

    always #5 clk = ~clk;

    initial begin
        #20;
        rst = 0;
        sw = 16'd18;
        btnc = 1'b0;
        btn1 = 1'b0;    
        #80;
        sw = 16'hFFFFFFFF;
        #80;
        btnc = 1'b1;
        #80;
        $finish;
    end
endmodule
