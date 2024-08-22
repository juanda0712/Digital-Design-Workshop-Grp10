module negative #(parameter n = 4)
(input logic [n - 1: 0]a, output logic [n - 1: 0] y);
	
	logic [n - 1: 0] t, b;
	logic c;
	assign t = ~a;
	assign b[0] = 1'b1;
	
	add #(n) sum_one(.a(t), .b(b), .sum(y),.Cout(c));
	
endmodule