module alu_tb;

    reg [31:0] a;
    reg [31:0] b;
    reg [5:0] fn;
    wire [31:0] y;

    alu alu_design(.a(a), .b(b), .fn(fn), .y(y));
    initial begin
        $monitor("time=%0t a=%d b=%d fn=%b y=%d",
         $time, a, b, fn, y);
        a = 32'd19;
        b = 32'd17;
        fn = 6'b010000;
        #20;
        fn = 6'b010001;
        #20;
        fn = 6'b101110;
        #20;
        a = 32'd17;
        fn = 6'b000011;
        #20;
        fn = 6'b110000;
        b = 32'd2;
        #20;
        $finish;
    end
endmodule