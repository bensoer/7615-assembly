buildgreet32: greet32.asm
	nasm greet32.asm -f elf64 -l greet32.lst
	gcc greet32.o -o greet32.out

buildgreet64: greet64.asm
	nasm greet64.asm -f elf64 -l greet64.lst
	gcc greet64.o -o greet64.out

buildname: name.asm
	nasm name.asm -f elf64 -l name.lst
	gcc name.o -o name.out

buildaddnums: addnums.asm
	nasm addnums.asm -f elf32 -l addnums.lst
	gcc -m32 addnums.o -o addnums.out

buildadder: asmadder.asm asmadder-driver.c
	nasm asmadder.asm -f elf32 -l asmadder.lst
	gcc -m32 asmadder.o asmadder-driver.c -o a.out

#make all
all: buildgreet32 buildgreet64 buildname buildaddnums buildadder

#run all
run:
	./greet32.out
	./greet64.out
	./name.out
	./addnums.out
	./a.out

#clean all
clean:
	rm -f *.out
	rm -f *.lst
	rm -f *.o