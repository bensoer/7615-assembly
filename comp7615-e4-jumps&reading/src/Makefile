buildmystery1: mystery1.c
	gcc -S mystery1.c -o mystery1-asm.s
	gcc mystery1.c -o mystery1.c.out

buildmystery2: mystery2.c
	gcc -S mystery2.c -o mystery2-asm.s
	gcc mystery2.c -o mystery2.c.out

buildmystery3: mystery3.c
	gcc -S mystery3.c -o mystery3-asm.s
	gcc mystery3.c -o mystery3.c.out

buildsuppliedmystery2: mystery2.asm
	nasm -f elf32 -d ELF_TYPE mystery2.asm
	nasm -f elf32 -d ELF_TYPE asm_io.asm
	gcc -m32 mystery2.o asm_io.o -o mystery2-supplied.out

buildsmallest: smallest.asm
	nasm -f elf32 -d ELF_TYPE asm_io.asm
	nasm -f elf32 -d ELF_TYPE smallest.asm
	gcc -m32 asm_io.o smallest.o smallest-driver.c -o smallest.out

supplied: buildsuppliedmystery2
generated: buildmystery1 buildmystery2 buildmystery3
all: buildsuppliedmystery2  buildmystery1 buildmystery2 buildmystery3
smallest: buildsmallest

clean: 
	rm -rf *.s
	rm -rf *.out
	rm -rf *.o
