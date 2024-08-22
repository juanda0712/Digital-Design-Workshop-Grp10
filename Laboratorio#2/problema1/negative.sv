module negative #(parameter n = 4)
(input logic [n - 1: 0]a, output logic [n - 1: 0] y);
	
	genvar i;
	generate
		for (i = 1; j < n; i = i + 1) begin : compl_loop
			assign y[i] = ~a[i];
		end
	endgenerate
endmodule