module sevenseg(input logic [3:0] data,
					output logic [6:0] segments);
	always_comb
		case(data)
							        // abc_defg
			4'b0000: segments = 7'b111_1110;
			4'b0001: segments = 7'b011_0000;
			4'b0010: segments = 7'b110_1101;
			4'b0011: segments = 7'b111_1001;
			4'b0100: segments = 7'b011_0011;
			4'b0101: segments = 7'b101_1011;
			4'b0110: segments = 7'b101_1111;
			4'b0111: segments = 7'b111_0000;
			4'b1000: segments = 7'b111_1111;
			4'b1001: segments = 7'b111_0011;
			4'b1010: segments = 7'b111_0111;//A
			4'b1011: segments = 7'b001_1111;//b
			4'b1100: segments = 7'b100_1110;//C
			4'b1101: segments = 7'b011_1101;//d
			4'b1110: segments = 7'b100_1111;//E
			4'b1111: segments = 7'b100_0111;//F
			default: segments = 7'b000_0000;
		endcase
endmodule