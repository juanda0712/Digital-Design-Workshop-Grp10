module tictactoe(
    input logic clk,
    input logic rst,
    input logic select,
	 input logic move,
	 input logic attack,
    input logic orden,
    input logic cant_player,
    output logic [1:0] board [3:1][3:1],
    output logic [1:0] winner,
    output logic [3:0] estado);



    logic [1:0] current_player;
	 logic end_attack_p1;
	 logic end_attack_p2;
	 logic timeout;
	 logic en_attack_p1;
	 logic en_attack_p2;
	 logic en_attack_random;
	 logic en_check;
	 logic new_clk;
	 logic [1:0] rand_x;
	 logic [1:0] rand_y;
	 logic row;
	 logic col;
	 logic [3:0] temp_state;
	 
	 //divisor_frecuencia div_frec(.clk(clk),
	//								     .new_clk(new_clk));
	
	random_func random_x(
								 .clk(clk),  
								 .rst(rst),   
								 .random(rand_x));
								 
	random_func random_y(
								 .clk(clk),  
								 .rst(rst),   
								 .random(rand_y));

    fsm fsm_co( .clk(clk), 
					 .rst(rst), 
					 .select(select),
					 .orden(orden),
					 .cant_player(cant_player),
					 .end_attack_p1(end_attack_p1),
					 .end_attack_p2(end_attack_p2),
					 .timeout(timeout),
					 .gameover(winner != 0),
					 .current_player(current_player),
					 .temp_state(temp_state),
					 .en_attack_p1(en_attack_p1),
					 .en_attack_p2(en_attack_p2),
					 .en_attack_random(en_attack_random),
					 .en_check(en_check) );
    
	 turno control_turno (.clk(clk),
								 .temp_state(temp_state),
								 .current_player(current_player));

    tictactoe_board board_module(
        .clk(clk),
        .reset(rst),
		  .end_attack_p1(end_attack_p1),
		  .end_attack_p2(end_attack_p2),
		  .en_check(en_check),
        .current_player(current_player),
        .row(row),
        .col(col),
        .board(board)
    );
	 
	 player_movement_attack player_mov_atk(
								 .clk(clk),                  
								 .rst(rst),                
								 .move(move),         
								 .attack(attack), 
								 .timeout(timeout),
								 .rand_x(rand_x),
								 .rand_y(rand_y),
								 .en_attack_p1(en_attack_p1),
								 .en_attack_p2(en_attack_p2),
								 .board(board),
								 .row(row),            
								 .col(col),            
								 .end_attack_p1(end_attack_p1),
								 .end_attack_p2(end_attack_p2) );
	 
	 contador cont(.ena_attack_p1(en_attack_p1),
					   .ena_attack_p2(en_attack_p2),
					   .clk(clk),
					   .timeout(timeout));

    check_winner winner_module(
		  .clk(clk),
		  .en_check(en_check),
        .board(board),
        .winner(winner)
    );
	 
	 assign estado = temp_state;

endmodule
