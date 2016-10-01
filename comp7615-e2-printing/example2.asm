;
;
;

section .data

    msg: db "harrow everyburdy. howsit going there", 10
    len: equ $-msg                                            ; "$" equals THIS point in memory

section .text
    global CMAIN
CMAIN:

    mov edx, len
    mov rsi, msg
    mov rdi, 1
    mov rax, 1
    syscall

    mov rdi, 1
    mov rax, 60
    syscall
