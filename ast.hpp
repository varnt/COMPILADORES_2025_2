#ifndef AST_HPP
#define AST_HPP

// Aluno Victor de Souza Arnt Matricula 00291097
// Definições dos tipos de nodos da AST

#define AST_SYMBOL 0
#define AST_ADD 1
#define AST_SUB 2
#define AST_MUL 3
#define AST_DIV 4
#define AST_MOD 5
#define AST_LT 6
#define AST_GT 7
#define AST_LE 8
#define AST_GE 9
#define AST_EQ 10
#define AST_DIF 11
#define AST_AND 12
#define AST_OR 13
#define AST_NOT 14
#define AST_UMINUS 15
#define AST_ASSIGN 16
#define AST_ARRAY_ACCESS 17
#define AST_ARRAY_ASSIGN 18
#define AST_FUNC_CALL 19
#define AST_IF 20
#define AST_IF_ELSE 21
#define AST_WHILE 22
#define AST_DO_WHILE 23
#define AST_READ 24
#define AST_PRINT 25
#define AST_RETURN 26
#define AST_BLOCK 27
#define AST_LIST 28
#define AST_VAR_DECL 29
#define AST_ARRAY_DECL 30
#define AST_ARRAY_INIT 31
#define AST_FUNC_DECL 32
#define AST_PARAM 33
#define AST_ARG 34
#define AST_PRINT_ELEM 35

#include "symbols.hpp"

// Estrutura do nodo da AST
typedef struct astnode {
    int type;
    SYMBOL* symbol;
    struct astnode* son[4];
} AST;

// Protótipos das funções
AST* astCreate(int type, SYMBOL* symbol, AST* s0, AST* s1, AST* s2, AST* s3);
void astPrint(AST* node, int level);
void astDecompile(AST* node, FILE* output);

#endif