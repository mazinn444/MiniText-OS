#!/bin/bash

clear 

# Cria diretório build se não existir
mkdir -p build

# Compila o bootloader
echo "[+] Compilando bootloader..."
nasm -f bin boot/boot.asm -o build/boot.bin

# Compila o kernel entry
echo "[+] Compilando kernel entry..."
nasm -f elf32 kernel/kernel_entry.asm -o build/kernel_entry.o

# Compilar todos os arquivos .c do kernel
echo "[+] Compilando arquivos do kernel..."
# Usa find para pegar todos os .c no diretório kernel
for c_file in $(find kernel -name "*.c"); do
    obj_file="build/$(basename "$c_file" .c).o"
    echo "   Compilando $c_file -> $obj_file"
    gcc -m32 -c "$c_file" -o "$obj_file" -ffreestanding -fno-pie -I./kernel
done

# Preparar lista de objetos para linkagem
KERNEL_OBJS="build/kernel_entry.o $(find build -name "*.o" ! -name "kernel_entry.o")"

# Link do kernel
echo "[+] Linkando kernel..."
ld -m elf_i386 -T kernel/linker.ld -o build/kernel.bin $KERNEL_OBJS --oformat binary

# Cria a imagem do sistema
echo "[+] Criando imagem do sistema..."
dd if=/dev/zero of=build/os.img bs=512 count=2880
dd if=build/boot.bin of=build/os.img conv=notrunc bs=512 count=1
dd if=build/kernel.bin of=build/os.img conv=notrunc bs=512 seek=1

# Executa no QEMU
echo "[+] Executando no QEMU..."
qemu-system-i386 -drive format=raw,file=build/os.img