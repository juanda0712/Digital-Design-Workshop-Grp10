module check_winner(
	 input logic clk,
    input logic en_check,
    input logic [1:0] board [3:1][3:1], 
    output logic [1:0] winner
);

	logic full_board;
	
	initial begin
		full_board = 1;
	end

    always @(posedge clk) begin
        //winner = 0;

        if (en_check) begin
            for (int i = 1; i <= 3; i++) begin
                if (board[i][1] != 0 && board[i][1] == board[i][2] && board[i][2] == board[i][3]) begin
                    winner = board[i][1];
                end
            end
            
            for (int i = 1; i <= 3; i++) begin
                if (board[1][i] != 0 && board[1][i] == board[2][i] && board[2][i] == board[3][i]) begin
                    winner = board[1][i];
                end
            end
            
            if (board[1][1] != 0 && board[1][1] == board[2][2] && board[2][2] == board[3][3]) begin
                winner = board[1][1];
            end
            if (board[1][3] != 0 && board[1][3] == board[2][2] && board[2][2] == board[3][1]) begin
                winner = board[1][3];
            end
				
            if (winner == 0) begin
                for (int i = 1; i <= 3; i++) begin
                    for (int j = 1; j <= 3; j++) begin
                        if (board[i][j] == 0) begin
                            full_board = 0;
                        end
                    end
                end
                
                if (full_board) begin
                    winner = 2'b11;
						  full_board = 1;
                end
            end
        end
    end

endmodule
