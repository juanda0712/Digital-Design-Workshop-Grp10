module gpio_receiver(input clk, input clkPin, input [2:0] dataBus,
							output reg [2:0] buttonStates);

    always @(posedge clkPin) begin
        buttonStates <= dataBus;
    end
endmodule