;******************************************************
; A00843110 - Ben Soer - Assignment 2
;
; Execute:
; nasm greet32.asm -elf64
; gcc greet32.o -o greet32.out
; ./greet32.out
;******************************************************

; CONSTANTS
%assign SYS_EXIT        0        ; system exit
%assign WRITE           4        ; write command
%assign STDOUT          1        ; stdout
%assign ENDL            0x0a     ; \n character

; DATA
section .data

    msg db "hello"
        db ENDL
        db ENDL
        db "world!", ENDL        ; formatted message
    MSGLEN equ 14                ; length of msg variable

; CODE
section .text
global main

; MAIN FUNCTION
main:
    
    ;write the 'msg' variable to stdout
    mov eax, WRITE
    mov ebx, STDOUT
    lea ecx, [msg]
    mov edx, MSGLEN
    ;trigger execution
    int 0x80
    
    ;terminate program
    mov eax, SYS_EXIT
    mov ebx, 0
    int 0x80
    