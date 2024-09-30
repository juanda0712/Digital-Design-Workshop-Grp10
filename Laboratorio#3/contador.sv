module contador (input logic ena_attack_p1,
					  input logic ena_attack_p2,
					  input logic ena_check,
					  input logic clk,
					  output logic timeout);
						
						
	
	logic [4:0] temp = 0;
	always @ (posedge clk) begin
		if (ena_attack_p1 || ena_attack_p2) begin
			temp = temp + 5'b00001;
		end
		else if (ena_check)begin
			temp = 0;
		end
	end
	
	assign timeout = (temp>=5'b01111);
						
endmodule