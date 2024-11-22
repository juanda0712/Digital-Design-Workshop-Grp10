        // Procesar una imagen de 200x200 (entrada en 0x0000, salida en 0x20000)
        MOV     R0, #0x0000        // Dirección base de la imagen original
        MOV     R1, #0x20000       // Dirección base para almacenar la imagen procesada
        MOV     R2, #40000         // Número total de píxeles (200x200)

loop_start:
        LDRB    R3, [R0], #1       // Leer componente R y avanzar
        LDRB    R4, [R0], #1       // Leer componente G y avanzar
        LDRB    R5, [R0], #1       // Leer componente B y avanzar

        BL      apply_filter       // Aplicar filtro a (R3, R4, R5)
                                   // Resultado en R6, R7, R8

        STRB    R6, [R1], #1       // Guardar componente R' procesado
        STRB    R7, [R1], #1       // Guardar componente G' procesado
        STRB    R8, [R1], #1       // Guardar componente B' procesado

        SUBS    R2, R2, #1         // Restar 1 al contador de píxeles
        BNE     loop_start         // Si no se ha terminado, repetir

        B       end                // Fin del programa

apply_filter:
        // Implementa aquí la lógica del filtro, usando enteros
        // Ejemplo: filtro sepia escalado
        MOV     R9, #101           // 0.393 * 256
        MOV     R10, #197          // 0.769 * 256
        MOV     R11, #48           // 0.189 * 256
        MUL     R6, R3, R9         // R' = R*0.393
        MLA     R6, R4, R10, R6    // R' += G*0.769
        MLA     R6, R5, R11, R6    // R' += B*0.189
        LSR     R6, R6, #8         // Normalizar a 8 bits

        // Repite el cálculo para G' y B' (usando diferentes coeficientes)
        BX      LR                 // Regresa al ciclo principal

end:
        B       end                // Bucle infinito para detener la ejecución