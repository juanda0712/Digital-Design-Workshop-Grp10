module FlipFlop2

                #(parameter N=4)
               (input logic clk,        // Entrada del reloj
                input logic reset,      // Entrada de reset
                input logic [6:0] seg1f2,      // Entrada de datos
					 input logic [6:0] seg2f2,
					 input logic [6:0] result_segf2,
					 input logic [6:0] flags_segf2,
                output logic [6:0] Output_seg1f2,
					 output logic [6:0] Output_seg2f2,
					 output logic [6:0] Output_result_segf2,
					 output logic [6:0] Output_flags_segf2);        // Salida de datos

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            Output_seg1f2 <= 1'b0;       // Si hay un reset, establece la salida en 0
				Output_seg2f2 <= 1'b0;
				Output_result_segf2 <= 1'b0;
				Output_flags_segf2 <= 1'b0;
				
				
        end else begin
            Output_seg1f2 <= seg1f2;  // Copia la entrada de datos en la salida en el flanco de subida del reloj
				Output_seg2f2 <= seg2f2;
				Output_result_segf2 <= result_segf2;
				Output_flags_segf2 <= flags_segf2;
        end
    end

endmodule