
module ALU_tb();

	parameter N = 4;
	
	logic [N-1:0] A_num;
	logic [N-1:0] B_num;
	logic [3:0] operations_buttons;
	logic [1:0] change_mode;
	logic [6:0] seg1;
	logic [6:0] seg2;
	logic [6:0] result_seg;
	logic [6:0] flags_seg;
	
	ALU #(N) alu(
		.A_num(A_num),
		.B_num(B_num),
		.operations_buttons(operations_buttons),
		.change_mode(change_mode),
		.seg1(seg1),
		.seg2(seg2),
		.result_seg(result_seg),
		.flags_seg(flags_seg)
		);
		
	initial begin
	
		A_num <= 4'b1011;
		B_num <= 4'b0110;
		operations_buttons <= 4'b1110; // Suma #1
		change_mode <= 2'b00;
		
		#2ns
		
		A_num <= 4'b0111;
		B_num <= 4'b0010;
		operations_buttons <= 4'b1110; // Suma #2
		change_mode <= 2'b00;
		
		#2ns
		
		A_num <= 4'b1111;
		B_num <= 4'b1111;
		operations_buttons <= 4'b1101; // Resta #1
		change_mode <= 2'b00;
		
		#2ns
		
		A_num <= 4'b0101;
		B_num <= 4'b1000;
		operations_buttons <= 4'b1101; // Resta #2
		change_mode <= 2'b00;
		
		#2ns
		
		A_num <= 4'b0110;
		B_num <= 4'b0010;
		operations_buttons <= 4'b1011; // Multiplicación #1
		change_mode <= 2'b00;
		
		#2ns
		
		A_num <= 4'b0101;
		B_num <= 4'b0011;
		operations_buttons <= 4'b1011; // Multiplicación #2
		change_mode <= 2'b00;
		
		#2ns
	
		A_num <= 4'b0011;
		B_num <= 4'b0010;
		operations_buttons <= 4'b0111; // Division #1
		change_mode <= 2'b00;
		
		#2ns
		
		A_num <= 4'b0000;
		B_num <= 4'b0001;
		operations_buttons <= 4'b0111; // Division #2
		change_mode <= 2'b00;
		
		#2ns
		
		A_num <= 4'b0110;
		B_num <= 4'b0011;
		operations_buttons <= 4'b1110; // Módulo #1
		change_mode <= 2'b01;
		
		#2ns
		
		A_num <= 4'b1001;
		B_num <= 4'b00110;
		operations_buttons <= 4'b1110; // Módulo #2
		change_mode <= 2'b01;
		
		#2ns
		
		A_num <= 4'b0111;
		B_num <= 4'b0110;
		operations_buttons <= 4'b1101; // AND #1
		change_mode <= 2'b01;
		
		#2ns
		
		A_num <= 4'b1111;
		B_num <= 4'b1111;
		operations_buttons <= 4'b1101; // AND #2
		change_mode <= 2'b01;
		
		#2ns
		
		A_num <= 4'b1001;
		B_num <= 4'b0111;
		operations_buttons <= 4'b1011; // XOR #1
		change_mode <= 2'b01;
		
		#2ns
		
		A_num <= 4'b0011;
		B_num <= 4'b0011;
		operations_buttons <= 4'b1011; // XOR #2
		change_mode <= 2'b01;
		
		#2ns
	
		
		A_num <= 4'b0001;
		B_num <= 4'b0000;
		operations_buttons <= 4'b0111; // OR #1
		change_mode <= 2'b01;
	
		#2ns
		
		A_num <= 4'b1010;
		B_num <= 4'b1010;
		operations_buttons <= 4'b0111; // OR #2
		change_mode <= 2'b01;
	
		#2ns
		
		A_num <= 4'b1100;
		B_num <= 4'b0010;
		operations_buttons <= 4'b1110; // ShiftLeft #1
		change_mode <= 2'b10;
		
		#2ns
		
		A_num <= 4'b1010;
		B_num <= 4'b0011;
		operations_buttons <= 4'b1110; // ShiftLeft #2
		change_mode <= 2'b10;
		
		#2ns
		
		A_num <= 4'b1100;
		B_num <= 4'b0010;
		operations_buttons <= 4'b1101; // ShiftRight #1
		change_mode <= 2'b10;
		
		#2ns
		
		A_num <= 4'b1010;
		B_num <= 4'b0011;
		operations_buttons <= 4'b1101; // ShiftRight #2
		change_mode <= 2'b10;
		
		#2ns
	
		$finish;
		
	end
	
	
endmodule