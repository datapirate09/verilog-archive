module clock_divider(input clk, input rst, output scaled_clock);
    logic [31:0] count;
    always @(posedge clk) begin
        if (rst) begin
            count <= 0;
            scaled_clock <= 0;
        end
        else begin
            count <= count + 1'b1;
            if (count == 32'd4999999) begin
                count <= 0;
                scaled_clock <= ~scaled_clock;
            end
        end
    end
endmodule
