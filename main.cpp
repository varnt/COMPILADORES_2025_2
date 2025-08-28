#include "tokens.h"
#include "symbols.hpp"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//Aluno Victor de Souza Arnt Matricula 00201097
// Declarações externas para funções do flex
extern int yylex();
extern char* yytext;

// Variáveis globais para controle do scanner
extern int line_number;
extern bool is_running;
extern int getLineNumber(void);
extern int isRunning(void);


// Implementação do yywrap com linkage C
extern "C" {
    int yywrap() {
        is_running = false;  // Marca fim da análise
        return 1;
    }
}

int main() {
    int token;
    
    // Continua até encontrar EOF
    while((token = yylex()) != 0) {
        printf("Token: %d, Lexeme: %s, Line: %d\n", token, yytext, getLineNumber());
    }
    
    // Imprime tabela de símbolos ao final
    printSymbolTable();
    
    return 0;
}