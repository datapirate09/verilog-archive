module mux_3_1(input [15:0] button_ctr_in, input [15:0] sw, input [15:0] clock_divider_in, input btnc, input btn1, output [15:0] out);
    always @ (*) begin
        case ({btnc, btn1})
            2'b00: out = sw;
            2'b01: out = button_ctr_in;
            2'b10: out = clock_divider_in;
            2'b11: out = button_ctr_in;
            default: out = sw;
        endcase
    end
endmodule
