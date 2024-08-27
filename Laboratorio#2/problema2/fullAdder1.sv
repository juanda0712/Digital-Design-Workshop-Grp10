module fullAdder1 (
    input logic a,b,Cin,        // Entrada del primer número de 4 bits,Entrada del segundo número de 4 bits, Acarreo de entrada
    output logic sum1,Cout);   //Resultado de la suma, Acarreo de salida
                     
                
               
    // Variables internas
    logic p, g;

    // Proceso para calcular p y g
    
    assign p = a ^ b;               // p es la suma (a+b)
    assign g = a & b;               // g es la multiplicación (a*b)

    // Proceso para calcular las salidas
    assign sum1 = p ^ Cin;          // suma de (p+Cin)
    assign Cout = g | (p & Cin);    // Solución g+(p*Cin)

endmodule
