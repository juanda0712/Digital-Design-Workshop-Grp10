module full_substractors_tb();
	logic [1 :0]a2, b2, y2;
	logic [3 :0]a4, b4, y4;
	logic [5 :0]a6, b6, y6;
	
	full_substractor_n_bits #(2) sub2(a2, b2, y2);
	
	initial begin
	a2 = 00; b2 = 00; #10;
	assert (y2 === 00);
	a2 = 01; #10;
	assert (y2 === 01);
	b2 = 01; #10;
	assert (y2 === 00);
	a2 = 10; b2 = 00; #10;
	assert (y2 === 10);
	b2 = 01; #10;
	assert (y2 === 01);
	b2 = 10; #10;
	assert (y2 === 00);
	a2 = 11; b2 = 00; #10;
	assert (y2 === 11);
	b2 = 01; #10;
	assert (y2 === 10);
	b2 = 10; #10;
	assert (y2 === 01);
	b2 = 11; #10;
	assert (y2 === 00);
	end
	
	full_substractor_n_bits #(4) sub4(a4, b4, y4);
	
	initial begin
	a4 = 0000; b4 = 0000; #10;
	assert (y4 === 0000);
	a4 = 0100; #10;
	assert (y4 === 0100);
	b4 = 0100; #10;
	assert (y4 === 0000);
	a4 = 1000; b4 = 0000; #10;
	assert (y4 === 1000);
	b4 = 0100; #10;
	assert (y4 === 0100);
	b4 = 1000; #10;
	assert (y4 === 0000);
	a4 = 1100; b4 = 0000; #10;
	assert (y4 === 1100);
	b4 = 0100; #10;
	assert (y4 === 1000);
	b4 = 1000; #10;
	assert (y4 === 0100);
	b4 = 1100; #10;
	assert (y4 === 0000);
	end
	
	full_substractor_n_bits #(6) sub6(a6, b6, y6);
	
	initial begin
	a6 = 000000; b6 = 000000; #10;
	assert (y6 === 000000);
	a6 = 010000; #10;
	assert (y6 === 010000);
	b6 = 010000; #10;
	assert (y6 === 000000);
	a6 = 100000; b6 = 000000; #10;
	assert (y6 === 100000);
	b6 = 010000; #10;
	assert (y6 === 010000);
	b6 = 100000; #10;
	assert (y6 === 000000);
	a6 = 110000; b6 = 000000; #10;
	assert (y6 === 110000);
	b6 = 010000; #10;
	assert (y6 === 100000);
	b6 = 100000; #10;
	assert (y6 === 010000);
	b6 = 110000; #10;
	assert (y6 === 000000);
	end 
endmodule