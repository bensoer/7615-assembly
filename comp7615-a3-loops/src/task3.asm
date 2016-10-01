;;
;;   nasm -f elf32 -d ELF_TYPE asm_IO.asm_io
;;   nasm -f elf32 -d ELF_TYPE prog.asm_IO
;;   gcc -o prog -m32 driver.c prog.o asm_io.o
;;   ./prog
;;

%include "asm_io.inc"
%assign SYS_EXIT 0

SECTION .data
	my_table dd 1, 2, 3, 4, 5

SECTION .text

global asm_main

asm_main: 

	mov edi, my_table		;move address to ebx
	mov [edi], dword 123		;move 123 to where edi is pointing
	;add edi, 4
	mov [edi+4], dword 456		;move 456 to where edi is pointing
	;add edi, 4
	mov [edi+8], dword 789		;move 789 to where edi is pointing		

	mov  eax, dword [my_table]
	mov  esi, my_table
	call print_int 			;print what is in eax
	call print_nl

	;add  esi, 4
	mov  eax, dword [esi+4] 
	call print_int 			;print what is in eax
	call print_nl

  	;add  esi, 4
	mov  eax, dword [esi+8]
	call print_int 			;print what is in eax
	call print_nl

	mov eax, 0		; exit code normal
	ret
