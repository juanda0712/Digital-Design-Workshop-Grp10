module decoderFPGA(
    input logic [3:0] tens, 
    input logic [3:0] units, 
    output logic [6:0] seg0,  
    output logic [6:0] seg1   
);

    always_comb begin
        // Para el primer display, el de las decenas
        case(tens)
            4'd0: seg1 = 7'b1000000; // 0
            4'd1: seg1 = 7'b1111001; // 1
            4'd2: seg1 = 7'b0100100; // 2
            4'd3: seg1 = 7'b0110000; // 3
            4'd4: seg1 = 7'b0011001; // 4
            4'd5: seg1 = 7'b0010010; // 5
            4'd6: seg1 = 7'b0000010; // 6
            4'd7: seg1 = 7'b0111000; // 7
            4'd8: seg1 = 7'b0000000; // 8
            4'd9: seg1 = 7'b0010000; // 9
            default: seg1 = 7'b1111111; // Apagar
        endcase

        // Para el segundo display, el de las unidades
        case(units)
            4'd0: seg0 = 7'b1000000; // 0
            4'd1: seg0 = 7'b1111001; // 1
            4'd2: seg0 = 7'b0100100; // 2
            4'd3: seg0 = 7'b0110000; // 3
            4'd4: seg0 = 7'b0011001; // 4
            4'd5: seg0 = 7'b0010010; // 5
            4'd6: seg0 = 7'b0000010; // 6
            4'd7: seg0 = 7'b0111000; // 7
            4'd8: seg0 = 7'b0000000; // 8
            4'd9: seg0 = 7'b0010000; // 9
            default: seg0 = 7'b1111111; // Apagar
        endcase
    end

endmodule