module decoder(
    input logic [3:0] binary,
    output logic [3:0] tens, 
    output logic [3:0] units, 
    output logic [6:0] seg0,  
    output logic [6:0] seg1   
);

    always_comb begin
        tens = binary / 10;
        units = binary % 10; 
    end

    decoderFPGA decoderFPGA_inst (
        .tens(tens),
        .units(units),
        .seg0(seg0),
        .seg1(seg1)
    );

endmodule