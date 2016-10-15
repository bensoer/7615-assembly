	.file	"fib.c"
	.intel_syntax noprefix
	.section	.rodata
.LC0:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	push	rbp 				; push old base pointer onto the stack
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp				; point base pointer to current stack pointer
	.cfi_def_cfa_register 6
	sub	rsp, 16					; move stack pointer to the top of the stack 
	mov	DWORD PTR [rbp-12], 0	; set 3rd variable to 0
	mov	DWORD PTR [rbp-8], 1	; set 2nd variable to 1
.L2:
	mov	eax, DWORD PTR [rbp-12]	; move 3rd variable to eax
	mov	esi, eax				; move eax into esi
	mov	edi, OFFSET FLAT:.LC0	; set edi to end of string
	mov	eax, 0					; mov 0 to eax
	call	printf				; print results
	mov	edx, DWORD PTR [rbp-12]	; mov 3rd variable to edx
	mov	eax, DWORD PTR [rbp-8]	; mov 2nd variable to eax
	add	eax, edx				; add. place anser in eax
	mov	DWORD PTR [rbp-4], eax	; mov eax to 1st variable

	mov	eax, DWORD PTR [rbp-8]	; mov 2nd variable to eax
	mov	DWORD PTR [rbp-12], eax	; mov eax to 3rd variable

	mov	eax, DWORD PTR [rbp-4]	; mov 1st variable to eax
	mov	DWORD PTR [rbp-8], eax	; mov eax to 2nd variable
	
	cmp	DWORD PTR [rbp-12], 254 ; cmp 254 to 3rd variable
	jle	.L2						; jump to .L2 if 3rd variable is less then or equal to 254
	mov	eax, 0					; mov 0 to eax
	leave						; leave - mov pointers back and pop the base pointer
	.cfi_def_cfa 7, 8
	ret 						; terminate program
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.2) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
