;
; file: mystery2.asm
;

%include "asm_io.inc"

segment .data
num     dd   0

segment .bss
input   resd 1

segment .text
        global  main
main:
        enter   0,0                                             ; start of a function / new context
        pusha                                                   ; push all variables to the stack

        mov     edx, 1                                          ; mov 1 to edx
while_loop:
        push    edx                                             ; push edx onto the stack
        push    dword input                                     ; push input onto the stack
        call    get_int                                         ; get user input
        add     esp, 8                                          ; move stack pointer 8 bytes

        mov     eax, [input]                                    ; copy input valie to eax
        cmp     eax, 0                                          ; cmp eax and 0
        je      end_while                                       ; if eax is equal to 0 goto end_while

        add     [num], eax                                      ; add eax to num       

        inc     edx                                             ; increment the edx by 1
        jmp     short while_loop                                ; jmp to while_loop

end_while:
        push    dword [num]                                     ; push num onto the stack
        call    print_result                                    ; call print_result function
        pop     ecx                                             ; decrement the counter ?

        popa                                                    ; pop all variable from the stack
        leave                                                   ; leave - reset pointers and base
        ret                                                     ; move stack pointer back

segment .data
prompt  db      ") Enter integer number (0 to quit): ", 0

segment .text
get_int:
        push    ebp                                             ; start of function / context
        mov     ebp, esp

        mov     eax, [ebp + 12]                                 ; take 2nd parameter and mov to eax
        call    print_int                                       ; call print

        mov     eax, prompt                                     ; mov prompt to eax
        call    print_string                                    ; call print_string
        
        call    read_int                                        ; call read_int
        mov     ebx, [ebp + 8]                                  ; mov 2nd variable to ebx
        mov     [ebx], eax                                      ; mov eax to ebx

        pop     ebp                                             ; pop base pointer
        ret                                                     ; move stack pointer back

segment .data
result  db      "The result is: ", 0

segment .text
print_result:
        push    ebp                                             ; start of function / new context
        mov     ebp, esp

        mov     eax, result                                     ; mov the result string to eax
        call    print_string                                    ; call print_string

        mov     eax, [ebp+8]                                    ; move 2nd variable to eax
        call    print_int                                       ; call print_int
        call    print_nl                                        ; call print_nl

        pop     ebp                                             ; pop base pointer
        ret                                                     ; move stack pointer back

