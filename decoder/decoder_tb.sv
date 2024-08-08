module decoder_tb;

    reg [3:0] binary;
    wire [6:0] seg0;
    wire [6:0] seg1;

    decoder uut (
        .binary(binary),
        .seg0(seg0),
        .seg1(seg1)
    );

    initial begin
        $monitor("Time=%0d, binary=%b, seg0=%b, seg1=%b", $time, binary, seg0, seg1);
        
        binary = 4'b0000; 
        #10;
        binary = 4'b0001; 
        #10;
        binary = 4'b0010; 
        #10;
        binary = 4'b0011; 
        #10;
        binary = 4'b0100; 
        #10;
        binary = 4'b0101; 
        #10;
        binary = 4'b0110; 
        #10;
        binary = 4'b0111; 
        #10;
        binary = 4'b1000; 
        #10;
        binary = 4'b1001; 
        #10;
        binary = 4'b1010; 
        #10;
        binary = 4'b1011; 
        #10;
        binary = 4'b1100; 
        #10;
        binary = 4'b1101; 
        #10;
        binary = 4'b1110; 
        #10;
        binary = 4'b1111; 
        #10;
        
        $finish; 
    end
endmodule
