;******************************************************
; A00843110 - Ben Soer - Assignment 2
;
; Execute:
; nasm name.asm -elf64
; gcc name.o -o name.out
; ./name.out
;******************************************************

; CONSTANTS
%assign WRITE           1         ;write command
%assign STDOUT          1         ;standard out
%assign ENDL            0x0a      ;\n character

; DATA
section .data
    
    border db "<<<<<<<<<<          ##########          >>>>>>>>>>", ENDL
    name db "<<                   Ben Soer                   >>", ENDL
    class db "<<                   COMP7615                   >>",ENDL
    
; CODE 
section .text
global main

; MAIN FUNCTION
main:

    ;send the border to stdout
    mov rsi, border
    mov rax, WRITE
    mov rdi, STDOUT
    mov rdx, 51
    ;execute
    syscall
    
    ;send the class row to stdout
    mov rsi, class
    mov rax, WRITE
    mov rdi, STDOUT
    mov rdx, 51
    ;execute
    syscall
    
    ;send the name row to stdout
    mov rsi, name
    mov rax, WRITE
    mov rdi, STDOUT
    mov rdx, 51
    ;execute
    syscall
    
    ;send the border again to stdout
    mov rsi, border
    mov rax, WRITE
    mov rdi, STDOUT
    mov rdx, 51
    ;execute
    syscall

    ;terminate
    mov eax, 0
    mov ebx, 0
    ret