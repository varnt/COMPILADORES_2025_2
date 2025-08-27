
#include <iostream>
#include <string>
#include "symbols.hpp"
#include "tokens.h"

// Declaração da função principal do analisador léxico, gerada pelo Flex
extern int yylex();

// Declaração da função de erro, que deve ser implementada para lidar com erros léxicos
void yyerror(const char* s);

int main() {
    // Inicia a análise léxica
    yylex();

    // Retorna 0 para indicar que o programa terminou com sucesso
    return 0;
}

// Implementação da função de erro. Esta é uma versão básica para o escopo inicial
void yyerror(const char* s) {
    // Imprime a mensagem de erro fornecida
    std::cerr << "Erro léxico: " << s << std::endl;
}