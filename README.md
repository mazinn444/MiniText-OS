<h1 align="center">MiniText OS Beta</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Status-Beta-yellow">
  <img src="https://img.shields.io/badge/Linguagens-C%20%7C%20Assembly-blue">
  <img src="https://img.shields.io/badge/Ferramentas-NASM%20%7C%20GCC%20%7C%20QEMU-green">
  <img src="https://img.shields.io/badge/MIT-License-green.svg" alt="MIT License">
</p>
<p align="center">
   <img src="https://img.shields.io/github/stars/mazinn444/MiniText-OS?style=social">
  <img src="https://img.shields.io/github/forks/mazinn444/MiniText-OS?style=social">
</p>

Um sistema operacional de texto desenvolvido para fins educacionais. Este sistema ainda está em fase de desenvolvimento.

## Sobre o Projeto

O MiniText OS Beta é um sistema operacional básico desenvolvido em C e Assembly, focado em demonstrar os conceitos fundamentais de sistemas operacionais.

## Linguagens Utilizadas

- C
- Assembly

## Ferramentas Utilizadas

- [NASM](https://www.nasm.us/pub/nasm/releasebuilds/?C=M;O=D)
- **GCC** ou [MinGW](https://www.mingw.org/)
- [QEMU](https://www.qemu.org/download/)

## Como executar

Obs: Este projeto foi desenvolvido em um ambiente Linux.

### Executando no Linux

1. Certifique-se de ter o QEMU instalado:

```bash
sudo apt install qemu-system-x86
```

2. Execute o script `run-linux.sh` para compilar, criar a imagem do sistema e executar no QEMU:

```bash
./run-linux.sh
```

### Executando no Windows

1. Execute o script `run-windows.bat` para compilar, criar a imagem do sistema e executar no QEMU:

```bash
./run-windows.bat
```

## Desenvolvido por

- [Mazin Dev](https://github.com/mazinn444)
