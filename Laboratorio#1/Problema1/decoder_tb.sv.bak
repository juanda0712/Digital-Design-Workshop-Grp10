module decoder_tb();

    //Inputs
    logic [3:0] binary;
    
    //Outputs
    logic [5:0] bcd;
    
	 logic [6:0] seg;
	 
    //Se instancia el modulo decoder
    decoder dut(
        .binary(binary),
        .bcd(bcd),
		  .seg(seg)
    );
    
    
    initial begin
        // Prueba posibles valores de entrada
		  
		  // Prueba 1: entrada 4'b0000
        binary = 4'b0000;	
		  #10; // Añade un retardo para permitir que bcd se actualice
		  if (bcd == 6'b00_0000) $display("Prueba exitosa");
		  if (bcd != 6'b00_0000) $display("Prueba fallida");
		  #20 // Para esperar una cantidad de tiempo
		 
		  // Prueba 2: entrada 4'b0001
        binary = 4'b0001;
		  #10; // Añade un retardo para permitir que bcd se actualice
		  if (bcd == 6'b00_0001) $display("Prueba exitosa");
		  if (bcd != 6'b00_0001) $display("Prueba fallida");
		  #20 // Para esperar una cantidad de tiempo
		  
		   // Prueba 3: entrada b0010
        binary = 4'b0010;
		  #10; // Añade un retardo para permitir que bcd se actualice
		  if (bcd == 6'b00_0010) $display("Prueba exitosa");
		  if (bcd != 6'b00_0010) $display("Prueba fallida");
		  #20 // Para esperar una cantidad de tiempo
		  
		   
			// Prueba 4: entrada  4'b0011
        binary =  4'b0011;
		  #10; // Añade un retardo para permitir que bcd se actualice
		  if (bcd == 6'b00_0011) $display("Prueba exitosa");
		  if (bcd != 6'b00_0011) $display("Prueba fallida");
		  #20 // Para esperar una cantidad de tiempo
		  
		  
		  	// Prueba 5: entrada  4'b1111
        binary =  4'b1111;
		  #10; // Añade un retardo para permitir que bcd se actualice
		  if (bcd == 6'b01_0101) $display("Prueba exitosa"); 
		  if (bcd != 6'b01_0101) $display("Prueba fallida");
		  #20 // Para esperar una cantidad de tiempo
		  
		  
		  	// Prueba 6: entrada  4'b1110
        binary =  4'b1110;
		  #10; // Añade un retardo para permitir que bcd se actualice
		  if (bcd == 6'b01_0100) $display("Prueba exitosa");
		  if (bcd != 6'b01_0100) $display("Prueba fallida");
		 #20 // Para esperar una cantidad de tiempo
		 
		 
		 	// Prueba 7: entrada  4'b1101
        binary =  4'b1101;
		  #10; // Añade un retardo para permitir que bcd se actualice
		  if (bcd == 6'b01_0011) $display("Prueba exitosa");
		  if (bcd != 6'b01_0011) $display("Prueba fallida");
		  #20 // Para esperar una cantidad de tiempo
		  
		  
		  // Prueba 8: entrada  4'b1101
        binary =  4'b1100;
		  #10; // Añade un retardo para permitir que bcd se actualice
		  if (bcd == 6'b01_0010) $display("Prueba exitosa");
		  if (bcd != 6'b01_0010) $display("Prueba fallida");
	     #20 // Para esperar una cantidad de tiempo
		  
		 
        $display("El Testbench finalizo correctamente");
       
    end

endmodule



//Casos no probados en testbench pero si en valores forzados

//4'b0100
//4'b0101
//4'b0110
//4'b0111
//4'b1000
//4'b1001
//4'b1010
//4'b1011