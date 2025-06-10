Learning Assembly Programming

as filename.s --32 -o filename.o
ld filename.o -m elf_i386 -lc -dynamic-linker /lib/ld.... -e main -o filename