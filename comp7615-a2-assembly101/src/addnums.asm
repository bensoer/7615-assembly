;******************************************************
; A00843110 - Ben Soer - Assignment 2
;
; Execute:
; nasm addnums.asm -f elf32
; gcc -m32 addnums.o -o addnums.out
; ./addnums.out
;******************************************************

; CONSTANTS
%assign SYS_EXIT        0        ; system exit code
%assign WRITE           4        ; write command
%assign STDOUT          1        ; stdout
%assign ENDL            0x0a     ; \n character

; DATA
section .data

    format: dd `num: %d\n`, 10, 0

; CODE
section .text

;EXTERNAL IMPORTS
extern printf
extern fflush
global main

; MAIN FUNCTION
main:
    
    ;call sumup
    mov ebx, 3
    mov ecx, 5
    mov edx, 6
    call sumup
      
    ;print results
    call asmprintf
    
    ;call sumup
    mov ebx, 15
    mov ecx, 20
    mov edx, 30
    call sumup
    
    ;print those results
    call asmprintf
         
    ;terminate program
    mov eax, SYS_EXIT
    mov ebx, 0
    
    ret
    
; ADD 3 NUMBERS AND RETURN
sumup:
    
    mov eax, ebx
    add eax, ecx
    add eax, edx
    
    ret
    
; PRINT EAX CONTENT TO STDOUT
asmprintf:

     ;prep
     push ebp
     mov ebp,esp
              
     push eax                    ; push EAX ref onto stack
     push dword format           ; push format onto stack
     call printf                 ; call printf system call
     
     ;cleanup
     add esp, 8
     mov esp,ebp
     pop ebp
    
     ret
    