`timescale 1ps / 1ps

module filtros_clasicos_tb();
	logic clk;
	logic rst;
	logic [31:0] address;
	logic [7:0] q_b;
	
	filtros_clasicos uft(
		.clk(clk),
		.rst(rst),
		.address(address),
		.q_b(q_b)
		);
	
	always begin
		#20 clk = ~clk;
	end
		
	initial begin
		rst = 1;
		clk = 0;
		address = 32'd220000;
		#32;
		rst =0;
		
		#400;
		$stop;
	end

endmodule
	
	