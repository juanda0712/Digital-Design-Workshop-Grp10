module datapath(
	input logic clk, 
	input logic rst,
	input logic [1:0] RegSrc,
	input logic RegWrite,
	input logic [1:0] ImmSrc,
	input logic ALUSrc,
	input logic [1:0] ALUControl,
	input logic MemtoReg,
	input logic PCSrc,
	input logic [31:0] ReadData,
	input logic [31:0] instr,
	output logic [3:0] ALUFlags,
	output logic [31:0] pc,
	output logic [31:0] ALUResult, 
	output logic [31:0] WriteData
	);
	
logic [31:0] PCNext;
logic [31:0] PCPlus4;
logic [31:0] PCPlus8;
logic [31:0] ExtImm;
logic [31:0] SrcA;
logic [31:0] SrcB;
logic [31:0] Result;
logic [3:0] RA1;
logic [3:0] RA2;

mux2 #(32) pcmux(PCPlus4, Result-32'b1, PCSrc, PCNext);
flopr #(32) pcreg(clk, rst, PCNext, pc);
adder #(32) pcadd1(pc, 32'b001, PCPlus4);
adder #(32) pcadd2(PCPlus4, 32'b001, PCPlus8);

mux2 #(4) ra1mux(instr[19:16], 4'b1111, RegSrc[0], RA1);
mux2 #(4) ra2mux(instr[3:0], instr[15:12], RegSrc[1], RA2);
register_unit rf(
	.clk(clk), 
	.we3(RegWrite), 
	.a1(RA1), 
	.a2(RA2),
	.a3(instr[15:12]), 
	.wd3(Result), 
	.r15(PCPlus8),
	.rd1(SrcA), 
	.rd2(WriteData)
	);
mux2 #(32) resmux(ALUResult, {24'b0, ReadData[7:0]}, MemtoReg, Result);
imm_unit ext(
	.instr(instr[23:0]),
	.ImmSrc(ImmSrc), 
	.ExtImm(ExtImm)
	);

mux2 #(32) srcbmux(WriteData, ExtImm, ALUSrc, SrcB);
ALU alu(
	.SrcA(SrcA),
	.SrcB(SrcB),
	.ALUControl(ALUControl),
	.Result(ALUResult),
	.flags(ALUFlags)
	);
endmodule