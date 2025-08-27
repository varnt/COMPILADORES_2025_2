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

              
%x STRING COMMENT_ML

%%
    /* Seção 2: Regras */
    /* LEMBRA QUE O LEX FLEX PRIORIZA TAMANHO DAS REGRAS*/

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

    /*Reconhecer e retornar o token correspondente para as palavras `char`, `int`, `float`, `bool`, `if`, `else`, `do`, `while`, `read`, `print`, `return`.*//
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


identifier                {return TK_IDENTIFIER;} //identificadores
literal_float             {return LIT_FLOAT;} //reais
literal_int               {return LIT_INT;} //inteiros
literal_char              {return LIT_CHAR;} //caracteres Reconhecer um único caractere entre aspas simples (por exemplo, 'a', '1', '#'). O caractere pode ser qualquer símbolo ASCII, exceto a aspa simples e o caractere de nova linha.**//

    /* Início de uma string literal. Usa condição de início exclusiva.*/
\"                         { BEGIN STRING; }
    /* Dentro do estado `STRING`, processa caracteres de escape*/
<STRING>\"                 {BEGIN INITIAL; return LIT_STRING;} // Fim da string
<STRING>\\\"               {/* Trata a sequência de escape */}
<STRING>\\n                {/* Trata a sequência de escape */}
<STRING>\n                 {yyerror("Literal de string não terminada"); ++line_number; BEGIN INITIAL;}
<STRING>.                  {/* Adiciona o caractere à string literal */}

special_caracters         {return yytext;} //retorna o código ASCII do caracter
[ \t]+                    { /* Ignora espaços em branco */ }
\n                        {++line_number;} 

    /* Regra especial para fim de arquivo */
<<EOF>>                   { is_running = false; return 0; }
   



%%
/* Seção 3: Sub-rotinas */
main(); // Chama a função principal do main.cpp

