;******************************************************
; A00843110 - Ben Soer - Assignment 2
;
; THIS CODE HAS NO MAIN ENTRANCE, USE WITH ANOTHER DRIVER
; Execute:
; nasm asmadder.asm -elf32
; gcc -m32 asmadder.o driver.c -o a.out
; ./a.out
;******************************************************

; DATA
section .data

; CODE
section .text
global asmadder

; adder function . import into C as: extern int asmadder(int first, int second, int third)
; @return int - The sum of the 3 parameters
asmadder:
    
    ;setup
    push ebp
    mov ebp, esp
    
    ;get first parameter
    mov eax, [ebp+8]
    ;get second parameter and add to first
    add eax, [ebp+12]
    ;get third parameter and add
    add eax, [ebp+16]
    
    ;cleanup
    mov esp, ebp
    pop ebp
   
    ret
    