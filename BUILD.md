# Build Instructions

## Prerequisites

1. GCC
2. NASM
3. LD
4. GRUB
5. QEMU

```bash
sudo apt install gcc nasm binutils grub-pc-bin qemu-system
```

## Build Steps

Follow these steps to build and run your kernel:

1. Compile the assembly code. This will generate a compiled object file from your assembly source code.

```bash
nasm -f elf32 boot.s -o boot.o
```

2. Compile the C++ code.

```bash
g++ -m32 -c kernel.cpp -o kernel.o -ffreestanding -O2 -Wall -Wextra -fno-exceptions -fno-rtti
```

3. Link the object files. This will combine boot.o and kernel.o into a single binary file kernel.bin.

```bash
ld -m elf_i386 -T linker.ld -o kernel.bin boot.o kernel.o
```

4. Create the ISO directory structure. GRUB needs a specific directory structure to create a bootable ISO.

```bash
mkdir -p iso/boot/grub
cp grub.cfg iso/boot/grub
cp kernel.bin iso/boot/
```

5. Create the bootable ISO. This will generate a bootable ISO file quest.iso from the contents of the iso directory.

```bash
grub-mkrescue -o quest.iso iso
```

6. Run the kernel in QEMU.

```bash
qemu-system-i386 -cdrom quest.iso
```

At this point, QEMU should start and you should see your kernel running in the QEMU window.
