module tictactoe_board(
    input logic clk,
    input logic reset,
	 input logic end_attack_p1,
	 input logic end_attack_p2,
	 input logic en_check,    
    input logic [1:0] current_player,
    input logic [1:0] row,       
    input logic [1:0] col,        
    output logic [1:0] board [3:1][3:1]
);

	logic cont = 0;

    initial begin
        integer i, j;
        for (i = 1; i <= 3; i = i + 1) begin
            for (j = 1; j <= 3; j = j + 1) begin
                board[i][j] = 2'b00; 
            end
        end
    end

    always  @(posedge clk or posedge reset) begin
        if (reset) begin
            integer i, j;
            for (i = 1; i <= 3; i = i + 1) begin
                for (j = 1; j <= 3; j = j + 1) begin
                    board[i][j] = 2'b00;
                end
            end
        end else if (end_attack_p1 || end_attack_p2 || en_check) begin
				if (cont == 0) begin
					board[row][col] = current_player;
					cont = 1; 
				end
        end else begin
			cont = 0;
		  end
    end

endmodule
