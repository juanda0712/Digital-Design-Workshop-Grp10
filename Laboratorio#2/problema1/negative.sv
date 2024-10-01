module negative #(parameter n = 4)
(input logic [n - 1: 0] a, output logic [n - 1: 0] y);
	
	logic [n - 1: 0] complement;
	logic [n - 1: 0] b;
	logic c;
	assign b = 'b1;
	
	inv #(n) inversor (.a(a), .y(complement));
		
	add #(n) sum_one (.a(complement), .b(b), .sum(y), .Cout(c));
	
endmodule