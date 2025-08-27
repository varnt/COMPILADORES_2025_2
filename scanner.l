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
letter_low [a-z]
letter_up [A-Z]
specialcaracters [,;:()[]{}=+-*/%<>&|~] 
/*Definição de palavras com base em caracteres e digitos*/
identifier (({letter_low}|{letter_up}|_)+( {letter_low}|{letter_up}|_|{digit})*) 
LIT_TRUE "true"
LIT_FALSE "false"


%%
    /* Seção 2: Regras */
    //Reconhecer e retornar o token correspondente para as palavras `char`, `int`, `float`, `bool`, `if`, `else`, `do`, `while`, `read`, `print`, `return`.
"int"                     {return KW_INT;}
"char"                    {return KW_CHAR;}
"float"                   {return KW_FLOAT;}
"bool"                    {return KW_BOOL;}
"if"                      {return KW_IF;}
"else"                    {return KW_ELSE;}
"do"                      {return KW_DO;}
"while"                   {return KW_WHILE;}
"read"                    {return KW_READ;}
"print"                   {return KW_PRINT;}
"return"                  {return KW_RETURN;}
    //Tratar os literais booleanos true e false como palavras reservadas.
LIT_TRUE                  {return LIT_TRUE;}
LIT_FALSE                 {return LIT_FALSE;}

[a-zA-Z][a-zA-Z0-9]*      {return ID;}
[-+*/=()]                 {return OPERADORES;}
\n                        {++line_number;}
[ \t]+ { /* Ignora espaços em branco */ }
    //**Inteiros:** Reconhecer sequências de um ou mais dígitos decimais.
digit+                    {return LIT_INT;}
    //**Reais:** Reconhecer a parte inteira seguida do ponto decimal e da parte fracionária, onde ambas as partes precisam ter ao menos um dígito.
digit+"."digit+          {return LIT_FLOAT;}
    // Retornar o código ASCII convertido para inteiro para os seguintes caracteres:
specialcaracters        {return yytext;} // Retorna o código ASCII do caracter
   
    //string                   {return LIT_STRING;}
"//".*                   { /* Ignora comentários de linha simples única*/ }

"/*"                     { BEGIN COMMENT; }/* . {}  para ignorar otros caracteres  */

<COMMENT> "/:"           { BEGIN INITIAL; } // Fim do comentário
<COMMENT>   \n { ++line_number; }
<COMMENT>


%%
/* Seção 3: Sub-rotinas */
main(); // Chama a função principal do main.cpp

