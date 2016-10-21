buildsmaller: smaller.asm
	nasm -f elf32 -d ELF_TYPE smaller.asm
	nasm -f elf32 -d ELF_TYPE asm_io.asm
	gcc -m32 smaller.o asm_io.o -o smaller.out
buildavgfloat: avgfloat.asm
	nasm -f elf32 -d ELF_TYPE avgfloat.asm
	nasm -f elf32 -d ELF_TYPE asm_io.asm
	gcc -m32 avgfloat.o asm_io.o -o avgfloat.out
all: buildsmaller buildavgfloat

run:
	./smaller.out
	./avgfloat.out
clean:
	rm -f *.o
	rm -f *.out
