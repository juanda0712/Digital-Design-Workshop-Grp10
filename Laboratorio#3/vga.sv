module vga(
    input logic clk,
    input logic [3:0] estado,  // Entrada adicional para el estado
    output logic vgaclk,
    output logic hsync, vsync,
    output logic sync_b, blank_b,
    output logic [7:0] r, g, b
);
    logic [9:0] x, y;
    
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
        .estado(estado),  // Pasamos el estado al videoGen
        .r(r),
        .g(g),
        .b(b)
    );

endmodule
