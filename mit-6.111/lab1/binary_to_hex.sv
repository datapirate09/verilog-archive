module binary_to_hex(input [3:0] in, output reg [6:0] out);
    always @(*) begin
        case (in)
            4'h0: out = 7'b0000001; // 0
            4'h1: out = 7'b1001111; // 1
            4'h2: out = 7'b0010010; // 2
            4'h3: out = 7'b0000110; // 3
            4'h4: out = 7'b1001100; // 4
            4'h5: out = 7'b0100100; // 5
            4'h6: out = 7'b0100000; // 6
            4'h7: out = 7'b0001111; // 7
            4'h8: out = 7'b0000000; // 8
            4'h9: out = 7'b0000100; // 9
            4'hA: out = 7'b0001000; // A
            4'hB: out = 7'b1100000; // b
            4'hC: out = 7'b0110001; // C
            4'hD: out = 7'b1000010; // d
            4'hE: out = 7'b0110000; // E
            4'hF: out = 7'b0111000; // F
            default: out = 7'b1111111;
        endcase
    end
endmodule