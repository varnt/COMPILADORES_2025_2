#include "ast.hpp"
#include <stdlib.h>
#include <stdio.h>

// Aluno Victor de Souza Arnt Matricula 00291097

AST* astCreate(int type, SYMBOL* symbol, AST* c0, AST* c1, AST* c2, AST* c3) {
    AST* node = (AST*)calloc(1, sizeof(AST));
    node->type = type;
    node->symbol = symbol;
    node->son[0] = c0;
    node->son[1] = c1;
    node->son[2] = c2;
    node->son[3] = c3;
    return node;
}
// Função para imprimir a árvore AST de forma indentada
void astPrint(AST* node, int level) {
    if (!node) return;
    
    for (int i = 0; i < level; i++)
        fprintf(stderr, "  ");
    
    fprintf(stderr, "AST(type=%d", node->type);
    if (node->symbol)
        fprintf(stderr, ", symbol=%s", node->symbol->name.c_str());
    fprintf(stderr, ")\n");
    
    for (int i = 0; i < 4; i++)
        astPrint(node->son[i], level + 1);
}
// Função para descompilar a AST de volta para código fonte
void astDecompile(AST* node, FILE* output) {
    if (!node) return;
    
    switch (node->type) {
        case AST_SYMBOL:
            if (node->symbol)
                fprintf(output, "%s", node->symbol->name.c_str());
            break;
            
        case AST_ADD:
            astDecompile(node->son[0], output);
            fprintf(output, " + ");
            astDecompile(node->son[1], output);
            break;
            
        case AST_SUB:
            astDecompile(node->son[0], output);
            fprintf(output, " - ");
            astDecompile(node->son[1], output);
            break;
            
        case AST_MUL:
            astDecompile(node->son[0], output);
            fprintf(output, " * ");
            astDecompile(node->son[1], output);
            break;
            
        case AST_DIV:
            astDecompile(node->son[0], output);
            fprintf(output, " / ");
            astDecompile(node->son[1], output);
            break;
            
        case AST_MOD:
            astDecompile(node->son[0], output);
            fprintf(output, " %% ");
            astDecompile(node->son[1], output);
            break;
            
        case AST_LT:
            astDecompile(node->son[0], output);
            fprintf(output, " < ");
            astDecompile(node->son[1], output);
            break;
            
        case AST_GT:
            astDecompile(node->son[0], output);
            fprintf(output, " > ");
            astDecompile(node->son[1], output);
            break;
            
        case AST_LE:
            astDecompile(node->son[0], output);
            fprintf(output, " <= ");
            astDecompile(node->son[1], output);
            break;
            
        case AST_GE:
            astDecompile(node->son[0], output);
            fprintf(output, " >= ");
            astDecompile(node->son[1], output);
            break;
            
        case AST_EQ:
            astDecompile(node->son[0], output);
            fprintf(output, " == ");
            astDecompile(node->son[1], output);
            break;
            
        case AST_DIF:
            astDecompile(node->son[0], output);
            fprintf(output, " != ");
            astDecompile(node->son[1], output);
            break;
            
        case AST_AND:
            astDecompile(node->son[0], output);
            fprintf(output, " & ");
            astDecompile(node->son[1], output);
            break;
            
        case AST_OR:
            astDecompile(node->son[0], output);
            fprintf(output, " | ");
            astDecompile(node->son[1], output);
            break;
            
        case AST_NOT:
            fprintf(output, "~");
            astDecompile(node->son[0], output);
            break;
            
        case AST_NEG:
            fprintf(output, "-");
            astDecompile(node->son[0], output);
            break;
            
        case AST_ASSIGN:
            astDecompile(node->son[0], output);
            fprintf(output, " = ");
            astDecompile(node->son[1], output);
            break;
            
        case AST_ASSIGN_VEC:
            astDecompile(node->son[0], output);
            fprintf(output, "[");
            astDecompile(node->son[1], output);
            fprintf(output, "] = ");
            astDecompile(node->son[2], output);
            break;
            
        case AST_VEC_ACCESS:
            astDecompile(node->son[0], output);
            fprintf(output, "[");
            astDecompile(node->son[1], output);
            fprintf(output, "]");
            break;
            
        case AST_FUNC_CALL:
            astDecompile(node->son[0], output);
            fprintf(output, "(");
            astDecompile(node->son[1], output);
            fprintf(output, ")");
            break;
            
        case AST_IF:
            fprintf(output, "if (");
            astDecompile(node->son[0], output);
            fprintf(output, ") ");
            astDecompile(node->son[1], output);
            break;
            
        case AST_IF_ELSE:
            fprintf(output, "if (");
            astDecompile(node->son[0], output);
            fprintf(output, ") ");
            astDecompile(node->son[1], output);
            fprintf(output, " else ");
            astDecompile(node->son[2], output);
            break;
            
        case AST_WHILE:
            fprintf(output, "while (");
            astDecompile(node->son[0], output);
            fprintf(output, ") ");
            astDecompile(node->son[1], output);
            break;
            
        case AST_DO_WHILE:
            fprintf(output, "do ");
            astDecompile(node->son[0], output);
            fprintf(output, " while (");
            astDecompile(node->son[1], output);
            fprintf(output, ");\n");
            break;
            
        case AST_READ:
            fprintf(output, "read ");
            astDecompile(node->son[0], output);
            break;
            
        case AST_PRINT:
            fprintf(output, "print ");
            astDecompile(node->son[0], output);
            break;
            
        case AST_RETURN:
            fprintf(output, "return ");
            astDecompile(node->son[0], output);
            break;
            
        case AST_BLOCK:
            fprintf(output, "{\n");
            astDecompile(node->son[0], output);
            fprintf(output, "}\n");
            break;
            
        case AST_VAR_DECL:
            astDecompile(node->son[0], output); // tipo
            fprintf(output, " ");
            astDecompile(node->son[1], output); // identificador
            fprintf(output, " = ");
            astDecompile(node->son[2], output); // literal
            fprintf(output, ";\n");
            break;
            
        case AST_VEC_DECL:
            astDecompile(node->son[0], output); // tipo
            fprintf(output, " ");
            astDecompile(node->son[1], output); // identificador
            fprintf(output, "[");
            astDecompile(node->son[2], output); // tamanho
            fprintf(output, "];\n");
            break;
            
        case AST_VEC_DECL_INIT:
            astDecompile(node->son[0], output); // tipo
            fprintf(output, " ");
            astDecompile(node->son[1], output); // identificador
            fprintf(output, "[");
            astDecompile(node->son[2], output); // tamanho
            fprintf(output, "] = ");
            astDecompile(node->son[3], output); // lista de literais
            fprintf(output, ";\n");
            break;
            
        case AST_FUNC_DECL:
            astDecompile(node->son[0], output); // tipo
            fprintf(output, " ");
            astDecompile(node->son[1], output); // identificador
            fprintf(output, "(");
            astDecompile(node->son[2], output); // parametros
            fprintf(output, ") ");
            astDecompile(node->son[3], output); // bloco
            break;
            
        case AST_PARAM:
            astDecompile(node->son[0], output); // tipo
            fprintf(output, " ");
            astDecompile(node->son[1], output); // identificador
            break;
            
        case AST_ARG:
            astDecompile(node->son[0], output);
            break;
            
        case AST_CMD_LIST:
            astDecompile(node->son[0], output);
            if (node->son[1]) {
                fprintf(output, ";\n");
                astDecompile(node->son[1], output);
            }
            break;
            
        case AST_DECL_LIST:
            astDecompile(node->son[0], output);
            astDecompile(node->son[1], output);
            break;
            
        case AST_PARAM_LIST:
            astDecompile(node->son[0], output);
            if (node->son[1]) {
                fprintf(output, ", ");
                astDecompile(node->son[1], output);
            }
            break;
            
        case AST_ARG_LIST:
            astDecompile(node->son[0], output);
            if (node->son[1]) {
                fprintf(output, ", ");
                astDecompile(node->son[1], output);
            }
            break;
            
        case AST_PRINT_LIST:
            astDecompile(node->son[0], output);
            if (node->son[1]) {
                fprintf(output, " ");
                astDecompile(node->son[1], output);
            }
            break;
            
        case AST_LIT_LIST:
            astDecompile(node->son[0], output);
            if (node->son[1]) {
                fprintf(output, " ");
                astDecompile(node->son[1], output);
            }
            break;
            
        case AST_PROGRAM:
            astDecompile(node->son[0], output);
            break;
            
        default:
            fprintf(stderr, "Erro: tipo de nodo desconhecido: %d\n", node->type);
            break;
    }
}
