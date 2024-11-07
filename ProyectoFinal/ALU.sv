module ALU (
	input logic [1:0] ALUControl,  
   input logic [15:0] SrcA,        
   input logic [15:0] SrcB,        
   output logic [15:0] Result,     
   output logic [3:0] flags
	);
	
logic [15:0] temp_result;
logic temp_carry; 
logic temp_overflow;

always @(*) begin

	
	case (ALUControl)
		2'b00: begin
					{temp_carry, temp_result} = SrcA + SrcB;
					if ((SrcA[15] == SrcB[15]) && (temp_result[15] != SrcA[15])) begin
						temp_overflow = 1;
					end
				 end 
		2'b01: begin
					{temp_carry, temp_result} = SrcA - SrcB;
					if ((SrcA[15] != SrcB[15]) && (temp_result[15] != SrcA[15])) begin
						temp_overflow = 1;
					end
				 end  
		2'b10: temp_result = SrcA & SrcB; 
		2'b11: temp_result = SrcA | SrcB;  
		default: temp_result = 16'b0;      
	endcase
	  
  
	flags[0] = (temp_result == 16'b0);  // Bandera de cero
	flags[1] = temp_result[15];         // Bandera de negativo
	flags[2] = temp_carry;              // Bandera de carry
	flags[3] = temp_overflow;           // Bandera de overflow

	Result = temp_result;
end

endmodule
