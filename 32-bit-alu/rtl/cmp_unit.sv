module cmp_unit(input z, input n, input v, input [1:0] op_sel, output reg [31:0] out);

always @ (*) begin
    case(op_sel)
        2'b01: out = z;
        2'b10: out = n ^ v;
        2'b11: out = z | (n ^ v);
        default: out = z;
    endcase
end

endmodule