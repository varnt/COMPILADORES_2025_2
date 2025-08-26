
%{
     #include "tokens.h"
    
%}
/* Aluno Victor de Souza Arnt Matricula 00201097 */
/* não preciso definir aqui pq já está em tokens.h
    //#define ever(;;)
    //#define KW_INT 1
    //#define KW_if 2
    //#define LIT_HEX 3
    //#define IDENTIFIER 4
    //#define OPERATORS 5


%X COMMENT

%%
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

[a-zA-Z][a-zA-Z0-9]*      {fprintf(stderr, "ID");}
[-+*/=()]                 {fprintf(stderr, "OPERADORES");}
\n                        {++line_number;} }
[ \t]+ { /* Ignora espaços em branco */ }

"//".* { /* Ignora comentários de linha simples única*/ }
"/*"                      { BEGIN COMMENT; }

    /* . {}  para ignorar otros caracteres  */

<COMMENT> "/:" { BEGIN INITIAL; }
<COMMENT>   \n { ++line_number; }
<COMMENT>


%%

int main()
{
    yylex();

}

int yywrap()
{
    return 1;
}