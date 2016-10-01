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

%assign LOOP_SIZE 5

;; -------------------------  
;; data segment  
;; ------------------------- 
section .data 

    a dd 3 
    b dd 5 
    c dd 8 
    d dd 10 
    e dd 20  
    ;result dd 5
    result dd 5

    mytable: times 5 dd 0  
    i dw 1 

;; -------------------------  
;; code area  
;; ------------------------- 
section .text 
global asm_main 
asm_main: 
                ;prepare for setup loop
		mov eax, 0  	   ;start with 0 in eax 
		mov ecx, LOOP_SIZE ;get ready to loop 5 times 
		mov esi, mytable   ;make esi point to mytable beginning  
                ;call for
                             
forsetup:

                add eax, 1          ; increment by 1
                mov [esi], eax      ; put that value into mytable
                add esi, 4          ; increment to next index in mytable
                loop forsetup       ; loop 5 times
                
                ;prepare for addition
                mov eax, 0  	   ;start with 0 in eax 
                mov ecx, LOOP_SIZE  ;get ready to loop 5 times 
                mov esi, mytable 	   ;make esi point to a  

foradd: 	        

                add eax, [esi]      ;add whatever esi points to to eax 
		
                ;mov eax, [esi]
                ;mov [result], eax
                ;call print_int
                ;call print_nl
                
                add esi, 4  	    ;make esi point to next integer in mem 
                loop foradd  	    ;loop back if haven't looped 5 times yet...  
                
                mov [result],eax      ;store sum in result
                call print_int        ;and print value
                call print_nl  	     ;call the function that prints a new blank line   

                ;prepare for multiplication
                mov eax, 1             ;start with 1 in eax 
                mov ecx, LOOP_SIZE     ;get ready to loop 5 times 
                mov esi, mytable       ;make esi point to mytable 

formultiply:
                mul dword [esi]        ;multiply esi value with value in eax     
                add esi, 4             ;increment to the next index in the array
                loop formultiply       ;loop 5 times to multiply all results
                
                call print_int         ;and print value
                call print_nl  	      ;call the function that prints a new blank line 
                
;; return to C program  

		ret