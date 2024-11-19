module imm_unit(
	input logic [23:0] instr,
	input logic [1:0] ImmSrc,
	output logic [31:0] ExtImm
	);

always_comb begin 
	case(ImmSrc)
		2'b00: ExtImm = {24'b0, instr[7:0]};
		2'b01: ExtImm = {20'b0, instr[11:0]};
		2'b10: ExtImm = {{6{instr[23]}}, instr[23:0], 2'b00};
		default: ExtImm = 32'bx;
	endcase
end
endmodule