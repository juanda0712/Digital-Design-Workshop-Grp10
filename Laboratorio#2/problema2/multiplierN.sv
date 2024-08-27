module multiplierN
    #(parameter N = 4)
    (
    input logic [N-1:0] a,
    input logic [N-1:0] b,
    output logic [2*N-1:0] result
);

    logic [2*N-1:0] acumulador;  
    logic [2*N-1:0] multiplicand_shifted;  	 

    always_comb begin
        // Inicializar el acumulador
        acumulador = '0;
        
        // Realizar la multiplicación binaria
        for (int i = 0; i < N; i++) begin
            // Multiplicar el multiplicando por el bit correspondiente del multiplicador
            multiplicand_shifted = a << i;
            
            // Sumar el producto parcial al acumulador si el bit del multiplicador es 1
            if (b[i] == 1) begin
                acumulador = acumulador + multiplicand_shifted;
            end
        end
        
        // Asignar el resultado
        result = acumulador;
    end
	 
endmodule
