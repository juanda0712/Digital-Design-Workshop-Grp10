module ALU_CriticalPath
     #(parameter N = 4)
	  (
	  //Se definen las entradas 	  
	  input logic [N-1:0] A_num, B_num,operations_buttons,change_mode,
	  input logic clk, reset,
	  
	  //Se definen las salidas 
	 
     output logic [6:0] a,
	  output logic [6:0] b,
	  output logic [6:0] c,
     output logic [6:0] d
);





//Definir las variables intermedias 

reg [6:0] seg1;
reg [6:0] seg2;
reg [6:0] result_seg;
reg [6:0] flags_seg;


reg [N-1:0] Output_A_num1;   
reg [N-1:0] Output_B_num1;  
reg [3:0] Output_operations_buttons1;   
reg [1:0] Output_change_mode1;   
			  

reg [6:0] Oseg1;   
reg [6:0] Oseg2;  
reg [6:0] Oresult_seg;   
reg [6:0] Oflags_seg;

  

//Se instancian los 3 modulos ALU, FlipFlop1,FlipFlop2

FlipFlop1 #(N) ff1_inst (.clk(clk),.reset(reset),.A_numf1(A_num),.B_numf1(B_num),.operations_buttonsf1(operations_buttons),
.change_modef1(change_mode),.Output_A_numf1(Output_A_num1),.Output_B_numf1(Output_B_num1),
.Output_operations_buttonsf1(Output_operations_buttons1),.Output_change_modef1(Output_change_mode1));


ALU_center #(N) alu_inst (.A_num(Output_A_num1),.B_num(Output_B_num1),.operations_buttons(Output_operations_buttons1),
               .change_mode(Output_change_mode1),.seg1(Oseg1),.seg2(Oseg2),.result_seg(Oresult_seg),
			      .flags_seg(Oflags_seg));


FlipFlop2 #(N) ff2_inst (.clk(clk),.reset(reset),.seg1f2(Oseg1),.seg2f2(Oseg2),.result_segf2(Oresult_seg),.flags_segf2(Oflags_seg),
                    .Output_seg1f2(a),.Output_seg2f2(b),.Output_result_segf2(c),.Output_flags_segf2(d));


  
endmodule