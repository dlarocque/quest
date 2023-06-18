; Multiboot header
section .multiboot
    align 4
    dd 0x1BADB002 ; Magic number
    dd 0x0 ; Flag to indicate that no special features are used
    dd - (0x1BADB002 + 0x0)

section .bootstrap_stack
    resb 16384 ; Reserve 16384 bytes for the stack
    stack_top:

section .text
    extern kernel_main
    global boot

; Entry
boot:
    ; switch to long mode, set up stack, and call kernel_main
    cli ; disable interrupts
    mov esp, dword [stack_top] ; use dword (32-bit) for ESP in 32-bit protected mode
    call kernel_main
    hlt
