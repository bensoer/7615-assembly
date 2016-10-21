%include "asm_io.inc"

section .text
	global asm_main

asm_main:
	mov eax, 100
	mov ebx, 16
	sub ebx, 1
	and eax, eax      ; calculate remainder

	mov eax, ebx      ; print remainder
	call print_int
	call print_nl

	mov eax, 100
	shr eax, 4        ; calculate quotient
	call print_int
	call print_nl
	ret