.global main  

.data

matrix1:
    .word 1, 2, 3, 4
    .word 1, 2, 3, 4
    .word 1, 2, 3, 4
    .word 1, 2, 3, 4

matrix2:
    .word 1, 1, 1, 1 
    .word 2, 2, 2, 2
    .word 3, 3, 3, 3 
    .word 4, 4, 4, 4

result: 
    .space 64  @ Reserva espacio 

.text  

main: 

    @ Carga la dirección de matrix1 en un registro.
    ldr r0, =matrix1
    
    @ Carga la dirección de matrix2 en un registro.
    ldr r1, =matrix2
    
    @ Carga la dirección de result en un registro.
    ldr r2, =result
    
    @ Inicia un bucle para recorrer los arrays (cada array tiene 16 elementos).
    mov r3, #0  @ Inicializa un contador para el bucle.
loop:
    @ Carga los elementos de matrix1 y matrix2.
    ldr r4, [r0, r3, lsl #2]  @ Carga un elemento de matrix1.
    ldr r5, [r1, r3, lsl #2]  @ Carga un elemento de matrix2.
    
    @ Suma los elementos.
    add r6, r4, r5  @ Suma los elementos de matrix1 y matrix2.
    
    @ Almacena el resultado.
    str r6, [r2, r3, lsl #2]  @ Almacena el elemento resultado en el array result.
    
    @ Incrementa el contador.
    add r3, r3, #1  @ Incrementa el contador del bucle.
    
    @ Comprueba si el contador ha llegado a 16 (fin de los arrays).
    cmp r3, #16  
    blt loop  
    
    b end  

end:

    b end  
