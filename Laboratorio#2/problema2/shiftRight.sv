
module shiftRight
 #(parameter N = 4)
 
 (
	input logic [N-1:0] a,
	input logic [N-1:0] displace,
	
	output logic [N-1:0] result,
	output logic sign
	);
	
	logic [N-1:0] temp_out;
	
	
	always @(*) begin
	
		temp_out <= a >> displace; // operación shiftRight
		sign <= a[N-1]; // Bit de signo del número original
	end
	
	assign result = temp_out;
	
	
endmodule