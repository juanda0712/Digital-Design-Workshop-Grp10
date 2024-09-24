module contador (input logic ena_attack_p1,
					  input logic ena_attack_p2,
					  input logic clk,
					  output logic timeout);
						
						
	
	int temp = 0;
	always @ (posedge clk) begin
		if (ena_attack_p1 || ena_attack_p2) begin
			temp = temp + 1;
		end
		else begin
			temp = 0;
		end
	end
	
	assign timeout = (temp>=15);
						
endmodule