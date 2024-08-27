module multiplicacion_tb;

  parameter M = 4;

  // Señales de entrada y salida
  logic [M-1:0] A;
  logic [M-1:0] B;
  logic [2*M-1:0] R;
  logic C;

  // Instancia módulo
  multiplicacion #(M) dut (
    .input1(A),
    .input2(B),
    .result(R),
    .CarryOut(C)
  );

  initial begin
    // Casos de prueba

    // Caso: 2 * 3 = 6
    A = 4'd2; B = 4'd3;
    #10;
    $display("A = %0d, B = %0d, R = %0d, C = %0b", A, B, R, C); 

    // Caso: 0 * 4 = 0
    A = 4'd0; B = 4'd4;
    #10;
    $display("A = %0d, B = %0d, R = %0d, C = %0b", A, B, R, C); 
	 
	 // Caso: 15 * 15 = 225
    A = 4'd15; B = 4'd15;
    #10;
    $display("A = %0d, B = %0d, R = %0d, C = %0b", A, B, R, C); 
	 
    $stop;
  end

endmodule
