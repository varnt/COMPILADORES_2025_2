/* Seção 1: Definições */
%{
    // Seção 1.1 Código C (e.g., #include, declarações de variáveis e funções)
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "main.cpp"
    #include "tokens.h"

    int line_number = 1; // Variável para rastrear o número da linha
    bool is_running = true; // Variável para controlar a execução do scanner
    
%}
/* Aluno Victor de Souza Arnt Matricula 00201097 */
/* Substituições (opcional) */
/* Exemplo: */
digit [0-9]
letter [A-Za-z]
specialcaracters [,;:()[]{}=+-*/%<>&|~] 


%%
    /* Seção 2: Regras */
    //Reconhecer e retornar o token correspondente para as palavras `char`, `int`, `float`, `bool`, `if`, `else`, `do`, `while`, `read`, `print`, `return`.
"int"                     {fprintf(stderr, "KW_INT");}
"char"                    {fprintf(stderr, "KW_CHAR");}
"float"                   {fprintf(stderr, "KW_FLOAT");}
"bool"                    {fprintf(stderr, "KW_BOOL");}
"if"                      {fprintf(stderr, "KW_IF");}
"else"                    {fprintf(stderr, "KW_ELSE");}
"do"                      {fprintf(stderr, "KW_DO");}
"while"                   {fprintf(stderr, "KW_WHILE");}
"read"                    {fprintf(stderr, "KW_READ");}
"print"                   {fprintf(stderr, "KW_PRINT");}
"return"                  {fprintf(stderr, "KW_RETURN");}
    //Tratar os literais booleanos `true` e `false` como palavras reservadas.
"true"                    {fprintf(stderr, "LIT_TRUE");}
"false"                   {fprintf(stderr, "LIT_FALSE");}

[a-zA-Z][a-zA-Z0-9]*      {fprintf(stderr, "ID");}
[-+*/=()]                 {fprintf(stderr, "OPERADORES");}
\n                        {++line_number;} }
[ \t]+ { /* Ignora espaços em branco */ }
    //**Inteiros:** Reconhecer sequências de um ou mais dígitos decimais.
digit+                    {fprintf(stderr, "LIT_INT");}
    //**Reais:** Reconhecer a parte inteira seguida do ponto decimal e da parte fracionária, onde ambas as partes precisam ter ao menos um dígito.
digit+"."digit+          {fprintf(stderr, "LIT_FLOAT");}
    // Retornar o código ASCII convertido para inteiro para os seguintes caracteres:
specialcaracters        {return yytext;} // Retorna o código ASCII do caracter
   
    //string                   {fprintf(stderr, "LIT_STRING");}
"//".*                   { /* Ignora comentários de linha simples única*/ }

"/*"                     { BEGIN COMMENT; }/* . {}  para ignorar otros caracteres  */

<COMMENT> "/:"           { BEGIN INITIAL; } // Fim do comentário
<COMMENT>   \n { ++line_number; }
<COMMENT>


%%
/* Seção 3: Sub-rotinas */
main(); // Chama a função principal do main.cpp

