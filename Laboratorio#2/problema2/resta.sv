
module resta #(parameter N = 4)(
	input logic [N-1:0] A_num,
	input logic [N-1:0] B_num,
	//input logic call_resta,
	output logic [N-1:0] result,
	output logic sign);
	
	
	logic [N-1:0] bin;     // bus de bits para aplicar complemento al segundo operando (sustraendo)
	logic [N:0] carry_num; // Almacenar el acarreo de toda la operación y determinar si el resultado es positivo o negativo según el útlimo bit
	
	genvar j;
	
	always @(*) begin
		
		carry_num [0] <= 1'b1; // acarreo de entrada, necesario para la comparación con la compuerta XOR en restar
		
		bin <= ~B_num; // complemento al segundo operando (negativo)
		
	end
	
	// Se realiza la resta bit por bit
	generate
	
		for (j = 0; j < N; j = j+1) begin: mult_loop
		
			restar resta_nums(.ain(A_num[j]),.bin(bin[j]),.cin(carry_num[j]),.carry_num(carry_num[j+1]),.sub(result[j]));
			
		end
		
	endgenerate
	
	// si sign es 0, resultado positivo, si sign es 1, resultado negativo.
	assign sign = carry_num[0] ^ carry_num[N]; 

	
endmodule


module restar(
    input logic ain,        // bit de primer operando
    input logic bin,        // bit de segundo operando
    input logic cin,        // acarreo 
	output logic carry_num, // actualiza acarreo en cada operación bit a bit
	output logic sub        // resultado de la operación (resta)
    );

    assign sub = ain ^ bin ^ cin;
    assign carry_num = (ain & bin) | (ain & cin) | (bin & cin);
	
endmodule