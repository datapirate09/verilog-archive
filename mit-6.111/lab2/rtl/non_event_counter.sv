module non_event_counter(input clk, input rst, output [15:0] count);
    always @ (posedge clk) begin
        if (rst) begin
            count <= 16'b0;
        end
        else begin
            count <= count+1;
        end
    end
endmodule