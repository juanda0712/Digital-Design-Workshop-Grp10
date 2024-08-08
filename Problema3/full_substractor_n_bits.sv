module full_substractor_n_bits
	#(parameter width = 8)
	(input logic [width - 1: 0]a, b,
	output logic [width - 1: 0]y);
	
	logic [width: 0]borrow;
	
	initial begin
		for(int i = 0; i < width; i++)
			begin
			y[i] = a[i] ^ b[i] ^ borrow[i];
			borrow[i + 1] = (~(a[i] ^ b[i]) & borrow[i]) | (~a[i] & b[i]);
			end
	end

endmodule 