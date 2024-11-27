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

MiniText OS é um sistema operacional de texto desenvolvido com fins educacionais. Atualmente, encontra-se em fase de desenvolvimento.

## Sobre o Projeto

MiniText OS Beta é um sistema operacional simples, desenvolvido em C e Assembly, com o objetivo de demonstrar os conceitos fundamentais de como um sistema operacional funciona. Este projeto serve como uma base de aprendizado para estudantes e desenvolvedores interessados em entender o funcionamento de sistemas operacionais de baixo nível.

## Linguagens Utilizadas

- **C**: Usado para a implementação do kernel e outros componentes de alto nível.
- **Assembly**: Usado no bootloader e outras partes críticas para interação direta com o hardware.

## Ferramentas Utilizadas

- [**NASM**](https://www.nasm.us/pub/nasm/releasebuilds/?C=M;O=D): Assemblador utilizado para compilar o código em Assembly.
- **GCC** ou [**MinGW**](https://sourceforge.net/projects/mingw/): Compilador para o código em C.
- [**QEMU**](https://www.qemu.org/download/): Emulador utilizado para rodar o sistema operacional.

## Como Executar

### Executando no Linux

1. Certifique-se de ter o QEMU instalado no seu sistema. Caso não tenha, use o seguinte comando:

    ```bash
    sudo apt install qemu-system-x86
    ```

2. Após a instalação do QEMU, execute o script `run-linux.sh` para compilar, criar a imagem do sistema e executar no QEMU:

    ```bash
    ./run-linux.sh
    ```

### Executando no Windows

1. No Windows, utilize o script `run-windows.bat` para compilar, criar a imagem do sistema e rodar o sistema no QEMU:

    ```bash
    ./run-windows.bat
    ```

> **Nota**: A execução no Windows pode exigir a instalação do QEMU e do MinGW para compilar corretamente o código em C.

## Licença

Este projeto está licenciado sob a [Licença MIT](https://opensource.org/licenses/MIT).

## Desenvolvedor

- [Mazin Dev](https://github.com/mazinn444)
