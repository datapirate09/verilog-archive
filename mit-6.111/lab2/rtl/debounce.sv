module debounce(    input           clk_in, //clock in
                    input           rst_in, //reset in
                    input           bouncey_in,//raw input to the system
                    output logic    clean_out //debounced output
    );
   logic [19:0] count; // is 20 bits enough?
   logic old;

   always @(posedge clk_in) begin
        if (rst_in) begin
            count <= 0;
            old <= 0;
            clean_out <= 0;
        end
        else if (count >= 20'd999999) begin
            clean_out <= old;
            count <= 0;
            old <= bouncey_in;
        end
        else begin
            if (bouncey_in == old) begin
                count <= count+1'b1;
            end
            else count <= 0;
            old <= bouncey_in;
        end
   end

    // latch inferred
   //always @ (*) begin
   //     if (rst_in) clean_out = 0;
   //     else if (count >= 20'd999999) begin
   //         clean_out = old;
   //     end
   //end

endmodule