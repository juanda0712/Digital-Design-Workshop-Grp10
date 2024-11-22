module videoGen(
    input logic [9:0] x, y,
    output logic [7:0] r, g, b,
    input logic [7:0] pixel_data // Conexión a la RAM para recibir los datos del píxel procesado
);

    always @* begin
        {r, g, b} = {pixel_data, pixel_data, pixel_data}; // Imagen en escala de grises (usar pixel_data en RGB)
    end

endmodule
