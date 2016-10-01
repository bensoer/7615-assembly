;;; Loop example prog.asm
;;;  
;;; Assemble, link and run as follows: 
;;; nasm -f elf32 -d ELF_TYPE asm_io.asm (do this only once) 
;;; nasm -f elf32 -d ELF_TYPE prog.asm 
;;; gcc -o prog -m32 driver.c prog.o asm_io.o 
;;; ./prog 
;;;  

%include "asm_io.inc"  
%assign SYS_EXIT 0   

;; -------------------------  
;; data segment  
;; ------------------------- 
section .data 
a dd 3 
b dd 5 
c dd 8 
d dd 10 
e dd 20  
result dd 0   

;; -------------------------  
;; code area  
;; ------------------------- 
section .text 
global asm_main 
asm_main: 
		mov eax, 0  	;start with 0 in eax 
		mov ecx, 5  	;get ready to loop 5 times 
		mov esi, a  	;make esi point to a  
for: 	add eax, [esi]  ;add whatever esi points to to eax 
		add esi, 4  	;make esi point to next integer in mem 
		loop for  	;loop back if haven't looped 5 times yet...  
		mov [result],eax  ;store sum in result
		call print_int  ;and print value
		call print_nl  	;call the function that prints a new blank line   

;; return to C program  

		ret