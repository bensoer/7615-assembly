%include "asm_io.inc"

section .data

    result dd 0

section .text
global mult_asm
mult_asm:
    
    enter 0,0    ;equiv to PUSH EBP, MOV EBP, ESP
    pusha        ; stores all 8 general registers
    
    mov eax, [ebp+8]    ; gets the number 3
    imul eax, [ebp+12]  ; gets the number -4
    mov [result], eax   ; move 32-bits of the whole product to result
    
    call print_int
    call print_nl
    
    popa                ; restores all general 8 registers
    mov eax, [result]   ; returns result value
    leave               ;take down base pointer
    ret                 ;quit lyfe
    
    
    
    
    ;write your code here
    xor eax, eax
    ret