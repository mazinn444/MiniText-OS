[bits 32]
[extern kmain]

section .text
    global _start

_start:
    call kmain
    jmp $ 