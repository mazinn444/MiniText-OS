#include <stddef.h>

// Kernel start main function
void kmain(void) {
    // Ponteiro para memória de vídeo
    char* video_memory = (char*)0xb8000;
    
    // Mensagem para exibir
    const char* msg = "bem vindo ao meu sistema!";
    
    // Cores: Branco sobre preto
    char attribute = 0x0f;
    
    // Limpa a tela
    for(int i = 0; i < 80 * 25 * 2; i += 2) {
        video_memory[i] = ' ';
        video_memory[i + 1] = attribute;
    }
    
    // Imprime a mensagem
    int i = 0;
    while(msg[i] != '\0') {
        video_memory[i * 2] = msg[i];
        video_memory[i * 2 + 1] = attribute;
        i++;
    }
    
    // Loop infinito
    while(1) {}
} 