# Define some variables
NASM=nasm
GXX=g++
LD=ld
CXXFLAGS=-m32 -c -ffreestanding -O2 -Wall -Wextra -fno-exceptions -fno-rtti
LDFLAGS=-m elf_i386 -T linker.ld
NASMFLAGS=-f elf32
QEMU=qemu-system-i386
ISO_DIR=iso
GRUB_CONFIG=grub.cfg

# Source and object files
ASM_SOURCES=boot.s
CPP_SOURCES=kernel.cpp
OBJECTS=$(ASM_SOURCES:.s=.o) $(CPP_SOURCES:.cpp=.o)

.PHONY: all clean run

all: clean run

run: quest.iso
	$(QEMU) -cdrom $<

quest.iso: $(ISO_DIR)/boot/kernel.bin
	grub-mkrescue -o $@ $(ISO_DIR)

$(ISO_DIR)/boot/kernel.bin: $(ISO_DIR)/boot/grub/$(GRUB_CONFIG) $(OBJECTS)
	mkdir -p $(dir $@)
	$(LD) $(LDFLAGS) -o $@ $(OBJECTS)

$(ISO_DIR)/boot/grub/$(GRUB_CONFIG): $(GRUB_CONFIG)
	mkdir -p $(dir $@)
	cp $< $@

%.o: %.s
	$(NASM) $(NASMFLAGS) $< -o $@

%.o: %.cpp
	$(GXX) $(CXXFLAGS) $< -o $@

clean:
	rm -rf $(ISO_DIR)
	rm -f quest.iso $(OBJECTS)
