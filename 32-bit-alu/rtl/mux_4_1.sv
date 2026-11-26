module mux_4_1(input a, input b, input [3:0] mux_in, 
output reg out);
    always @ (*) 
    begin
        out = mux_in[{a,b}];
    end
endmodule
