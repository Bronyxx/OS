// source/kernel.c

#include <stdint.h>

// Video memory starts at 0xB8000
volatile char* video = (volatile char*)0xB8000;

void kernel_main() {
    const char* message = "Hello from kernel!";
    
    for (int i = 0; message[i] != '\0'; i++) {
        video[i * 2] = message[i];        // Character
        video[i * 2 + 1] = 0x07;          // Attribute byte (gray on black)
    }

    // Loop forever
    while (1) { }
}
