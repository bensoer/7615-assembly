%include "asm_io.inc"

section .text
global asm_main

; count the number of 1's in a binary number
asm_main:
	mov eax, 0xF    ; eax is 32-bit
	mov bl, 0       ; bl is the lower byte of bx - 8 bits
	mov ecx, 32		; ecx is 32-bit

count_loop:
	shl eax			; msb will go into the carry flag
	jnc skip_inc	; jump if there is no carry
	inc bl			; increment bl - number of on 1 bits counted

skip_inc:
	loop count_loop
end:
	ret