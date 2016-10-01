buildtask1: task1.asm
	nasm -f elf64 task1.asm -l task1.lst

buildtask2: task2.asm
	nasm -f elf32 -d ELF_TYPE asm_io.asm
	nasm -f elf32 -d ELF_TYPE task2.asm
	gcc -m32 -o task2.out task2.o driver.c asm_io.o

buildtask3: task3.asm
	nasm -f elf32 -d ELF_TYPE asm_io.asm
	nasm -f elf32 -d ELF_TYPE task3.asm
	gcc -m32 -o task3.out task3.o driver.c asm_io.o

buildtask4: task4.asm
	nasm -f elf32 -d ELF_TYPE asm_io.asm
	nasm -f elf32 -d ELF_TYPE task4.asm
	gcc -m32 -o task4.out task4.o driver.c asm_io.o

all: buildtask1 buildtask2 buildtask3 buildtask4


run:
	./task2.out
	./task3.out
	./task4.out

clean:
	rm -f *.out
	rm -f *.o
	rm -f *.lst
