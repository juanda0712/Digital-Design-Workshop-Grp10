module filtros_clasicos(
	input logic clk, 
	input logic rst,
	input logic [31:0] address,
	output logic [7:0] q_b
	);
	
logic [3:0] ALUFlags; 
logic RegWrite;
logic ALUSrc;
logic MemtoReg;
logic PCSrc;
logic MemWrite;
logic [31:0]WriteData;
logic [1:0] RegSrc;
logic [1:0] ImmSrc;
logic [1:0] ALUControl;
logic [15:0] ALUResult;
logic [31:0] pc;
logic [31:0] instr;
logic [31:0] ReadData;


controller_unit c(
	.clk(clk),
	.rst(rst),
	.instr(instr[31:12]),
	.ALUFlags(ALUFlags),
	.RegSrc(RegSrc),
	.RegWrite(RegWrite),
	.ImmSrc(ImmSrc),
	.ALUSrc(ALUSrc),
	.ALUControl(ALUControl),
	.MemWrite(MemWrite),
	.MemtoReg(MemtoReg),
	.PCSrc(PCSrc)
	);
	
datapath dp(
	.clk(clk),
	.rst(rst),
	.RegSrc(RegSrc),
	.RegWrite(RegWrite),
	.ImmSrc(ImmSrc),
	.ALUSrc(ALUSrc),
	.ALUControl(ALUControl),
	.MemtoReg(MemtoReg),
	.PCSrc(PCSrc),
	.ALUFlags(ALUFlags),
	.pc(pc),
	.instr(instr),
	.ALUResult(ALUResult),
	.WriteData(WriteData),
	.ReadData(ReadData)
	);

instruction_unit imem(
	.address(pc),
	.clock(clk),
	.q(instr)
	);
	
memory_unit mmem(
	.address_a(ALUResult),
	.address_b(address),
	.clock(clk),
	.data_a(WriteData),
	.data_b(8'b0),
	.wren_a(MemWrite),
	.wren_b(1'b0),
	.q_a(ReadData),
	.q_b(q_b)
	);

	
	
endmodule