
%{
    
%}
#define ever(;;)
#define KW_INT 1
#define KW_if 2
#define LIT_HEX 3
#define IDENTIFIER 4
#define OPERATORS 5

%X COMMENT

%%
"int"                     {fprintf(stderr, "KW_INT");}
"if"                      {fprintf(stderr, "KW_if");}
h[a-fA-F0-9]+             {fprintf(stderr, "LIT_HEX");}
[a-zA-Z][a-zA-Z0-9]*      {fprintf(stderr, "ID");}
[-+*/=()]                 {fprintf(stderr, "OPERADORES");}
\n                        {++line_number;} }
[ \t]+ { /* Ignora espaços em branco */ }

"::".* { /* Ignora comentários de linha simples*/ }
":/"                      { BEGIN COMMENT; }

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