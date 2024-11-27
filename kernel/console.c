#include "console.h"

// Ponteiro para memória de vídeo
static char* video_memory = (char*)0xb8000;

// Atributo de cor: Branco sobre preto
static char attribute = 0x0f;

void printchar(char c) {
    static int cursor_position = 0;
    video_memory[cursor_position * 2] = c;
    video_memory[cursor_position * 2 + 1] = attribute;
    cursor_position++;
}

void printstr(const char* str) {
    while (*str) {
        printchar(*str);
        str++;
    }
}

void printint(int num) {
    char buffer[11];
    int i = 0;
    
    if (num == 0) {
        printchar('0');
        return;
    }

    if (num < 0) {
        printchar('-');
        num = -num;
    }

    while (num > 0) {
        buffer[i++] = (num % 10) + '0';
        num /= 10;
    }

    while (i > 0) {
        printchar(buffer[--i]);
    }
}

void cls() {
    for(int i = 0; i < 80 * 25 * 2; i += 2) {
        video_memory[i] = ' ';
        video_memory[i + 1] = attribute;
    }
}