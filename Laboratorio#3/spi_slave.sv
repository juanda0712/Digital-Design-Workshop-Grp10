module spi_slave (input logic SCK, MOSI, SS, 
						output logic [2:0] buttonStates);

    logic [1:0] bitCounter = 2'b0;
    logic [2:0] dataReceived = 3'b0;
    
    always @(posedge SCK or posedge SS) begin
        if (SS) begin
            bitCounter <= 2'b0;
        end else begin
            dataReceived <= {dataReceived[1:0], MOSI};
            bitCounter <= bitCounter + 1;
            
            if (bitCounter == 2) begin
                buttonStates <= dataReceived;
            end
        end
    end
endmodule