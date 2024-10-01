module fsm_tb();

  // Señales de entrada
  logic clk;
  logic rst;
  logic select;
  logic orden;
  logic cant_player;
  logic turno;
  logic end_attack_p1;
  logic end_attack_p2;
  logic timeout;
  logic gameover;

  // Señales de salida
  logic en_attack_p1;
  logic en_attack_p2;
  logic en_attack_random;
  logic en_check;

  // Instancia del módulo FSM
  fsm uut (
    .clk(clk),
    .rst(rst),
    .select(select),
    .orden(orden),
    .cant_player(cant_player),
    .turno(turno),
    .end_attack_p1(end_attack_p1),
    .end_attack_p2(end_attack_p2),
    .timeout(timeout),
    .gameover(gameover),
    .en_attack_p1(en_attack_p1),
    .en_attack_p2(en_attack_p2),
    .en_attack_random(en_attack_random),
    .en_check(en_check)
  );

  // Generación de reloj
  always #5 clk = ~clk;

  // Secuencia de estímulos
  initial begin
    // Inicialización
    clk = 0;
    rst = 1;
    select = 0;
    orden = 0;
    cant_player = 0;
    turno = 0;
    end_attack_p1 = 0;
    end_attack_p2 = 0;
    timeout = 0;
    gameover = 0;

    // Liberar el reset
    #10 rst = 0;

    // Estímulos de prueba
    // Test 1: select activo, avanzar de estado
    #10 select = 1;
    
    // Test 2: avanzar a un estado dependiendo de 'orden'
    #20 orden = 1;
    
    // Test 3: end_attack_p1 activado
    #30 end_attack_p1 = 1;

    // Test 4: activar end_attack_p2
    #40 end_attack_p1 = 0;
        end_attack_p2 = 1;
    
    // Test 5: activar timeout
    #50 timeout = 1;

    // Test 6: activar gameover
    #60 gameover = 1;

    // Terminar simulación
    #100 $finish;
  end

  // Monitor para mostrar cambios
  initial begin
    $monitor("At time %0t, state: %0b, en_attack_p1: %0b, en_attack_p2: %0b, en_attack_random: %0b, en_check: %0b", 
             $time, uut.state, en_attack_p1, en_attack_p2, en_attack_random, en_check);
  end

endmodule
