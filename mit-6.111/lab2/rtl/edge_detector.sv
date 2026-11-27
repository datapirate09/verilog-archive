module edge_detector(
    input  logic clk,
    input  logic rst,
    input  logic debounced_input,
    output logic edge_out
);

    logic old;

    always @(posedge clk) begin
        if (rst) begin
            old      <= 1'b0;
            edge_out <= 1'b0;
        end
        else begin
            if (old == 1'b0 && debounced_input == 1'b1)
                edge_out <= 1'b1;
            else
                edge_out <= 1'b0;

            old <= debounced_input;
        end
    end

endmodule