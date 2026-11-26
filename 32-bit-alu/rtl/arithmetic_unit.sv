module arithmetic_unit(input [31:0] a, input [31:0] b, input op_sel, output reg [31:0] out, 
 output reg z, output reg n, output reg v);
    reg [31:0] b_comp;
    always @ (*) begin
        b_comp = b ^ {32{op_sel}};
        out = a + b_comp + op_sel;
    end

    always @ (*) begin
        if (out == 0) z = 1;
        else z = 0;
        if (out[31] == 1) n = 1;
        else n = 0;
        v = (a[31] & b_comp[31] & ~out[31]) | (~a[31] & ~b_comp[31] & out[31]);
    end
endmodule