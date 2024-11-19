module videoGen(
	input logic [9:0] x, y,
	output logic [7:0] r, g, b
);

	// ROM de imagen de 640x480 píxeles
	logic [23:0] pixel_data; // RGB en formato {R[7:0], G[7:0], B[7:0]}
	imageROM imgROM (
		.address(y * 200 + x),
		.data(pixel_data)
	);

	always @* begin
		{r, g, b} = pixel_data;
	end

endmodule
