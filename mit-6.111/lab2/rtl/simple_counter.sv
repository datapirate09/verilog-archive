module simple_counter(input               clk_in,
                        input               rst_in,
                        input               evt_in,
                        output logic[15:0]  count_out
    );
    
    always @(posedge clk_in)begin
        if(rst_in)begin
            count_out <= 16'b0;
        end else begin
            if (evt_in) begin
                count_out <= count_out + 1;
            else
                count_out <= count_out;
        end
    end
endmodule