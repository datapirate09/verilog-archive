module alu(input [31:0] a, input [31:0] b, input [5:0] fn, output reg [31:0] y);
    wire [31:0] logic_out;
    wire [31:0] arithmetic_out;
    wire [31:0] cmp_out;
    wire [31:0] shift_out;
    wire z, n, v;
    logic_unit l(.a(a), .b(b), .fn(fn[3:0]), .out(logic_out));
    arithmetic_unit ar(.a(a), .b(b), .op_sel(fn[0]), .out(arithmetic_out), .z(z), .n(n), .v(v));
    cmp_unit c(.z(z), .n(n), .v(v), .op_sel(fn[2:1]), .out(cmp_out));
    shift_unit s(.a(a), .b(b[4:0]), .op_sel(fn[1:0]), .out(shift_out));

    always @ (*) begin
        case(fn[5:4])
            2'b00: y = cmp_out;
            2'b01: y = arithmetic_out;
            2'b10: y = logic_out;
            2'b11: y = shift_out;
            default: y = arithmetic_out;
        endcase
    end
endmodule