nasm -f elf32 boot.s -o boot.o
g++ -m32 -c kernel.cpp -o kernel.o -ffreestanding -O2 -Wall -Wextra -fno-exceptions -fno-rtti
ld -m elf_i386 -T linker.ld -o kernel.bin boot.o kernel.o
mkdir -p iso/boot/grub
cp grub.cfg iso/boot/grub
cp kernel.bin iso/boot/
grub-mkrescue -o os.iso iso
qemu-system-i386 -cdrom os.iso
