module imageROM(
    input logic [18:0] address,      // Calculado como y * ancho + x
    output logic [23:0] data         // Salida de datos RGB
);

    // Memoria para la imagen en formato hexadecimal
    logic [23:0] image_mem [0:39999]; // 200x200 = 625 píxeles

    // Inicialización de la ROM con datos del archivo .hex
    initial begin
        $readmemh("C:/Users/JuanDa/Documents/SEMESTRES/2024IIS/TDD/JRodriguez-KRuiz-GQuintero-digital-design-lab-2024/Proyecto/imagen.hex", image_mem);
    end

    // Asignación de datos desde la ROM
    always_comb begin
        data = image_mem[address];
    end
endmodule
