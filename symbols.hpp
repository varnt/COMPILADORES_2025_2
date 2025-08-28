
#define SYMBOLS_HPP

#include <string>
#include <map>

using namespace std;

// Enum para tipos de símbolos
enum SymbolTypes {
    SYMBOL_VOID, 
    SYMBOL_INT, 
    SYMBOL_FLOAT, 
    SYMBOL_CHAR, 
    SYMBOL_BOOL,
    SYMBOL_IDENTIFIER,
    SYMBOL_LITERAL_INT,
    SYMBOL_LITERAL_FLOAT,
    SYMBOL_LITERAL_CHAR,
    SYMBOL_LITERAL_STRING
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
