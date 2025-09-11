
#define SYMBOLS_HPP

#include <string>
#include <map>

using namespace std;

// Adicionei para e2 - Definições para tipos de símbolos conforme especificação de tipos e valores
#define SYMBOL_LIT_INT 1
#define SYMBOL_LIT_CHAR 2
#define SYMBOL_LIT_FLOAT 3
#define SYMBOL_LIT_STRING 4
#define SYMBOL_LIT_TRUE 5
#define SYMBOL_LIT_FLASE 6
#define SYMBOL_IDENTIFIER 7
#define SYMBOL_VARIABLE 8
#define SYMBOL_VECTOR 9
#define SYMBOL_FUNCTION 10

// Enum para tipos de símbolos - Ajustei de acordo com os tipos de simbolos
enum SymbolTypes {
    SYMBOL_VOID = 0, 
    SYMBOL_INT = SYMBOL_LIT_INT, 
    SYMBOL_FLOAT = SYMBOL_LIT_FLOAT, 
    SYMBOL_CHAR = SYMBOL_LIT_CHAR, 
    SYMBOL_BOOL = 5,
    SYMBOL_LITERAL_INT = SYMBOL_LIT_INT,
    SYMBOL_LITERAL_FLOAT = SYMBOL_LIT_FLOAT,
    SYMBOL_LITERAL_CHAR = SYMBOL_LIT_CHAR,
    SYMBOL_LITERAL_STRING = SYMBOL_LIT_STRING
};

// Estrutura para representar um símbolo na tabela exemplo aula
struct SYMBOL {
    string name;
    int type;
    
public:
    SYMBOL() : name(""), type(SYMBOL_VOID) {}
    SYMBOL(string n, int t) : name(n), type(t) {}
};

// Declaração da tabela de símbolos global
extern map<string, SYMBOL> SymbolTable;

// Protótipos das funções
SYMBOL* insertSymbolTable(char* name, int type);
void printSymbolTable();
void SymbolTableInit(); // Função de inicialização da tabela
