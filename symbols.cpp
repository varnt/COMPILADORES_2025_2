#include symbol.hpp
#include <map>

map<string, SYMBOL> SymbolTable;

//implementation

SYMBOL* insertSymbolTable(char* name, int type)
{
    string sname(name);
    if (SymbolTable.find(sname) == SymbolTable.end())
    {
        SYMBOL sym(sname, type);
        SymbolTable[sname] = sym;
        return &SymbolTable[sname];
    }
    else
    {
        return nullptr; //symbol already exists
    }
}

void printSymbolTable()
{
    printf("Symbol Table:\n");
    for (auto const& pair : SymbolTable)
    {
        printf("Name: %s, Type: %d\n", pair.second.name.c_str(), pair.second.type);
    }
}