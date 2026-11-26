module logic_unit(input [31:0] a, input [31:0] b, input [3:0] fn, output [31:0] out);
    genvar i;
    generate
        for (i=0;i<32;i++) begin:mux_genr
            mux_4_1 m(.a(a[i]), .b(b[i]), .mux_in(fn), .out(out[i]));
        end
    endgenerate
endmodule