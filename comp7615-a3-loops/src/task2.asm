
;
; file: task2.asm
; First assembly program. This program asks for two integers as
; input and prints out their sum.
;
; Using Linux and gcc:
; nasm -f elf32 -d ELF_TYPE asm_io.asm
; nasm -f elf32 -d ELF_TYPE task2.asm
; gcc -m32 -o task2 task2.o driver.c asm_io.o

%include "asm_io.inc"
;
; initialized data is put in the .data segment
;
segment .data
;
; These labels refer to strings used for output
;
prompt1 db    "Enter a number: ", 0       ; don't forget nul terminator
prompt2 db    "Enter another number: ", 0
outmsg1 db    "You entered ", 0
outmsg2 db    " and ", 0
outmsg3 db    ", using the equaltion (A+B)*A. The answer is ", 0


;
; uninitialized data is put in the .bss segment
;
segment .bss
;
; These labels refer to double words used to store the inputs
;
input1  resd 1
input2  resd 1

;
; code is put in the .text segment
;
segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha

        mov     eax, prompt1      ; print out prompt
        call    print_string

        call    read_int          ; read integer
        mov     [input1], eax     ; store into input1

        mov     eax, prompt2      ; print out prompt
        call    print_string

        call    read_int          ; read integer
        mov     [input2], eax     ; store into input2

        mov     eax, [input1]     ; eax = dword at input1
        add     eax, [input2]     ; eax += dword at input2
        mov     ebx, eax          ; ebx = eax
;
; next print out result message as series of steps
;
        mov     eax, outmsg1
        call    print_string      ; print out first message
        mov     eax, [input1]     
        call    print_int         ; print out input1
        mov     eax, outmsg2
        call    print_string      ; print out second message
        mov     eax, [input2]
        call    print_int         ; print out input2
        mov     eax, outmsg3
        call    print_string      ; print out third message

        ; executes equation of (input1 + input2) * input1
        mov 	eax, [input1]
        add     eax, [input2]    ; add input 1 and 2 together
	mul	dword [input1]  ; now mutliply that answer by input1
	call	print_int        ; print it out
	call 	print_nl	

        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


