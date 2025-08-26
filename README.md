# 👨🏽‍💻 COMPILADORES_2025_2
Trabalho de Compiladores 2025/2

---
## 📋 Lista de afazeres - Etapa 1: Análise Léxica e Inicialização da Tabela de Símbolos Entrega 27 de agosto

### **1. Estrutura do Projeto e Configuração**
- [ ] Implementar um analisador léxico usando a ferramenta **flex**[cite: 5].
- [ ] Separar a função `main` em um arquivo chamado `main.cpp`, mantendo-a fora do código do scanner[cite: 52].
- [ ] Manter o arquivo `tokens.h` intacto[cite: 52].
- [ ] Utilizar um container `map` de STL (Standard Template Library) para a tabela de símbolos global[cite: 5].

### **2. Funcionalidades de Análise Léxica**
- [ ] Criar expressões regulares para cada tipo de lexema[cite: 8].
- [ ] Classificar os lexemas reconhecidos em tokens, retornando as constantes do arquivo `tokens.h` ou códigos ASCII para caracteres simples[cite: 9, 10].
- [ ] Incluir identificadores e literais (inteiros, reais, caracteres e strings) em uma tabela de símbolos global com acesso eficiente por chave alfanumérica[cite: 11].
- [ ] Controlar o número da linha do arquivo fonte e fornecer a função `int getLineNumber(void)`[cite: 12].
- [ ] Ignorar comentários de linha única, que começam com `//`[cite: 13, 46].
- [ ] Ignorar comentários de múltiplas linhas, que começam com `/*` e terminam com `*/`, mas contar as quebras de linha que estiverem dentro deles[cite: 13, 47].
- [ ] Ignorar caracteres em branco, como espaço, tabulação e nova linha[cite: 49].
- [ ] Informar erro léxico e retornar o token de erro ao encontrar caracteres inválidos[cite: 14].
- [ ] Definir e atualizar uma variável global e a função `int isRunning(void)` que retorna `true` (diferente de 0) durante a análise e `false` (igual a 0) ao encontrar o fim do arquivo[cite: 15].

### **3. Reconhecimento de Tokens**
- [ ] **Palavras Reservadas:**
  - [ ] Reconhecer e retornar o token correspondente para as palavras `char`, `int`, `float`, `bool`, `if`, `else`, `do`, `while`, `read`, `print`, `return`[cite: 22, 23].
  - [ ] Tratar os literais booleanos `true` e `false` como palavras reservadas[cite: 37].
- [ ] **Caracteres Especiais:**
  - [ ] Retornar o código ASCII convertido para inteiro para os seguintes caracteres: `;`, `:`, `(`, `)`, `[`, `]`, `{`, `}`, `=`, `+`, `-`, `*`, `/`, `%`, `<`, `>`, `&`[cite: 25, 27, 28].
- [ ] **Operadores Compostos:**
  - [ ] Reconhecer os operadores relacionais compostos e retornar o token correspondente:
    - [ ] `<=` deve retornar `OPERATOR LE`[cite: 32].
    - [ ] `>=` deve retornar `OPERATOR GE`[cite: 32].
    - [ ] `==` deve retornar `OPERATOR EQ`[cite: 32].
    - [ ] `!=` deve retornar `OPERATOR DIF`[cite: 32].
- [ ] **Identificadores:**
  - [ ] Reconhecer identificadores formados por uma sequência de um ou mais caracteres alfabéticos (maiúsculos ou minúsculos) ou dígitos (a partir da segunda posição)[cite: 34].
  - [ ] Permitir os caracteres `_` e `-` em qualquer posição[cite: 34].
- [ ] **Literais:**
  - [ ] **Inteiros:** Reconhecer sequências de um ou mais dígitos decimais[cite: 38].
  - [ ] **Reais:** Reconhecer a parte inteira seguida do ponto decimal e da parte fracionária, onde ambas as partes precisam ter ao menos um dígito[cite: 39].
  - [ ] **Caracteres:** Reconhecer um único caractere entre aspas simples (apóstrofo)[cite: 40].
  - [ ] **Strings:** Reconhecer sequências de caracteres entre aspas duplas[cite: 41, 42].
  - [ ] Implementar as sequências de escape `\"` para aspas duplas e `\n` para quebra de linha dentro de strings[cite: 44].

---


# ⚙️ Instalar para começar:
```
sudo apt install build-essential
sudo apt install flex
sudo apt update
sudo apt upgrade
```


# 📚 Links úteis 
- [Flex 2.5](https://web.archive.org/web/20210618023846/http://dinosaur.compilertools.net/flex/index.html)
- [Flex Manual](https://westes.github.io/flex/manual/)
- [Bison Manual](https://www.gnu.org/software/bison/manual/bison.html)
- [C Language Reference](https://en.cppreference.com/w/c/language)