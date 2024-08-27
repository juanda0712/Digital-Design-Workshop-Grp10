module multiplierN_tb();

       parameter N= 4;

			logic [N-1:0] a, b;
			logic [(N*2)-1:0] result;
			
			multiplierN #(N) dut(
					.a(a),
					.b(b),
					.result(result)
			);
			
			initial begin
			     
					a = 4'b0010;
					b = 4'b0011;
					#40;
			end
endmodule
			