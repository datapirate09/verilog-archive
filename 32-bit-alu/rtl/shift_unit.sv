module shift_unit(input [31:0] a, input [4:0] b, input [1:0] op_sel, output reg [31:0] out);

always @ (*) begin
    case (op_sel)
        2'b00: out = a << b;
        2'b01: out = a >> b;
        2'b10: out = $signed(a) >>> b;
        2'b11: out = a << b;
    endcase
end

endmodule