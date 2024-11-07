module controller_unit(
	input logic clk, 
	input logic rst,
	input logic [31:12] instr,
	input logic [3:0] ALUFlags,
	output logic [1:0] RegSrc,
	output logic RegWrite,
	output logic [1:0] ImmSrc,
	output logic ALUSrc,
	output logic [1:0] ALUControl,
	output logic MemWrite, 
	output logic MemtoReg,
	output logic PCSrc
	);
	
logic [1:0] FlagW;
logic pcs;
logic RegW;
logic MemW;

decoder_unit dec(
	.Op(instr[27:26]),
	.Funct(instr[25:20]),
	.Rd(instr[15:12]),
	.FlagW(FlagW),
	.pcs(pcs),
	.RegW(RegW),
	.MemW(MemW),
	.MemtoReg(MemtoReg),
	.ALUSrc(ALUSrc),
	.ImmSrc(ImmSrc),
	.RegSrc(RegSrc),
	.ALUControl(ALUControl)
	);
	
condlogic_unit cl(
	.clk(clk),
	.rst(rst),
	.Cond(instr[31:28]),
	.ALUFlags(ALUFlags),
	.FlagW(FlagW),
	.pcs(pcs),
	.RegW(RegW),
	.MemW(MemW),
	.PCSrc(PCSrc),
	.RegWrite(RegWrite),
	.MemWrite(MemWrite)
	);
	
endmodule