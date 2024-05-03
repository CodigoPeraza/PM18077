section .data
    ; Mensaje de encabezado para el resultado
    result_header db 'El resultado de la resta de: ', 0
    result_len equ $ - result_header  ; Longitud del mensaje de encabezado
    newline db 10                      ; Salto de línea
    ; Definición de variables para los números y el resultado
    numero1 dw 0
    numero2 dw 0
    numero3 dw 0
    resultado db 0

section .text
    global _start
_start:
    ; Asignación de valores a las variables
    mov word [numero1], 8
    mov word [numero2], 5
    mov word [numero3], 1

    ; Realización de la resta y almacenamiento del resultado
    mov ax, [numero1]
    sub ax, [numero2]
    sub ax, [numero3]
    mov [resultado], ax

    ; Convertir los números de ASCII a valores enteros
    mov ax, [numero1]
    add ax, '0'
    mov [numero1], ax

    mov ax, [numero2]
    add ax, '0'
    mov [numero2], ax

    mov ax, [numero3]
    add ax, '0'
    mov [numero3], ax

    ; Convertir el resultado de nuevo a ASCII
    mov ax, [resultado]
    add ax, '0'
    mov [resultado], ax

    ; Mostrar el mensaje de resultado
    mov eax, 4
    mov ebx, 1
    mov ecx, result_header
    mov edx, result_len
    int 0x80

    ; Mostrar el formato de la operación
    mov eax, 4
    mov ebx, 1
    mov ecx, numero1
    call imprimir_numero
    mov eax, 4
    mov ebx, 1
    mov ecx, minus
    mov edx, minus_len
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, numero2
    call imprimir_numero
    mov eax, 4
    mov ebx, 1
    mov ecx, minus
    mov edx, minus_len
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, numero3
    call imprimir_numero
    mov eax, 4
    mov ebx, 1
    mov ecx, equal
    mov edx, equal_len
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    call imprimir_numero

    ; Mostrar un salto de línea
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Salir del programa
    mov eax, 1
    xor ebx, ebx
    int 0x80

imprimir_numero: ;Función
    mov eax, 4
    mov ebx, 1
    mov edx, 1
    int 0x80
    ret

section .data
    minus db ' -', 0        ; Texto " -" para separar los números
    minus_len equ $ - minus  ; Longitud del texto " -"
    equal db ' es ', 0      ; Texto " es " para indicar la igualdad
    equal_len equ $ - equal ; Longitud del texto " es "

