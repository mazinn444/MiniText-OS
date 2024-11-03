@echo off

cls

REM Cria diretório build se não existir
if not exist build mkdir build

REM Compila o bootloader
echo [+] Compilando bootloader...
nasm -f bin boot/boot.asm -o build/boot.bin

REM Compila o kernel entry
echo [+] Compilando kernel entry...
nasm -f elf32 kernel/kernel_entry.asm -o build/kernel_entry.o

REM Compila o kernel
echo [+] Compilando kernel...
gcc -m32 -c kernel/kernel.c -o build/kernel.o -ffreestanding -fno-pie

REM Link o kernel
echo [+] Linkando kernel...
ld -m elf_i386 -T kernel/linker.ld -o build/kernel.bin build/kernel_entry.o build/kernel.o --oformat binary

REM Cria a imagem do sistema
echo [+] Criando imagem do sistema...
fsutil file createnew build/os.img 1474560
dd if=build/boot.bin of=build/os.img conv=notrunc bs=512 count=1
dd if=build/kernel.bin of=build/os.img conv=notrunc bs=512 seek=1

REM Executa no QEMU
echo [+] Executando no QEMU...
qemu-system-i386 -drive format=raw,file=build/os.img
