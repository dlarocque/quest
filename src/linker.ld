ENTRY(boot)  /* the name of the entry label */

SECTIONS {
    . = 1M;
    .multiboot : ALIGN(4K)
    {
        *(.multiboot)
    }
    .text BLOCK(4K) : ALIGN(4K)
    {
        *(.text)    /* .text section (kernel code) */
    }
}
