
module fullAdderN 
#(parameter N = 4) // Define el tamaño predeterminado del sumador si no se proporciona ningún otro valor


(
    input logic [N-1:0] a,
    input logic [N-1:0] b,
    output logic [N-1:0] sum,
    output logic Cout
);


// Declaración de señales internas
logic [N:0] carry; // Vector para los acarreos internos
assign carry[0] = 1'b0;

// Instancias del módulo fullAdder1 para cada bit
genvar i;
generate
    for (i = 0; i < N; i = i + 1) begin : adder_loop
        fullAdder1 adder_inst (
            .a(a[i]),
            .b(b[i]),
            .Cin(carry[i]),
            .sum1(sum[i]),
            .Cout(carry[i+1])
        );
    end
endgenerate

assign Cout = carry[N]; // El acarreo de salida es el acarreo del bit más significativo



endmodule

