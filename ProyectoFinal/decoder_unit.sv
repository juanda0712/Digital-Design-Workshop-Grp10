module decoder_unit(
	input logic [1:0] Op,
	input logic [5:0] Funct,
	input logic [3:0] Rd,
	output logic [1:0] FlagW,
	output logic pcs,
	output logic RegW,
	output logic MemW,
	output logic MemtoReg,
	output logic ALUSrc,
	output logic [1:0] ImmSrc,
	output logic [1:0] RegSrc,
	output logic [1:0] ALUControl
	);
	
logic [9:0] controls;
logic Branch, ALUOp;
// Main Decoder
always_comb begin
	casex(Op)
		// Data-processing immediate
		2'b00: if (Funct[5]) controls = 10'b0000101001;
		// Data-processing register
		else controls = 10'b0000001001;
		// LDR
		2'b01: if (Funct[0]) controls = 10'b0001111000;
		// STR
		else controls = 10'b1001110100;
		// B
		2'b10: controls = 10'b0110100010;
		// Unimplemented
		default: controls = 10'bx;
	endcase
end

assign {RegSrc, ImmSrc, ALUSrc, MemtoReg,RegW, MemW, Branch, ALUOp} = controls;

// ALU Decoder
always_comb begin
	if (ALUOp) begin
		case(Funct[4:1])
			4'b0100: ALUControl = 2'b00; // ADD
			4'b0010: ALUControl = 2'b01; // SUB
			4'b0000: ALUControl = 2'b10; // AND
			4'b1100: ALUControl = 2'b11; // ORR
			default: ALUControl = 2'bx; // unimplemented
		endcase
		FlagW[1] = Funct[0];
		FlagW[0] = Funct[0] & (ALUControl == 2'b00 | ALUControl == 2'b01);
	end else begin
		ALUControl = 2'b00;
		FlagW = 2'b00;
	end
end
// PC Logic
assign pcs = ((Rd == 4'b1111) & RegW) | Branch;

endmodule