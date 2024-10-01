module fsm(input logic clk, 
			  input logic rst, 
			  input logic select,
			  input logic orden,
			  input logic cant_player,
			  input logic end_attack_p1,
			  input logic end_attack_p2,
			  input logic timeout,
			  input logic [1:0] winner,
			  input logic [1:0] current_player,
			  output logic [3:0] temp_state,
			  output logic en_attack_p1,
			  output logic en_attack_p2,
			  output logic en_attack_random,
			  output logic en_check );

logic [3:0] state, next_state;

//actual state logic
always_ff @ (posedge clk or posedge rst)
	if (rst) begin
		state = 4'b0000;
	end else begin
		state = next_state;
	end

//next state logic
always_comb begin
	case(state)
		4'b0000:if (select) begin 
						next_state = 4'b0001;
					end else begin
						next_state = 4'b0000;
					end
		4'b0001: if (select) begin 
						next_state = 4'b0010;
					end else begin
						next_state = 4'b0001;
					end
		4'b0010:if (select && orden) begin 
						next_state = 4'b0011;
						//temp_current_player = 2'b01;
					end else if (select && !orden) begin
						next_state = 4'b0100;
						//temp_current_player = 2'b10;
					end else begin
						next_state = 4'b0010;
					end
		//4'b0011:begin
			//		if (end_attack_p1) begin 
			//			next_state = 4'b0110;
				//	end else begin
				//		next_state = 4'b0101;
				//	end
				 // end
		4'b0011: begin
			 if (winner != 2'b00) begin
				  next_state = 4'b1000; // Fin del juego
			 end else if (end_attack_p1) begin
				  next_state = 4'b0110; // Chequeo de ganador
			 end else begin
				  next_state = 4'b0101; // Chequeo de estado
			 end
		end

		4'b0100: begin
			 if (winner != 2'b00) begin
				  next_state = 4'b1000; // Fin del juego
			 end else if (!cant_player) begin
				  next_state = 4'b0111; // Ataque aleatorio
			 end else if (cant_player && end_attack_p2) begin
				  next_state = 4'b0110; // Chequeo de ganador
			 end else begin
				  next_state = 4'b0101; // Chequeo de estado
			 end
		end


		4'b0101:if (timeout) begin 
						next_state = 4'b0111;
					end else if (end_attack_p2 || end_attack_p1) begin
						next_state = 4'b0110;
					end else if (current_player == 2'b10) begin
						next_state = 4'b0100;
					end else if (current_player == 2'b01) begin
						next_state = 4'b0011;
					end else begin
						next_state = 4'b0101;
					end
		4'b0110:if (winner != 2'b00) begin //chequeo ganador
						next_state = 4'b1000; //win 01 o 10 o 11
					end else if (current_player == 2'b01) begin
						next_state = 4'b0100;
					end else if (current_player == 2'b10) begin
						next_state = 4'b0011;
					end else begin
						next_state = 4'b0110;
					end
		4'b0111:if (end_attack_p2 || end_attack_p1) begin
						next_state = 4'b0110;
					end else begin 
						next_state = 4'b0111;
					end
		4'b1000:next_state = 4'b1000;
	endcase	
end
//output logic 

assign en_attack_p1 = (state == 4'b0011 || (state == 4'b0101 && current_player == 2'b01)) ;
assign en_attack_p2 = (state == 4'b0100 || (state == 4'b0101 && current_player == 2'b10));
assign en_attack_random = state == 4'b0111;
assign en_check = state == 4'b0110;
assign temp_state = state;


endmodule