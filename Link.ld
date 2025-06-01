/* link.ld */

ENTRY(start)

SECTIONS {
  /* Kernel will be loaded at 1MB = 0x100000 */
  . = 1M;

  /* Text/code section */
  .text : {
    *(.multiboot)        /* Multiboot header if you're using GRUB */
    *(.text)
  }

  /* Read-only data (like const strings) */
  .rodata : {
    *(.rodata)
  }

  /* Initialized data */
  .data : {
    *(.data)
  }

  /* Uninitialized data (BSS) */
  .bss : {
    *(.bss COMMON)
  }
}
