all: bin/boot.bin

bin/boot.bin: src/boot.asm
	mkdir -p bin
	nasm -f bin src/boot.asm -o bin/boot.bin

run: all
	qemu-system-i386 -drive format=raw,file=bin/boot.bin

clean:
	rm -rf bin
