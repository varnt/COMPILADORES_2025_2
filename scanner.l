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
/* Letras minusculas */
letter_low [a-z]
/* Letras maiusculas */
letter_up [A-Z]
/* Letras minusculas ou maiusculas */
letter {letter_low|letter_up}
/* Letras ou digitos */
alphanum {letter_low|letter_up|digit}
/* Caracteres especiais */
special_caracters [,;:()[]{}=+-*/%<>&|~] 

/* Identificador começa com uma letra (maiúscula ou minúscula) ou um sublinhado (_), seguido por qualquer combinação de letras, dígitos ou sublinhados. */
identifier      (({letter}|_)+( {alphanum}|_)*)
/* Literais */
literal_int     {digit}+
literal_float   {digit}+"."{digit}+
/* Caracteres entre aspas simples, exceto aspas simples e nova linha */
literal_char    '[^'\n]' 
/* Cadeia de caracteres entre aspas duplas */
literal_string    \"(\\.|[^"\n])*\"

              


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
"true"                    {return LIT_TRUE;}
"false"                   {return LIT_FLASE;}
"<="                      {return OPERATOR_LE;}
">="                      {return OPERATOR_GE;}
"=="                      {return OPERATOR_EQ;}
"!="                      {return OPERATOR_DIF;}
identifier                {return TK_IDENTIFIER;} // Identificadores
literal_char              {return LIT_CHAR;} //Caracteres Reconhecer um único caractere entre aspas simples (por exemplo, 'a', '1', '#'). O caractere pode ser qualquer símbolo ASCII, exceto a aspa simples e o caractere de nova linha.**//
literal_string            {return LIT_STRING;} //Cadeia de caracteres entre aspas duplas
\n                        {++line_number;} //revisar
[ \t]+                    { /* Ignora espaços em branco */ }  
literal_int               {return LIT_INT;} //inteiros
literal_float       {return LIT_FLOAT;} //**Reais:** Reconhecer a parte inteira seguida do ponto decimal e da parte fracionária, onde ambas as partes precisam ter ao menos um dígito.**//
special_caracters         {return yytext;} // Retorna o código ASCII do caracter
   
"//".*                   { /* Ignora comentários de linha simples única*/ }


%%
/* Seção 3: Sub-rotinas */
main(); // Chama a função principal do main.cpp

