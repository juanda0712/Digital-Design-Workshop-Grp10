module fullsubtract (input logic a, b, bin, output logic y, bout);
	assign y = a ^ b ^ bin;
	assign bout = (~(a ^ b) & bin) | (~a & b); 
endmodule