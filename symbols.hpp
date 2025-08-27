//Symbols table
//CÓDIGO DEMONSTRADO DURANTE A AULA
#include <string>
#include <map>

using namespace std;
enum SymbolTypes{
    SYMBOL_VOID, SYMBOL_INT, SYMBOL_FLOAT, SYMBOL_CHAR, SYMBOL_BOOL
};  

struct SYMBOL
{
    string name;
    int type;
    public:
    SYMBOL(string n, int t) : name(n), type(t) {};
    

};

//map<string, SYMBOL> symbolTable;

//PROTOTYPES

SYMBOL* insertSymbolTable(char* name, int type);
void printSymbolTable();

//end of file