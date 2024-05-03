section .data
    ; Mensaje de encabezado para el resultado
    msj_resultado db 'El resultado de la multiplicacion de: ', 0
    result_len equ $ - msj_resultado  ; Longitud del mensaje de encabezado
    newline db 10                      ; Salto de línea

section .bss
    resultado resb 1

section .text
global _start

_start:
mov ax, 3
mov cx, 2

mul cx

add ax, 48
mov [resultado], ax

; Mostrar el mensaje de resultado
mov eax, 4
mov ebx, 1
mov ecx, msj_resultado
mov edx, result_len
int 0x80

mov eax, 4
mov ebx, 1
mov ecx, resultado
mov edx, 1
int 0x80

mov eax, 1
mov ebx, 0
int 0x80