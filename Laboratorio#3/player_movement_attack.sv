module player_movement_attack(
    input logic clk,                  
    input logic rst,                
    input logic move,         
    input logic attack, 
	 input logic timeout,
	 input logic [1:0] rand_x,
	 input logic [1:0] rand_y,
	 input logic en_attack_p1,
	 input logic en_attack_p2,
    input logic [1:0] board [3:1][3:1],
    output logic [1:0] row,            
    output logic [1:0] col,            
    output logic end_attack_p1,
	 output logic end_attack_p2 );

   
    logic [3:0] position;              

    initial begin
        position = 4'd1;               
        end_attack_p1 = 0; 
		  end_attack_p2 = 0;
    end

    // Lógica para actualizar la posición del jugador
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            position <= 4'd1;           // Reiniciar a la primera posición
            end_attack_p1 <= 0; 
				end_attack_p2 <= 0;         
        end 
        else if (move && (en_attack_p1 || en_attack_p2)) begin
            // Movimiento al siguiente bloque
            if (position == 4'd9) begin
                position <= 4'd1;       // Si llega a la última posición, regresa al inicio
            end else begin
                position <= position + 4'd1;  // Avanza a la siguiente posición
            end
        end
        else if (attack && (en_attack_p1 || en_attack_p2)) begin
            // Verificar si el ataque es válido 
            if (board[row][col] == 2'b00) begin
					if (en_attack_p1) begin
                end_attack_p1 <= 1;
					end else begin
				    end_attack_p2 <= 1;
					end
            end else begin
                end_attack_p1 <= 0; 
					 end_attack_p2 <= 0; 
            end
        end else if (timeout && (en_attack_p1 || en_attack_p2)) begin
            // Verificar si el ataque es válido 
            if (board[rand_y][rand_x] == 2'b00) begin
					if (en_attack_p1) begin
                end_attack_p1 <= 1;
					end else begin
				    end_attack_p2 <= 1;
					end
            end else begin
                end_attack_p1 <= 0; 
					 end_attack_p2 <= 0; 
            end
        end else begin
            end_attack_p1 <= 0; 
				end_attack_p2 <= 0; 
        end
    end

    always_comb begin
        case (position)
            4'd1: begin row = 2'd1; col = 2'd1; end
            4'd2: begin row = 2'd1; col = 2'd2; end
            4'd3: begin row = 2'd1; col = 2'd3; end
            4'd4: begin row = 2'd2; col = 2'd1; end
            4'd5: begin row = 2'd2; col = 2'd2; end
            4'd6: begin row = 2'd2; col = 2'd3; end
            4'd7: begin row = 2'd3; col = 2'd1; end
            4'd8: begin row = 2'd3; col = 2'd2; end
            4'd9: begin row = 2'd3; col = 2'd3; end
            default: begin row = 2'd1; col = 2'd1; end 
        endcase
    end

endmodule
