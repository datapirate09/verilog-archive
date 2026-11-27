module seven_seg_controller(input [31:0] in, input clk, input rst, output reg [6:0] cat_out, output reg [7:0] an_out);
    logic [6:0] cathode_outs[7:0];
    logic [2:0] segment_selected;
    genvar i;
    generate
        for(i=0;i<8;i++) begin
            bin_to_hex b(.in(in[(4*(i+1)-1):(4*(i+1)-4)]),.out(cathode_outs[i]));
        end
    endgenerate
    always @(*) begin
        case(segment_selected)
            3'b000: begin
                an_out = 8'b11111110;
                cat_out = cathode_outs[0];
            end
            3'b001: begin
                an_out = 8'b11111101;
                cat_out = cathode_outs[1];
            end
            3'b010: begin
                an_out = 8'b11111011;
                cat_out = cathode_outs[2];
            end
            3'b011: begin
                an_out = 8'b11110111;
                cat_out = cathode_outs[3];
            end
            3'b100: begin
                an_out = 8'b11101111;
                cat_out = cathode_outs[4];
            end
            3'b101: begin
                an_out = 8'b11011111;
                cat_out = cathode_outs[5];
            end
            3'b110: begin
                an_out = 8'b10111111;
                cat_out = cathode_outs[6];
            end
            3'b111: begin
                an_out = 8'b01111111;
                cat_out = cathode_outs[7];
            end
            default: begin
                an_out = 8'b11111111;
                cat_out = 7'b1111111;
            end
        endcase
    end

    always @ (posedge clk) begin
        if (rst) segment_selected <= 0;
        else segment_selected <= segment_selected+1;
    end
endmodule