module videoGen(
    input logic [9:0] x, y,         
    input logic [3:0] estado,
	 input logic [1:0] row_out,
	 input logic [1:0] col_out,
	 input logic [1:0] board [3:1][3:1],
	 input logic [1:0] winner,
	 input logic cant_player,       
    output logic [7:0] r, g, b      
);

    // Definir si mostramos alguna letra "T", "1P" o "2P"
    logic mostrarTexto, mostrarTexto1P, mostrarTextoIIP, 
		 mostrarTextoOrden, dibujarTablero, dibujarJugador1, 
		 dibujarJugador2, dibujarJugadorActual, jugador1, jugador2;

    // Centro de la pantalla
    localparam integer centroX = 320;
    localparam integer centroY = 240;

    // Tamaño de cada letra "T", "1P", "2P"
    localparam integer letraAltura = 40;
    localparam integer letraAncho = 30;

    // Grosor de la parte vertical de las letras
    localparam integer grosorVertical = 5;

    // Grosor de la parte horizontal de las letras
    localparam integer grosorHorizontal = 5;

    // Distancia entre las letras
    localparam integer espacioEntreLetras = 60;
	 
	 logic [1:0] row, col;

    // Lógica para mostrar letras "T T T" en coordenadas específicas
    always_comb begin
        mostrarTexto = 1'b0;

        if (estado == 4'b0000) begin
            // Primera "T" (a la izquierda del centro)
            if ((y >= centroY - letraAltura / 2 && y <= centroY + letraAltura / 2) && 
                (x >= centroX - espacioEntreLetras - letraAncho && x <= centroX - espacioEntreLetras)) begin
                // Parte vertical de la "T"
                if ((x >= centroX - espacioEntreLetras - letraAncho / 2 - grosorVertical / 2) && 
                    (x <= centroX - espacioEntreLetras - letraAncho / 2 + grosorVertical / 2))
                    mostrarTexto = 1'b1;
                // Parte horizontal de la "T"
                else if (y >= centroY - letraAltura / 2 && y <= centroY - letraAltura / 2 + grosorHorizontal)
                    mostrarTexto = 1'b1;
            end

            // Segunda "T" (en el centro)
            if ((y >= centroY - letraAltura / 2 && y <= centroY + letraAltura / 2) && 
                (x >= centroX - letraAncho / 2 && x <= centroX + letraAncho / 2)) begin
                // Parte vertical de la "T"
                if (x >= centroX - grosorVertical / 2 && x <= centroX + grosorVertical / 2)
                    mostrarTexto = 1'b1;
                // Parte horizontal de la "T"
                else if (y >= centroY - letraAltura / 2 && y <= centroY - letraAltura / 2 + grosorHorizontal)
                    mostrarTexto = 1'b1;
            end

            // Tercera "T" (a la derecha del centro)
            if ((y >= centroY - letraAltura / 2 && y <= centroY + letraAltura / 2) && 
                (x >= centroX + espacioEntreLetras && x <= centroX + espacioEntreLetras + letraAncho)) begin
                // Parte vertical de la "T"
                if ((x >= centroX + espacioEntreLetras + letraAncho / 2 - grosorVertical / 2) && 
                    (x <= centroX + espacioEntreLetras + letraAncho / 2 + grosorVertical / 2))
                    mostrarTexto = 1'b1;
                // Parte horizontal de la "T"
                else if (y >= centroY - letraAltura / 2 && y <= centroY - letraAltura / 2 + grosorHorizontal)
                    mostrarTexto = 1'b1;
            end
        end
    end

    // Lógica para mostrar "1P" e "IIP" en coordenadas específicas
    always_comb begin
        mostrarTexto1P = 1'b0;
        mostrarTextoIIP = 1'b0;

        if (estado == 4'b0001) begin
            // Renderizar "1P"
            // Renderizar el "1"
            if ((y >= centroY - letraAltura / 2 && y <= centroY + letraAltura / 2) && 
                (x >= centroX - 100 && x <= centroX - 100 + letraAncho)) begin
                // Parte vertical del "1"
                if (x >= centroX - 100 + letraAncho - grosorVertical && x <= centroX - 100 + letraAncho)
                    mostrarTexto1P = 1'b1;
            end
            // Renderizar la "P"
            if ((y >= centroY - letraAltura / 2 && y <= centroY + letraAltura / 2) && 
                (x >= centroX - 60 && x <= centroX - 60 + letraAncho)) begin
                // Parte vertical de la "P"
                if (x >= centroX - 60 && x <= centroX - 60 + grosorVertical)
                    mostrarTexto1P = 1'b1;
                // Parte horizontal superior de la "P"
                else if (y >= centroY - letraAltura / 2 && y <= centroY - letraAltura / 2 + grosorHorizontal)
                    mostrarTexto1P = 1'b1;
                // Parte curva de la "P"
                else if ((y >= centroY - letraAltura / 2 && y <= centroY) && 
                         (x >= centroX - 60 + grosorVertical && x <= centroX - 60 + letraAncho))
                    mostrarTexto1P = 1'b1;
            end

            // Renderizar "IIP"
            // Renderizar el primer "I"
            if ((y >= centroY - letraAltura / 2 && y <= centroY + letraAltura / 2) && 
                (x >= centroX + 35 && x <= centroX + 35 + grosorVertical)) begin
                mostrarTextoIIP = 1'b1;
            end

            // Renderizar el segundo "I"
            if ((y >= centroY - letraAltura / 2 && y <= centroY + letraAltura / 2) && 
                (x >= centroX + 55 && x <= centroX + 55 + grosorVertical)) begin
                mostrarTextoIIP = 1'b1;
            end

            // Renderizar la "P"
            if ((y >= centroY - letraAltura / 2 && y <= centroY + letraAltura / 2) && 
                (x >= centroX + 70 && x <= centroX + 70 + letraAncho)) begin
                // Parte vertical de la "P"
                if (x >= centroX + 70 && x <= centroX + 70 + grosorVertical)
                    mostrarTextoIIP = 1'b1;
                // Parte horizontal superior de la "P"
                else if (y >= centroY - letraAltura / 2 && y <= centroY - letraAltura / 2 + grosorHorizontal)
                    mostrarTextoIIP = 1'b1;
                // Parte curva de la "P"
                else if ((y >= centroY - letraAltura / 2 && y <= centroY) && 
                         (x >= centroX + 70 + grosorVertical && x <= centroX + 70 + letraAncho))
                    mostrarTextoIIP = 1'b1;
            end
        end
    end
	 
	 // Ganador "1P"
    always_comb begin
		jugador1 = 1'b0;
		
		if (estado == 4'b1000 && winner == 2'b01) begin
            // Renderizar "1P"
            // Renderizar el "1"
            if ((y >= centroY - letraAltura / 2 && y <= centroY + letraAltura / 2) && 
                (x >= centroX - 100 && x <= centroX - 100 + letraAncho)) begin
                // Parte vertical del "1"
                if (x >= centroX - 100 + letraAncho - grosorVertical && x <= centroX - 100 + letraAncho)
                    jugador1 = 1'b1;
            end
            // Renderizar la "P"
            if ((y >= centroY - letraAltura / 2 && y <= centroY + letraAltura / 2) && 
                (x >= centroX - 60 && x <= centroX - 60 + letraAncho)) begin
                // Parte vertical de la "P"
                if (x >= centroX - 60 && x <= centroX - 60 + grosorVertical)
                    jugador1 = 1'b1;
                // Parte horizontal superior de la "P"
                else if (y >= centroY - letraAltura / 2 && y <= centroY - letraAltura / 2 + grosorHorizontal)
                    jugador1 = 1'b1;
                // Parte curva de la "P"
                else if ((y >= centroY - letraAltura / 2 && y <= centroY) && 
                         (x >= centroX - 60 + grosorVertical && x <= centroX - 60 + letraAncho))
                    jugador1 = 1'b1;
            end
        end
    end
	 
	 // Ganador "11P"
    always_comb begin
        jugador2 = 1'b0;
		  
		  if (estado == 4'b1000 && winner == 2'b10) begin
            // Renderizar "IIP"
            // Renderizar el primer "I"
            if ((y >= centroY - letraAltura / 2 && y <= centroY + letraAltura / 2) && 
                (x >= centroX + 35 && x <= centroX + 35 + grosorVertical)) begin
                jugador2 = 1'b1;
            end

            // Renderizar el segundo "I"
            if ((y >= centroY - letraAltura / 2 && y <= centroY + letraAltura / 2) && 
                (x >= centroX + 55 && x <= centroX + 55 + grosorVertical)) begin
                jugador2 = 1'b1;
            end

            // Renderizar la "P"
            if ((y >= centroY - letraAltura / 2 && y <= centroY + letraAltura / 2) && 
                (x >= centroX + 70 && x <= centroX + 70 + letraAncho)) begin
                // Parte vertical de la "P"
                if (x >= centroX + 70 && x <= centroX + 70 + grosorVertical)
                    jugador2 = 1'b1;
                // Parte horizontal superior de la "P"
                else if (y >= centroY - letraAltura / 2 && y <= centroY - letraAltura / 2 + grosorHorizontal)
                    jugador2 = 1'b1;
                // Parte curva de la "P"
                else if ((y >= centroY - letraAltura / 2 && y <= centroY) && 
                         (x >= centroX + 70 + grosorVertical && x <= centroX + 70 + letraAncho))
                    jugador2 = 1'b1;
            end
        end
    end
	 
	 // Lógica para mostrar "1P" e "IIP" en coordenadas específicas
    always_comb begin
        mostrarTextoOrden = 1'b0;

        if (estado == 4'b0010) begin
			  // Renderizar "ORDEN" (como título)
			  // Renderizar la "O"
			  if ((y >= centroY - 100 - letraAltura / 2 && y <= centroY - 100 + letraAltura / 2) && 
					(x >= centroX - 70 && x <= centroX - 70 + letraAncho)) begin
					// Parte vertical izquierda de la "O"
					if (x >= centroX - 70 && x <= centroX - 70 + grosorVertical)
						 mostrarTextoOrden = 1'b1;
					// Parte vertical derecha de la "O"
					else if (x >= centroX - 70 + letraAncho - grosorVertical && x <= centroX - 70 + letraAncho)
						 mostrarTextoOrden = 1'b1;
					// Parte horizontal superior de la "O"
					else if (y >= centroY - 100 - letraAltura / 2 && y <= centroY - 100 - letraAltura / 2 + grosorHorizontal)
						 mostrarTextoOrden = 1'b1;
					// Parte horizontal inferior de la "O"
					else if (y >= centroY - 100 + letraAltura / 2 - grosorHorizontal && y <= centroY - 100 + letraAltura / 2)
						 mostrarTextoOrden = 1'b1;
			  end

			  // Renderizar la "R"
			  if ((y >= centroY - 100 - letraAltura / 2 && y <= centroY - 100 + letraAltura / 2) && 
					(x >= centroX - 30 && x <= centroX - 30 + letraAncho)) begin
					// Parte vertical de la "R"
					if (x >= centroX - 30 && x <= centroX - 30 + grosorVertical)
						 mostrarTextoOrden = 1'b1;
					// Parte horizontal superior de la "R"
					else if (y >= centroY - 100 - letraAltura / 2 && y <= centroY - 100 - letraAltura / 2 + grosorHorizontal)
						 mostrarTextoOrden = 1'b1;
					// Parte curva de la "R"
					else if ((y >= centroY - 100 && y <= centroY - 100 + grosorHorizontal) && 
								(x >= centroX - 30 + grosorVertical && x <= centroX - 30 + letraAncho))
						 mostrarTextoOrden = 1'b1;
					// Parte diagonal de la "R"
					else if (y >= centroY - 100 && x >= centroX - 30 + grosorVertical && 
								x <= centroX - 30 + letraAncho)
						 mostrarTextoOrden = 1'b1;
			  end

			  // Renderizar la "D"
			  if ((y >= centroY - 100 - letraAltura / 2 && y <= centroY - 100 + letraAltura / 2) && 
					(x >= centroX + 10 && x <= centroX + 10 + letraAncho)) begin
					// Parte vertical de la "D"
					if (x >= centroX + 10 && x <= centroX + 10 + grosorVertical)
						 mostrarTextoOrden = 1'b1;
					// Parte curva derecha de la "D"
					else if (x >= centroX + 10 + letraAncho - grosorVertical && y >= centroY - 100 - letraAltura / 2 && 
								y <= centroY - 100 + letraAltura / 2)
						 mostrarTextoOrden = 1'b1;
					// Parte horizontal superior e inferior de la "D"
					else if (y >= centroY - 100 - letraAltura / 2 && y <= centroY - 100 - letraAltura / 2 + grosorHorizontal ||
								y >= centroY - 100 + letraAltura / 2 - grosorHorizontal && y <= centroY - 100 + letraAltura / 2)
						 mostrarTextoOrden = 1'b1;
			  end

			  // Renderizar la "E"
			  if ((y >= centroY - 100 - letraAltura / 2 && y <= centroY - 100 + letraAltura / 2) && 
					(x >= centroX + 50 && x <= centroX + 50 + letraAncho)) begin
					// Parte vertical de la "E"
					if (x >= centroX + 50 && x <= centroX + 50 + grosorVertical)
						 mostrarTextoOrden = 1'b1;
					// Parte horizontal superior de la "E"
					else if (y >= centroY - 100 - letraAltura / 2 && y <= centroY - 100 - letraAltura / 2 + grosorHorizontal)
						 mostrarTextoOrden = 1'b1;
					// Parte horizontal central de la "E"
					else if (y >= centroY - 100 && y <= centroY - 100 + grosorHorizontal)
						 mostrarTextoOrden = 1'b1;
					// Parte horizontal inferior de la "E"
					else if (y >= centroY - 100 + letraAltura / 2 - grosorHorizontal && y <= centroY - 100 + letraAltura / 2)
						 mostrarTextoOrden = 1'b1;
			  end

			  // Renderizar la "N"
			  if ((y >= centroY - 100 - letraAltura / 2 && y <= centroY - 100 + letraAltura / 2) && 
					(x >= centroX + 90 && x <= centroX + 90 + letraAncho)) begin
					// Parte vertical izquierda de la "N"
					if (x >= centroX + 90 && x <= centroX + 90 + grosorVertical)
						 mostrarTextoOrden = 1'b1;
					// Parte vertical derecha de la "N"
					else if (x >= centroX + 90 + letraAncho - grosorVertical && x <= centroX + 90 + letraAncho)
						 mostrarTextoOrden = 1'b1;
					// Parte diagonal de la "N"
					else if (y == centroY - 100 - letraAltura / 2 + (x - (centroX + 90)))
						 mostrarTextoOrden = 1'b1;
			  end
            // Renderizar "1P"
            // Renderizar el "1"
            if ((y >= centroY - letraAltura / 2 && y <= centroY + letraAltura / 2) && 
                (x >= centroX - 100 && x <= centroX - 100 + letraAncho)) begin
                // Parte vertical del "1"
                if (x >= centroX - 100 + letraAncho - grosorVertical && x <= centroX - 100 + letraAncho)
                    mostrarTextoOrden = 1'b1;
            end
            // Renderizar la "P"
            if ((y >= centroY - letraAltura / 2 && y <= centroY + letraAltura / 2) && 
                (x >= centroX - 60 && x <= centroX - 60 + letraAncho)) begin
                // Parte vertical de la "P"
                if (x >= centroX - 60 && x <= centroX - 60 + grosorVertical)
                    mostrarTextoOrden = 1'b1;
                // Parte horizontal superior de la "P"
                else if (y >= centroY - letraAltura / 2 && y <= centroY - letraAltura / 2 + grosorHorizontal)
                    mostrarTextoOrden = 1'b1;
                // Parte curva de la "P"
                else if ((y >= centroY - letraAltura / 2 && y <= centroY) && 
                         (x >= centroX - 60 + grosorVertical && x <= centroX - 60 + letraAncho))
                    mostrarTextoOrden = 1'b1;
            end

            // Renderizar "IIP"
            // Renderizar el primer "I"
            if ((y >= centroY - letraAltura / 2 && y <= centroY + letraAltura / 2) && 
                (x >= centroX + 35 && x <= centroX + 35 + grosorVertical)) begin
                mostrarTextoOrden = 1'b1;
            end

            // Renderizar el segundo "I"
            if ((y >= centroY - letraAltura / 2 && y <= centroY + letraAltura / 2) && 
                (x >= centroX + 55 && x <= centroX + 55 + grosorVertical)) begin
                mostrarTextoOrden = 1'b1;
            end

            // Renderizar la "P"
            if ((y >= centroY - letraAltura / 2 && y <= centroY + letraAltura / 2) && 
                (x >= centroX + 70 && x <= centroX + 70 + letraAncho)) begin
                // Parte vertical de la "P"
                if (x >= centroX + 70 && x <= centroX + 70 + grosorVertical)
                    mostrarTextoOrden = 1'b1;
                // Parte horizontal superior de la "P"
                else if (y >= centroY - letraAltura / 2 && y <= centroY - letraAltura / 2 + grosorHorizontal)
                    mostrarTextoOrden = 1'b1;
                // Parte curva de la "P"
                else if ((y >= centroY - letraAltura / 2 && y <= centroY) && 
                         (x >= centroX + 70 + grosorVertical && x <= centroX + 70 + letraAncho))
                    mostrarTextoOrden = 1'b1;
            end
        end
    end
	 
	 always_comb begin
		 dibujarTablero = 1'b0;
		 dibujarJugador1 = 1'b0;
		 dibujarJugador2 = 1'b0;
		 dibujarJugadorActual = 1'b0;

		 // Calcular la fila y columna en función de la posición (x, y)
		 row = (y < 160) ? 1 : (y > 165 && y < 320) ? 2 : (y > 325) ? 3 : 0;
		 col = (x < 213) ? 1 : (x > 218 && x < 426) ? 2 : (x > 431) ? 3 : 0;

		 // Mostrar el tablero y los jugadores en los estados correspondientes
		 if (estado == 4'b0011 || estado == 4'b0100 || estado == 4'b0101) begin
			  // Líneas verticales del tablero
			  if ((x >= 213 && x <= 218) || (x >= 426 && x <= 431)) begin
					dibujarTablero = 1'b1;
			  end
			  // Líneas horizontales del tablero
			  if ((y >= 160 && y <= 165) || (y >= 320 && y <= 325)) begin
					dibujarTablero = 1'b1;
			  end

			  // Dibuja las marcas de los jugadores en cada casilla del tablero
			  case (board[row][col])
					2'b01: dibujarJugador1 = 1'b1; // Jugador 1
					2'b10: dibujarJugador2 = 1'b1; // Jugador 2
					default: begin
						 dibujarJugador1 = 1'b0;
						 dibujarJugador2 = 1'b0;
					end
			  endcase
		 end

		 // Lógica para dibujar el cuadro rojo en la posición actual del jugador
		 if (estado == 4'b0011 || estado == 4'b0100) begin
			  // Definir las coordenadas donde se dibujará el cuadro rojo dependiendo de `row_out` y `col_out`
			  if ((row_out == 2'b01 && col_out == 2'b01) && (x >= 10 && x <= 50 && y >= 10 && y <= 50)) begin
					dibujarJugadorActual = 1'b1;
			  end else if ((row_out == 2'b01 && col_out == 2'b10) && (x >= 213 && x <= 253 && y >= 10 && y <= 50)) begin
					dibujarJugadorActual = 1'b1;
			  end else if ((row_out == 2'b01 && col_out == 2'b11) && (x >= 426 && x <= 466 && y >= 10 && y <= 50)) begin
					dibujarJugadorActual = 1'b1;
			  end else if ((row_out == 2'b10 && col_out == 2'b01) && (x >= 10 && x <= 50 && y >= 160 && y <= 200)) begin
					dibujarJugadorActual = 1'b1;
			  end else if ((row_out == 2'b10 && col_out == 2'b10) && (x >= 213 && x <= 253 && y >= 160 && y <= 200)) begin
					dibujarJugadorActual = 1'b1;
			  end else if ((row_out == 2'b10 && col_out == 2'b11) && (x >= 426 && x <= 466 && y >= 160 && y <= 200)) begin
					dibujarJugadorActual = 1'b1;
			  end else if ((row_out == 2'b11 && col_out == 2'b01) && (x >= 10 && x <= 50 && y >= 320 && y <= 360)) begin
					dibujarJugadorActual = 1'b1;
			  end else if ((row_out == 2'b11 && col_out == 2'b10) && (x >= 213 && x <= 253 && y >= 320 && y <= 360)) begin
					dibujarJugadorActual = 1'b1;
			  end else if ((row_out == 2'b11 && col_out == 2'b11) && (x >= 426 && x <= 466 && y >= 320 && y <= 360)) begin
					dibujarJugadorActual = 1'b1;
			  end else begin
					dibujarJugadorActual = 1'b0;
			  end
		 end
	end

    // Lógica para asignar los colores según el estado
	always_comb begin
		 if (estado == 4'b0000) begin
			  if (mostrarTexto)
					{r, g, b} = {8'hFF, 8'hFF, 8'hFF};  // Texto blanco
			  else
					{r, g, b} = {8'h00, 8'h00, 8'h00};  // Fondo negro
		 end else if (estado == 4'b0001) begin
			  if (mostrarTexto1P || mostrarTextoIIP)
					{r, g, b} = {8'hFF, 8'hFF, 8'hFF};  // Letras blancas
			  else
					{r, g, b} = {8'h00, 8'h00, 8'h00};  // Fondo negro
		 end else if (estado == 4'b0010) begin
			  if (mostrarTextoOrden)
					{r, g, b} = {8'hFF, 8'hFF, 8'hFF};  // Letras blancas
			  else
					{r, g, b} = {8'h00, 8'h00, 8'h00};  // Fondo negro
		 end else if (estado == 4'b0011 || estado == 4'b0101 || estado == 4'b0100 || estado == 4'b0110 || estado == 4'b0111) begin
			  // Colores para los jugadores y el tablero
			  if (dibujarJugador1)
					{r, g, b} = {8'hFF, 8'hFF, 8'h00};  // Amarillo: Jugador 1
			  else if (dibujarJugador2)
					{r, g, b} = {8'h00, 8'hFF, 8'hFF};  // Cian: Jugador 2
			  else if (dibujarTablero)
					{r, g, b} = {8'hFF, 8'hFF, 8'hFF};  // Blanco: Tablero
			  // Condición para dibujar el cuadro rojo en la posición del jugador actual
			  else if (dibujarJugadorActual)
					{r, g, b} = {8'hFF, 8'h00, 8'h00};  // Rojo: Cuadro que representa la posición actual del jugador
			  else
					{r, g, b} = {8'h00, 8'h00, 8'h00};  // Negro: Fondo
		 end else if (estado == 4'b1000) begin
			  // Winner
			  if (jugador1 && winner == 2'b01)
					{r, g, b} = {8'hFF, 8'hFF, 8'h00};  // Amarillo: Jugador 1
			  else if (jugador2 && winner == 2'b10)
					{r, g, b} = {8'h00, 8'hFF, 8'hFF};  // Cian: Jugador 2
			  else
					{r, g, b} = {8'hFF, 8'hFF, 8'hFF};  // Negro: Fondo
		 end else begin
			  case (estado)
					//4'b0110: {r, g, b} = {8'h80, 8'h80, 8'h80};  // Gris: chequeo de ganador
					//4'b0111: {r, g, b} = {8'h00, 8'h00, 8'h00};  // Negro: ataque random
					//4'b1000: {r, g, b} = {8'hFF, 8'hFF, 8'hFF};  // Blanco: fin de juego
					default: {r, g, b} = {8'hFF, 8'h00, 8'h00};  // Rojo: cualquier otro estado
			  endcase
		 end
	end
endmodule
