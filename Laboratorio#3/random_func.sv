module random_func (
    input logic clk,  
    input logic rst,   
    output logic [1:0] random 
); 
    logic [2:0] lfsr; 
                
    always @ (posedge clk, posedge rst)
        if (rst)
            lfsr <= 3'h4;  
        else
            lfsr <= {lfsr[1:0], (lfsr[2] ^ lfsr[1])}; // Desplazar y generar nuevo bit

    always_comb begin
        case(lfsr[1:0]) 
            2'b01: random = 2'b01; // 1
            2'b10: random = 2'b10; // 2
            2'b11: random = 2'b11; // 3
            default: random = 2'b01; // Valor por defecto en caso de 00
        endcase
    end
endmodule
