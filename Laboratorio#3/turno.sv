module turno (
    input logic clk,
    input logic [3:0] temp_state,
    output logic [1:0] current_player
);

    always_ff @(posedge clk) begin

        if (temp_state == 4'b0011) begin
            current_player <= 2'b01;
        end else if (temp_state == 4'b0100) begin
            current_player <= 2'b10;
        end
    end

endmodule
