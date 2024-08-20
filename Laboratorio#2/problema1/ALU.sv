	
module ALU #(parameter N = 4)(
	input logic [N-1:0] A_num,
	input logic [N-1:0] B_num,
	input logic [3:0] operations_buttons, // Para botones: 1 sin presionar, 0 presionando.
	input logic [1:0] change_mode, // switch 4 y 9
	output logic [6:0] seg1,
	output logic [6:0] seg2,
	output logic [6:0] result_seg,
	output logic [6:0] flags_seg
	);
	
	logic [3:0] flag_suma;
	
	
	 // resultado de cada operación
	logic [N-1:0] result,result_suma;
				  
	
	// Flags
	
	logic [3:0] flags; // 0001-acarreo, 0010-cero, 0100-negativo, 1000-desbordamiento
	
	
	// Instancias de cada operación
	
	
	add #(N) suma_nums(.a(A_num),.b(B_num), .sum(result_suma),.Cout(flag_suma)); // suma
	

	always @(*) begin
		
			case ({operations_buttons,change_mode})
				
				{4'b1110, 2'b00}: begin // suma
						
						result <= result_suma;
						
						if(flag_suma == 1) begin
							flags <= 4'b0001; // acarreo
						end
						
						else begin
						
							flags <= 4'b0000; // bandera nula
						
						end
				end
				
				default: result <= '0;
				
			endcase
			
			
			case (A_num[3:0]) 
							  //b6543201 orden de los segmentos
				4'h0: seg1 <= 7'b1000000; // 0
				4'h1: seg1 <= 7'b1111001; // 1
				4'h2: seg1 <= 7'b0100100; // 2
				4'h3: seg1 <= 7'b0110000; // 3
				4'h4: seg1 <= 7'b0011001; // 4
				4'h5: seg1 <= 7'b0010010; // 5
				4'h6: seg1 <= 7'b0000010; // 6
				4'h7: seg1 <= 7'b1111000; // 7
				4'h8: seg1 <= 7'b0000000; // 8
				4'h9: seg1 <= 7'b0011000; // 9
				4'ha: seg1 <= 7'b0001000; // A
				4'hb: seg1 <= 7'b0000011; // B
				4'hc: seg1 <= 7'b1000110; // C
				4'hd: seg1 <= 7'b0100001; // D
				4'he: seg1 <= 7'b0000110; // E
				4'hf: seg1 <= 7'b0001110; // F
				
				default: seg1 = 7'b1000000;
				
			endcase
			
			case (B_num[3:0])
				4'h0: seg2 <= 7'b1000000; // 0
				4'h1: seg2 <= 7'b1111001; // 1
				4'h2: seg2 <= 7'b0100100; // 2
				4'h3: seg2 <= 7'b0110000; // 3
				4'h4: seg2 <= 7'b0011001; // 4
				4'h5: seg2 <= 7'b0010010; // 5
				4'h6: seg2 <= 7'b0000010; // 6
				4'h7: seg2 <= 7'b1111000; // 7
				4'h8: seg2 <= 7'b0000000; // 8
				4'h9: seg2 <= 7'b0011000; // 9
				4'ha: seg2 <= 7'b0001000; // A
				4'hb: seg2 <= 7'b0000011; // B
				4'hc: seg2 <= 7'b1000110; // C
				4'hd: seg2 <= 7'b0100001; // D
				4'he: seg2 <= 7'b0000110; // E
				4'hf: seg2 <= 7'b0001110; // F
				
				default: seg2 <= 7'b1000000;
				
			endcase
			
			case (result[3:0])
				4'h0: result_seg <= 7'b1000000; // 0
				4'h1: result_seg <= 7'b1111001; // 1
				4'h2: result_seg <= 7'b0100100; // 2
				4'h3: result_seg <= 7'b0110000; // 3
				4'h4: result_seg <= 7'b0011001; // 4
				4'h5: result_seg <= 7'b0010010; // 5
				4'h6: result_seg <= 7'b0000010; // 6
				4'h7: result_seg <= 7'b1111000; // 7
				4'h8: result_seg <= 7'b0000000; // 8
				4'h9: result_seg <= 7'b0011000; // 9
				4'ha: result_seg <= 7'b0001000; // A
				4'hb: result_seg <= 7'b0000011; // B
				4'hc: result_seg <= 7'b1000110; // C
				4'hd: result_seg <= 7'b0100001; // D
				4'he: result_seg <= 7'b0000110; // E
				4'hf: result_seg <= 7'b0001110; // F
				default: result_seg <= 7'b1000000;
				
			endcase
			
			
			case (flags)
			
				4'b0001: flags_seg <= 7'b1000110; //carry
				4'b0010: flags_seg <= 7'b0100100; // cero
				4'b0100: flags_seg <= 7'b1001000; // negativo
				4'b1000: flags_seg <= 7'b1000001; // desbordamiento
				
				default: flags_seg <= 7'b1111111; // bandera nula
				
			endcase
					
	end
	
endmodule