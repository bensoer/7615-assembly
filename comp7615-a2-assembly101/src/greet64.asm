;******************************************************
; A00843110 - Ben Soer - Assignment 2
;
; Execute:
; nasm greet64.asm -elf64
; gcc greet64.o -o greet64.out
; ./greet64.out
;******************************************************

; CONSTANTS
%assign WRITE           1         ;write command
%assign STDOUT          1         ;standard out
%assign ENDL            0x0a      ;\n character

; DATA
section .data

    msg db "hello"
        db ENDL
        db ENDL
        db "world!", ENDL
    MSGLEN equ 14

; CODE
section .text
global main

; MAIN FUNCTION
main:

    ;wirte the 'msg' variable to stdout
    mov rax, WRITE
    mov rdi, STDOUT
    mov rsi, msg
    mov rdx, MSGLEN
    ;trigger execution
    syscall
    
    ;terminate program
    mov rdi, 0
    mov eax, 0
    mov ebx, 0
    ret