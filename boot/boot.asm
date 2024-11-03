[org 0x7c00]
[bits 16]

section .text
    global _start

_start:
    ; inicializa os segmentos
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00

    ; limpa a porra da tela
    mov ah, 0x00
    mov al, 0x03
    int 0x10

    ; imprime mensagem de boot
    mov si, msg_boot
    call print_string

    ; carrega o kernel e eu não faço ideia do como funciona, mas funciona
    mov ah, 0x02        ; função de leitura
    mov al, 2           ; número de setores para ler
    mov ch, 0           ; cilindro 0
    mov cl, 2           ; setor 2 (o setor 1 é o bootloader)
    mov dh, 0           ; cabeça 0
    mov dl, 0x80        ; drive (primeiro disco rígido)
    mov bx, 0x1000      ; Endereço de destino
    int 0x13

    ; prepara para modo protegido
    cli
    lgdt [gdt_descriptor]
    
    ; habilita A20 tbm não sei oq é isso
    in al, 0x92
    or al, 2
    out 0x92, al

    ; Ativa modo protegido
    mov eax, cr0
    or eax, 1
    mov cr0, eax

    ; Pula para o código 32 bits
    jmp 0x08:protected_mode

[bits 32]
protected_mode:
    ; Configura segmentos para modo protegido
    mov ax, 0x10
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    ; Pula para o kernel
    jmp 0x1000

[bits 16]
print_string:
    pusha
    mov ah, 0x0e
.loop:
    lodsb
    test al, al
    jz .done
    int 0x10
    jmp .loop
.done:
    popa
    ret

; Dados
msg_boot: db 'Bootloader iniciado...', 0x0d, 0x0a, 0

; GDT
gdt_start:
    dq 0x0000000000000000    ; GDT nulo
gdt_code:
    dw 0xffff                ; Limite
    dw 0x0000                ; Base (bits 0-15)
    db 0x00                  ; Base (bits 16-23)
    db 10011010b             ; Flags
    db 11001111b             ; Flags + Limite (bits 16-19)
    db 0x00                  ; Base (bits 24-31)
gdt_data:
    dw 0xffff
    dw 0x0000
    db 0x00
    db 10010010b
    db 11001111b
    db 0x00
gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1
    dd gdt_start

times 510-($-$$) db 0
dw 0xaa55 