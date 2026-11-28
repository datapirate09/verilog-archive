module serial_tx(input clk, input rst, input [7:0] data, input trigger, output logic out_data);
    parameter count_value = 868;
    logic [3:0] i;
    logic counter_en;
    logic [9:0] shift_buffer;
    logic [31:0] counter;
    always @ (posedge clk) begin 
        if (rst) begin
            shift_buffer <= 10'b0;
            out_data <= 1'b1;
            counter <= 10'b0;
            counter_en <= 0;
            i <= 4'b0;
        end
        else begin
            if (trigger && counter_en != 1'b1) begin
                shift_buffer <= {1'b1, data, 1'b0};
                counter <= 10'b0;
                counter_en <= 1'b1;
                out_data <= 1'b0;
                i <= i + 1'b1;
            end
            else if (counter_en) begin
                if (counter == count_value) begin
                    counter <= 32'b0;
                    if (i == 4'd10) begin
                        counter_en <= 1'b0;
                        i <= 4'b0;
                        out_data <= 1'b1;
                    end
                    else begin
                        out_data <= shift_buffer[i];
                        i <= i+1'b1;
                    end
                end
                else begin
                    counter <= counter + 1'b1;
                end
            end
        end
    end
endmodule