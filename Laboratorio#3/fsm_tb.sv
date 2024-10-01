module fsm_tb();

  logic clk;
  logic rst;
  logic select;
  logic orden;
  logic cant_player;
  logic end_attack_p1;
  logic end_attack_p2;
  logic timeout;
  logic gameover;
  logic [1:0] current_player;
  logic [3:0] temp_state;
  logic en_attack_p1;
  logic en_attack_p2;
  logic en_attack_random;
  logic en_check;

  fsm fsmtb (
    .clk(clk),
    .rst(rst),
    .select(select),
    .orden(orden),
    .cant_player(cant_player),
    .end_attack_p1(end_attack_p1),
    .end_attack_p2(end_attack_p2),
    .timeout(timeout),
    .gameover(gameover),
    .current_player(current_player),
    .temp_state(temp_state),
    .en_attack_p1(en_attack_p1),
    .en_attack_p2(en_attack_p2),
    .en_attack_random(en_attack_random),
    .en_check(en_check)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;  //periodo 10 unidades de tiempo
  end

  initial begin
    rst = 0;
    select = 0;
    orden = 0;
    cant_player = 0;
    end_attack_p1 = 0;
    end_attack_p2 = 0;
    timeout = 0;
    gameover = 0;
    current_player = 2'b01; // Comenzamos con el jugador 1

    rst = 1;
    #10 rst = 0;

    #10 select = 1;
    #10 select = 0;

    #20 orden = 1;
    #10 select = 1;
    #10 select = 0;

    #20 end_attack_p1 = 1;
    #10 end_attack_p1 = 0;

    #20 current_player = 2'b10;
    end_attack_p2 = 1;
    #10 end_attack_p2 = 0;

    #20 timeout = 1;
    #10 timeout = 0;

    #20 gameover = 1;
    #10 gameover = 0;

    #100 $stop;
  end

  // Monitoreo de las señales
  initial begin
    $monitor("Time: %0t, State: %b, Attack_P1: %b, Attack_P2: %b, Attack_Random: %b, Check: %b",
              $time, temp_state, en_attack_p1, en_attack_p2, en_attack_random, en_check);
  end

endmodule
