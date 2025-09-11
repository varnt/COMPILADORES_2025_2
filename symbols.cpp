#include "symbols.hpp"
#include <iostream>
#include <map>

using namespace std;
//Aluno Victor de Souza Arnt Matricula 00291097
// Definição da tabela de símbolos global
map<string, SYMBOL> SymbolTable;


// Inicializa a tabela de símbolos (limpa se já existir)
void SymbolTableInit() {
        SymbolTable.clear();
}

// Insere um símbolo na tabela de símbolos
SYMBOL* insertSymbolTable(char* name, int type) {
    string sname(name);
    
    // Verifica se o símbolo já existe na tabela
    if (SymbolTable.find(sname) == SymbolTable.end()) {
        // Cria novo símbolo e insere na tabela
        SYMBOL sym(sname, type);
        SymbolTable[sname] = sym;
        return &SymbolTable[sname];
    } else {
        // Símbolo já existe, retorna referência existente
        return &SymbolTable[sname];
    }
}

// Imprime toda a tabela de símbolos
void printSymbolTable() {
    cout << "\n=== TABELA DE SÍMBOLOS ===" << endl;
    cout << "Total de símbolos: " << SymbolTable.size() << endl;
    
    for (auto const& pair : SymbolTable) {
        cout << "Nome: " << pair.second.name 
             << ", Tipo: " << pair.second.type << endl;
    }
    cout << "=========================" << endl;
}