section .data
    numero1 dd 2
    numero2 dd 2
    resultado dd 0
    resultado_msg db "El resultado de 2 / 2 es: ", 0
    nueva_linea db 0xA
    result_len equ $ - resultado_msg

section .text
    global _start

_start:
    ; Dividir los números
    mov eax, [numero1]
    mov ebx, [numero2]
    xor edx, edx
    div ebx
    add al, '0'
    mov [resultado], al

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
    mov eax, 4              ; Llamada al sistema para imprimir
    mov ebx, 1              ; Descriptor de archivo para stdout
    mov ecx, nueva_linea    ; Puntero al carácter de nueva línea
    mov edx, 1              ; Longitud del carácter (1 byte)
    int 0x80                ; Llamar al sistema para imprimir el carácter

    ; Salir del programa
    mov eax, 1       ; Código de salida del programa
    xor ebx, ebx     ; Sin errores
    int 0x80         ; Llamar al sistema operativo para salir
