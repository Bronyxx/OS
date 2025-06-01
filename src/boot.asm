; boot.asm — Multiboot-compatible bootloader stub

section .multiboot
    align 4
    dd 0x1BADB002        ; Multiboot magic number
    dd 0x00              ; Flags
    dd -(0x1BADB002)     ; Checksum (magic + flags + checksum == 0)

section .text
    global start
start:
    ; Simple BIOS interrupt to print 'K'
    mov al, 'K'
    mov ah, 0x0E
    int 0x10

    ; Halt forever
    cli
    hlt
.loop:
    hlt
    jmp .loop
