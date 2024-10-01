module tictactoe(
    input logic clk,
	 
    input logic rst,
    input logic select,
    input logic move,
    input logic attack,
    input logic orden,
    input logic cant_player,
	 output logic vgaclk,
    output logic hsync, vsync,
    output logic sync_b, blank_b,
    output logic [7:0] r, g, b,   // Salidas VGA (colores)
    output logic [1:0] winner,
    output logic [3:0] estado,
    output logic [1:0] current_player_out,
    output logic [1:0] row_out,
    output logic [1:0] col_out
);

    // Señales internas
    logic [1:0] board [3:1][3:1];
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
    logic [1:0] row;
    logic [1:0] col;
    logic [3:0] temp_state; 
    logic [9:0] x, y;
	 
	 divisor_frecuencia div_frec(
		.clk(clk),
		.new_clk(new_clk));

    // Generador de números aleatorios
    random_func random_x(
        .clk(new_clk),  //new_clk
        .rst(rst),
        .random(rand_x)
    );
    random_func random_y(
        .clk(clk),
        .rst(rst),
        .random(rand_y)
    );

    // Máquina de estados finitos (FSM)
    fsm fsm_co(
        .clk(new_clk),  //new_clk
        .rst(rst),
        .select(select),
        .orden(orden),
        .cant_player(cant_player),
        .end_attack_p1(end_attack_p1),
        .end_attack_p2(end_attack_p2),
        .timeout(timeout),
        .winner(winner),
        .current_player(current_player),
        .temp_state(temp_state),
        .en_attack_p1(en_attack_p1),
        .en_attack_p2(en_attack_p2),
        .en_attack_random(en_attack_random),
        .en_check(en_check)
    );
    
    // Control de turnos
    turno control_turno (
        .clk(new_clk),  //new_clk
        .temp_state(temp_state),
        .current_player(current_player)
    );

    // Movimiento y ataques
    player_movement_attack player_mov_atk(
        .clk(new_clk),   //new_clk
        .rst(rst),
        .move(move),
        .attack(attack),
        .current_player(current_player),
        .timeout(timeout),
        .rand_x(rand_x),
        .rand_y(rand_y),
        .en_attack_p1(en_attack_p1),
        .en_attack_p2(en_attack_p2),
        .board(board),
        .row(row),
        .col(col),
        .end_attack_p1(end_attack_p1),
        .end_attack_p2(end_attack_p2)
    );
    
    // Tablero del juego
    tictactoe_board board_module(
        .clk(new_clk),  //new_clk
        .reset(rst),
        .end_attack_p1(end_attack_p1),
        .end_attack_p2(end_attack_p2),
        .en_check(en_check),
        .current_player(current_player),
        .row(row),
        .col(col),
        .board(board)
    );

    // Control de tiempo
    contador cont(
        .ena_attack_p1(en_attack_p1),
        .ena_attack_p2(en_attack_p2),
        .ena_check(en_check),
        .clk(new_clk),  //new_clk
        .timeout(timeout)
    );

    // Comprobar el ganador
    check_winner winner_module(
        .clk(new_clk),  //new_clk
        .en_check(en_check),
        .board(board),
        .winner(winner)
    );
    
    assign estado = temp_state;
    assign current_player_out = current_player;
    assign row_out = row;
    assign col_out = col;

    // -- Integración VGA --
    // PLL para generar el reloj VGA
    pll vgapll(
        .inclk0(clk),
        .c0(vgaclk)
    );
    
    // Controlador VGA
    vgaController vgaCont(
        .vgaclk(vgaclk),
        .hsync(hsync),
        .vsync(vsync),
        .sync_b(sync_b),
        .blank_b(blank_b),
        .x(x),
        .y(y)
    );
    
    // Generador de video (colores en función del estado del juego)
    videoGen vgaVideoGen(
        .x(x),
        .y(y),
        .estado(estado),
		  .row_out(row_out),
		  .col_out(col_out),
		  .board(board), 
		  .winner(winner),
        .r(r),
        .g(g),
        .b(b)
    );

endmodule
