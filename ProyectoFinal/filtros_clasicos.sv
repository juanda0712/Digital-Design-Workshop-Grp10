module filtros_clasicos(
    input logic clk, 
    input logic rst,
    input logic [31:0] address, // Entrada externa para pruebas
	 output logic vgaclk,
    output logic [7:0] q_b,     // Salida de prueba (lectura RAM)
    output logic hsync, vsync,
	 output logic sync_b, blank_b,
    output logic [7:0] r, g, b
);

logic [9:0] x, y; // Coordenadas de la pantalla VGA
logic [7:0] pixel_data;

// Señales del procesador
logic [3:0] ALUFlags; 
logic RegWrite;
logic ALUSrc;
logic MemtoReg;
logic PCSrc;
logic MemWrite;
logic [31:0] WriteData;
logic [1:0] RegSrc;
logic [1:0] ImmSrc;
logic [1:0] ALUControl;
logic [17:0] ALUResult;
logic [31:0] pc;
logic [31:0] instr;
logic [31:0] ReadData;

// Controlador VGA y generación de señal de reloj
pll vgapll(
    .inclk0(clk),
    .c0(vgaclk)
);


vgaController vgaCont(
		.vgaclk(vgaclk),
		.hsync(hsync),
		.vsync(vsync),
		.sync_b(sync_b),
		.blank_b(blank_b),
		.x(x),
		.y(y)
);

videoGen vgaVideoGen(
    .x(x),
    .y(y),
    .r(r),
    .g(g),
    .b(b),
    .pixel_data(pixel_data) // Conexión al dato de la memoria RAM
);

// Unidad de control del procesador
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

// Unidad de datos del procesador
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

// Memoria de instrucciones (ROM)
instruction_unit imem(
    .address(pc),
    .clock(clk),
    .q(instr)
);

// Memoria de datos (RAM) que contiene la imagen procesada
memory_unit mmem(
    .address_a(ALUResult),
    .address_b(y * 200 + x),  // Dirección calculada a partir de las coordenadas VGA
    .clock(vgaclk),
    .data_a(WriteData),
    .data_b(8'b0), // Escritura no permitida desde VGA
    .wren_a(MemWrite),
    .wren_b(1'b0),
    .q_a(ReadData),
    .q_b(pixel_data) // Dato del píxel que será enviado a VGA
);

endmodule
