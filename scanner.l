/* Seção 1: Definições */
%{
    // Seção 1.1 Código C++ Aluno Victor de Souza Arnt Matricula 00201097 
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <iostream>
    #include "tokens.h"
    #include "symbols.hpp"
    #include <map>

    int line_number = 1; // Variável para rastrear o número da linha
    bool is_running = true; // Variável para controlar a execução do scanner
    void  initMe(void);
    //funções solicitadas no enunciado
    void yyerror(const char *s);
    int getLineNumber(void);
    int isRunning(void);

    
%}
/* Aluno Victor de Souza Arnt Matricula 00201097 */
/* Substituições 1.2 (opcional) */
/* Exemplo: */
digit [0-9]
/* Letras minusculas */
letter_low [a-z]
/* Letras maiusculas */
letter_up [A-Z]
/* Letras minusculas ou maiusculas */
letter ({letter_low}|{letter_up})
/* Letras ou digitos */
alphanum ({letter_low}|{letter_up}|{digit})

/* Identificador : pode conter hífen conforme especificação */
identifier      ({letter}|[_\-])({alphanum}|[_\-])*
/* Literais */
literal_int     {digit}+
literal_float   ({digit}+"."{digit}+)
/* Caracteres entre aspas simples com suporte a escape */
literal_char    '[^'\n\\]'|'\\[n"\\]'
/* Cadeia de caracteres entre aspas duplas */
literal_string    \"(\\.|[^"\n\\])*\"

%x STRING COMMENT_ML

%option noyywrap 

%%
    /* Seção 2: Regras */
    /* LEMBRA QUE O LEX FLEX PRIORIZA TAMANHO DAS REGRAS - Aluno Victor de Souza Arnt Matricula 00201097 */

"//".*                   { /* Ignora comentários de linha simples única*/ }

  "/*"                    { BEGIN COMMENT_ML;} /* Inicia o estado de comentário multilinha, adaptado de código exercitado em aula.*/
<COMMENT_ML>"*/"          { BEGIN INITIAL;}    
<COMMENT_ML>\n            { ++line_number;}
<COMMENT_ML>.             { /* Ignora */}

    /* Operadores Compostos: devem ser colocados antes dos operadores simples */
"<="                      {return OPERATOR_LE;}
">="                      {return OPERATOR_GE;}
"=="                      {return OPERATOR_EQ;}
"!="                      {return OPERATOR_DIF;}

    /*Reconhecer e retornar o token correspondente para as palavras `char`, `int`, `float`, `bool`, `if`, `else`, `do`, `while`, `read`, `print`, `return`.*/
"char"                    {return KW_CHAR;}
"int"                     {return KW_INT;}
"float"                   {return KW_FLOAT;}
"bool"                    {return KW_BOOL;}
"if"                      {return KW_IF;}
"else"                    {return KW_ELSE;}
"do"                      {return KW_DO;}
"while"                   {return KW_WHILE;}
"read"                    {return KW_READ;}
"print"                   {return KW_PRINT;}
"return"                  {return KW_RETURN;}
"true"                    {insertSymbolTable(yytext, SYMBOL_LITERAL_INT); return LIT_TRUE;}
"false"                   {insertSymbolTable(yytext, SYMBOL_LITERAL_INT); return LIT_FLASE;}

{literal_int}               {insertSymbolTable(yytext, SYMBOL_LITERAL_INT); return LIT_INT;} //inteiros com inserção na tabela
{literal_float}             {insertSymbolTable(yytext, SYMBOL_LITERAL_FLOAT); return LIT_FLOAT;} //reais com inserção na tabela
{identifier}                {insertSymbolTable(yytext, SYMBOL_IDENTIFIER); return TK_IDENTIFIER;} //identificadores com inserção na tabela
{literal_char}              {insertSymbolTable(yytext, SYMBOL_LITERAL_CHAR); return LIT_CHAR;} //caracteres Reconhecer um único caractere entre aspas simples (por exemplo, 'a', '1', '#'). O caractere pode ser qualquer símbolo ASCII, exceto a aspa simples e o caractere de nova linha.**//
{literal_string}            {insertSymbolTable(yytext, SYMBOL_LITERAL_STRING); return LIT_STRING;} //strings com inserção na tabela

[,;:()[\]{}=+\-*/%<>&|~]  {return yytext[0];} //retorna o código ASCII do caracter usando yytext[0]
[ \t]+                    { /* Ignora espaços em branco */ }
\n                        {++line_number;} 

    /* Regra especial para fim de arquivo */
<<EOF>>                   { is_running = false; return 0; }
.                         { yyerror("Caractere inválido"); return TOKEN_ERROR; }

%%
/* Seção 3: Sub-rotinas */

// yyerror: Chamada em caso de erro.
    void yyerror(const char *s) {
        std::cerr << "Erro léxico na linha " << line_number << ": " << s << " em '" << yytext << "'" << std::endl;
    }

    // Funções de controle de estado e número de linha
    int getLineNumber(void) {
        return line_number;
    }
    int isRunning(void) {
        return is_running ? 1 : 0; 
    }

