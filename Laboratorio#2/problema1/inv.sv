module inv #(parameter n = 4)
(input logic [n - 1: 0] a, output logic [n - 1: 0] y);
	
	always_comb
		y = ~a;

endmodule