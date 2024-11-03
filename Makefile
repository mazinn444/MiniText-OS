CC = gcc
AS = nasm
LD = ld

CFLAGS = -m32 -fno-pie -fno-stack-protector -nostdlib -ffreestanding -c
ASFLAGS = -f elf32
LDFLAGS = -m elf_i386 -T link.ld

BUILD_DIR = build
SRC_DIR = .

# Arquivos fonte
CSOURCES = $(wildcard kernel/*.c drivers/console/*.c)
ASOURCES = $(wildcard kernel/*.asm)
OBJECTS = $(CSOURCES:%.c=$(BUILD_DIR)/%.o) $(ASOURCES:%.asm=$(BUILD_DIR)/%.o)

# Regra principal
all: $(BUILD_DIR)/os.img

# Criar diretórios necessários
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)/kernel
	mkdir -p $(BUILD_DIR)/drivers/console

# Compilar arquivos C
$(BUILD_DIR)/%.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $< -o $@

# Compilar arquivos Assembly
$(BUILD_DIR)/%.o: %.asm
	mkdir -p $(dir $@)
	$(AS) $(ASFLAGS) $< -o $@

# Linkar o kernel
$(BUILD_DIR)/kernel.bin: $(OBJECTS)
	$(LD) $(LDFLAGS) -o $@ $^

# Criar a imagem do sistema
$(BUILD_DIR)/os.img: bootloader/boot.bin $(BUILD_DIR)/kernel.bin
	dd if=/dev/zero of=$@ bs=512 count=2880
	dd if=bootloader/boot.bin of=$@ conv=notrunc
	dd if=$(BUILD_DIR)/kernel.bin of=$@ seek=1 conv=notrunc

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean 