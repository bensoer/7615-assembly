;;================================================================= 
;; nasm -f elf avgfloat.asm
;; gcc -m32 -o avgfloat.out avgfloat.o
;; ./avgfloat.out
;;
;;=================================================================
 %include "asm_io.inc"  

	extern printf                   ; the C function to be called
        SECTION .data                   ; Data section

msg     db      "sum = %e",0x0a,0x00
x       dd      1.5			;provided as 32bits
y       dd      2.5

z       dd      0.0 ; zed will be our holder
temp    dw      0
n       dw      0

table   dd      1.2, 2.3, 3.4, 4.5, 5.6
N equ ($-table)/4                              ; divide by 4 because $-table gets total bytes. 1 dd = 4 bytes. divide by 4 then to get length
        
        SECTION .text                   ; Code section.
        global  main                    ; "C" main program 
main:                                   ; label, start of main program
        
        mov ebx, 0                      ; start index at 0
        mov ecx, N                      ; set loop size
        mov [n], dword N                 ; mov N into temp memory 
        mov esi, table                  ; point esi to the first item in the table


loop:

        ;while index is less then N
                ; put z into fld
                ; put table[index] into fld
                ; add
                ; fstp answer to z

        fld dword [z]
        fld dword [esi]
        fadd
        fstp dword [z]

        ; move counters forward to the next item
        add esi, 4
        inc ebx
        
        ; check whether to continue or not
        cmp ebx, N
        jl loop


        ; put z into fld
        ; fdiv divide z by N
        ; fstp out z to tempt as 64 bit word

        ; convert the int into a floating point number
        fild dword [n]
        fstp dword [n]

        ; now divide total by number of items
        fld dword [z]
        fdiv dword [n]

        ; put results back into z
        fstp dword [z]



        ; print results

        fld     dword [z]               ; transform z in 64-bit word by pushing in stack
        fstp    qword [temp]            ; and popping it back as 64-bit quadword
        push    dword [temp+4]          ; push temp as 2 32-bit words
        push    dword [temp]
        push    dword msg               ; address of format string
        call    printf                  ; Call C function


        add     esp, 12                 ; pop stack 3*4 bytes

        mov     eax, 1                  ; exit code, 0=normal
        mov     ebx, 0
        int     0x80                    ;
        