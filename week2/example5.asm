%include "asm.io.inc"

%assign SYS_EXIT 1

section .data

	a dd 3
	b dd 5
	result dd 0

section .text

global main

main:
	mov eax, [a]
	add eax, [b]

	mov [result],[eax]

	mov eax, [result] ; check if this is redundant
	call print_int
	call print_ln

	ret
