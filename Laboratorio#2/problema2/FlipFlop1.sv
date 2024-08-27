module FlipFlop1
                #(parameter N= 4)
                
					(input logic clk,        // Entrada del reloj
                input logic reset,      // Entrada de reset
                input logic [N-1:0] A_numf1,      // Entrada de datos
					 input logic [N-1:0] B_numf1,
					 input logic [3:0] operations_buttonsf1,
					 input logic [1:0] change_modef1,
                output logic [N-1:0] Output_A_numf1,
					 output logic [N-1:0] Output_B_numf1,
					 output logic [3:0] Output_operations_buttonsf1,
					 output logic [1:0] Output_change_modef1);        // Salida de datos

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            Output_A_numf1 <= 1'b0;       // Si hay un reset, establece la salida en 0
				Output_B_numf1 <= 1'b0;
				Output_operations_buttonsf1 <= 1'b0;
				Output_change_modef1 <= 1'b0;
				
				
        end else begin
            Output_A_numf1 <= A_numf1;  // Copia la entrada de datos en la salida en el flanco de subida del reloj
				Output_B_numf1 <= B_numf1;
				Output_operations_buttonsf1 <= operations_buttonsf1;
				Output_change_modef1 <= change_modef1;
        end
    end

endmodule