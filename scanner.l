/* Seção 1: Definições */
%{
    // Seção 1.1 Código C++ Aluno Victor de Souza Arnt Matricula 00201097 
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "main.cpp"
    #include "tokens.h"
    #include "symbols.hpp"

    int line_number = 1; // Variável para rastrear o número da linha
    bool is_running = true; // Variável para controlar a execução do scanner
    
    //funções solicitadas no enunciado
    void yyerror(const char *s);
    int yywrap(void);
    int getLineNumber(void);
    int isRunning(void);
    std::map<std::string, int> SymbolTypes;

    // A função para buscar palavras reservadas em uma tabela, otimizando o analisador.
    // Uma boa prática para evitar regras léxicas individuais para cada palavra.
    int check_reserved(const std::string& lexeme);
    
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
    /* Tratamento de Erros: A regra de captura para qualquer caractere não correspondido. */

.                         { yyerror("Caractere inválido"); return UNKNOWN_TOKEN; }
   



%%
/* Seção 3: Sub-rotinas */

// yywrap: Chamada ao final do arquivo de entrada. Retorna 1 para parar o processamento.
    int yywrap(void) {
        return 1;
    }

    // yyerror: Chamada em caso de erro.
    void yyerror(const char *s) {
        std::cerr << "Erro léxico na linha " << line_number << ": " << s << " em '" << yytext << "'" << std::endl;
    }

    // Funções de controle de estado e número de linha
    int getLineNumber(void) {
        return line_number;
    }
    int isRunning(void) {
        return is_running;
    }

    // Função para buscar palavras reservadas. Mantém uma tabela estática
    // para evitar a re-inicialização a cada chamada.
    int check_reserved(const std::string& lexeme) {
        static std::map<std::string, int> reserved_words;
        if (reserved_words.empty()) {
            reserved_words["char"] = RW_CHAR;
            reserved_words["int"] = RW_INT;
            reserved_words["float"] = RW_FLOAT;
            reserved_words["bool"] = RW_BOOL;
            reserved_words["if"] = RW_IF;
            reserved_words["else"] = RW_ELSE;
            reserved_words["do"] = RW_DO;
            reserved_words["while"] = RW_WHILE;
            reserved_words["read"] = RW_READ;
            reserved_words["print"] = RW_PRINT;
            reserved_words["return"] = RW_RETURN;
            reserved_words["true"] = LIT_TRUE;
            reserved_words["false"] = LIT_FALSE;
        }
        
        auto it = reserved_words.find(lexeme);
        if (it!= reserved_words.end()) {
            return it->second;
        }
        return 0;
    }

    main(); // Chama a função principal do main.cpp
