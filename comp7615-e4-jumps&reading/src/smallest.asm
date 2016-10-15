;---------------------------------
; This file requires a driver to operate. Operands are hardcoded in the smallest_driver.c file
; This program will print out the smallest value and then return it to the driver aswell
; Build:
;	nasm -elf32 -d ELF_TYPE smallest.asm
;	gcc -m32 smallest-driver.c smallest.o asm_io.o -o smallest.out
; Execute:
;	./smallest.out
;--------------------------------

%include "asm_io.inc"

segment .text
	global smallest 

smallest: 

	push ebp
    mov ebp, esp				; we need new context to start this
	
	mov ebx, [ebp+8]			;third
	mov ecx, [ebp+12]			;second
	mov edx, [ebp+16]			;first

	cmp edx, ecx				;compare first and the second
	jle first_smaller_then_second

	;means the first is not smaller then second
	cmp ecx, ebx				; compare second and the third
	jle second_smaller_then_third

	;means the second is not smaller then the third
	;the third is the smallest in this case then

	mov eax, ebx
	call print_int
	call print_nl

	mov esp, ebp
    pop ebp

	;mov eax, 0
	ret


second_smaller_then_third:
	
	; means that the second number is the smallest
	mov eax, ecx						; move ecx to eax
	call print_int						; call print_int
	call print_nl

	mov esp, ebp
    pop ebp

    ret


first_smaller_then_second:


	cmp edx, ebx						; compare first and the third
	jle first_smaller_then_third

	; means the first is not smaller then the third
	; the third is the smallest in this case then

	mov eax, ebx
	call print_int
	call print_nl

	mov esp, ebp
    pop ebp

    ret


first_smaller_then_third:
	
	; means the third is the smallest number
	mov  eax, ecx                	; move 2nd variable to eax
    call print_int               	; call print_int
    call print_nl

    mov esp, ebp
    pop ebp

    ret