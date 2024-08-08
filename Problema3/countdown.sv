module countdown(input logic decrease, reset,
					output logic [6: 0] d0, d1);
	
	logic [5: 0] count, res;
	full_substractor_n_bits #(6) sub6bits(count, 6'b000001, res);
	
	always_ff @(posedge decrease or posedge reset) begin
	if (reset) begin
		count <= 6'b111111;
	end else if (decrease) begin 
		count <= res;
	end
	end
	
	sevenseg showd0(count[3: 0], d0);
	sevenseg showd1(count[5: 4], d1);
endmodule