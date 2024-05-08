section .data
    numero1 db 2     
    numero2 db 2     
    resultado db 0   
    resultado_msg db "El resultado de 2 * 2 es: ", 0 ; Mensaje a mostrar
    nueva_linea db 0xA 
    result_len equ $ - resultado_msg

section .text
    global _start

_start:
    ; Multiplicar los números
    mov al, [numero1]  ; Mover el primer número a AL
    mov bl, [numero2]  ; Mover el segundo número a BL
    mul bl             ; Multiplicar AL por BL
    add al, '0'        ; Convertir el resultado a ASCII
    mov [resultado], al ; Almacenar el resultado en la variable 'resultado'

    ; Mostrar el mensaje en la consola
    mov eax, 4              
    mov ebx, 1              
    mov ecx, resultado_msg  
    mov edx, result_len       
    int 0x80                

    ; Mostrar el resultado en la consola
    mov eax, 4              
    mov ebx, 1              
    mov ecx, resultado      
    mov edx, 1              
    int 0x80                

    ; Mostrar el carácter de nueva línea
    mov eax, 4              
    mov ebx, 1              
    mov ecx, nueva_linea    
    mov edx, 1              
    int 0x80                

    ; Salir del programa
    mov eax, 1       
    xor ebx, ebx     
    int 0x80         