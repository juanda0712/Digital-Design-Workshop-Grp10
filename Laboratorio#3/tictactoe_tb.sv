module tictactoe_tb();

    logic clk;
    logic rst;
    logic select;
	 logic move;
	 logic attack;
    logic orden;
    logic cant_player;
    logic [1:0] board [3:1][3:1];
    logic [1:0] winner;
	 logic [3:0] estado;
	 logic [1:0] current_player;
    logic [1:0] row_out;
    logic [1:0] col_out;

	tictactoe game(
				 .clk(clk),
				 .rst(rst),
				 .select(select),
				 .move(move),
				 .attack(attack),
				 .orden(orden),
				 .cant_player(cant_player),
				 .board(board),
				 .winner(winner),
				 .estado(estado),
				 .current_player_out(current_player),
				 .row_out(row_out),
				 .col_out(col_out));
				 
	always begin
		#10 clk = ~clk;

	end
	initial begin
		rst = 1;
		clk = 0;
		select = 0;
		move = 0;
		attack = 0;
		orden = 0;	// first player 1
		cant_player = 0; // 2 player
		#10;
		rst = 0;
		#10;
		// menu inicial
		select = 1;
		#15;
		select = 0;
		#5;
		// cantidad de jugadores
		cant_player = 1;
		select = 1;
		#15;
		select = 0;
		#5;
		// orden
		orden = 1;	
		select = 1;
		#15;
		select = 0;
		#5; // tb random
		// turno 1 - player 1
		attack = 1;
		#55;
		attack = 0;
		#25;
		// turno 1 - player 2
		move = 1;
		#15;
		move = 0; 
		#5;
		attack = 1;
		#15;
		attack = 0;
		#45;
		// turno 2 - player 1
		move = 1;
		#15;
		move = 0; 
		#5;
		move = 1;
		#15;
		move = 0; 
		#5;
		attack = 1;
		#15;
		attack = 0;
		#45;
		// turno 2 - player 2
		move = 1;
		#15;
		move = 0; 
		#5;
		attack = 1;
		#15;
		attack = 0;
		#45;
		// turno 3 - player 1
		move = 1;
		#15;
		move = 0; 
		#5;
		move = 1;
		#15;
		move = 0; 
		#5;
		attack = 1;
		#15;
		attack = 0;
		#45;
		$stop;
	end

endmodule