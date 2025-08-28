# 👨🏽‍💻 COMPILADORES_2025_2
Trabalho de Compiladores 2025/2

---
## 📋 Lista de afazeres - Etapa 1: Análise Léxica e Inicialização da Tabela de Símbolos

### **1. Estrutura do Projeto e Configuração**
- [ ] Implementar um analisador léxico usando a ferramenta **flex**.
 ✅ Separar a função `main` em um arquivo chamado `main.cpp`, mantendo-a fora do código do scanner.
 ✅ Manter o arquivo `tokens.h` intacto.
- [ ] Utilizar um container `map` de STL (Standard Template Library) para a tabela de símbolos global.

---

### **2. Funcionalidades de Análise Léxica**
- [ ] Criar expressões regulares para cada tipo de lexema.
- [ ] Classificar os lexemas reconhecidos em tokens, retornando as constantes do arquivo `tokens.h` ou códigos ASCII para caracteres simples.
- [ ] Incluir identificadores e literais (inteiros, reais, caracteres e strings) em uma tabela de símbolos global com acesso eficiente por chave alfanumérica.
- [ ] Controlar o número da linha do arquivo fonte e fornecer a função `int getLineNumber(void)`.
 ✅ Ignorar comentários de linha única, que começam com `//`.
- [ ] Ignorar comentários de múltiplas linhas, que começam com `/*` e terminam com `*/`, mas contar as quebras de linha que estiverem dentro deles.
- [ ] Ignorar caracteres em branco, como espaço, tabulação e nova linha.
- [ ] Informar erro léxico e retornar o token de erro ao encontrar caracteres inválidos.
- [ ] Definir e atualizar uma variável global e a função `int isRunning(void)` que retorna `true` (diferente de 0) durante a análise e `false` (igual a 0) ao encontrar o fim do arquivo.

---

### **3. Reconhecimento de Tokens**
✅ **Palavras Reservadas:**
   ✅ Reconhecer e retornar o token correspondente para as palavras `char`, `int`, `float`, `bool`, `if`, `else`, `do`, `while`, `read`, `print`, `return`.
  ✅ Tratar os literais booleanos `true` e `false` como palavras reservadas.
- [ ] **Caracteres Especiais:**
  - [ ] Retornar o código ASCII convertido para inteiro para os seguintes caracteres: `;`, `:`, `(`, `)`, `[`, `]`, `{`, `}`, `=`, `+`, `-`, `*`, `/`, `%`, `<`, `>`, `&`.
- [ ] **Operadores Compostos:**
  - [ ] Reconhecer os operadores relacionais compostos e retornar o token correspondente:
    - [ ] `<=` deve retornar `OPERATOR LE`.
    - [ ] `>=` deve retornar `OPERATOR GE`.
    - [ ] `==` deve retornar `OPERATOR EQ`.
    - [ ] `!=` deve retornar `OPERATOR DIF`.
- [ ] **Identificadores:**
  - [ ] Reconhecer identificadores formados por uma sequência de um ou mais caracteres alfabéticos (maiúsculos ou minúsculos) ou dígitos (a partir da segunda posição).
  - [ ] Permitir os caracteres `_` e `-` em qualquer posição.
- [ ] **Literais:**
  ✅ **Inteiros:** Reconhecer sequências de um ou mais dígitos decimais.
  ✅ **Reais:** Reconhecer a parte inteira seguida do ponto decimal e da parte fracionária, onde ambas as partes precisam ter ao menos um dígito.
  - [ ] **Caracteres:** Reconhecer um único caractere entre aspas simples (apóstrofo).
  - [ ] **Strings:** Reconhecer sequências de caracteres entre aspas duplas.
  - [ ] Implementar as sequências de escape `\"` para aspas duplas e `\n` para quebra de linha dentro de strings.
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

# 🗝️ Chave para submissão do arquivo pelo sistema do prof
A string abaixo é sua chave individual, criada para que somente quem conheça essa string possa acessar os arquivos da etapa do trabalho de Compiladores submetido no servidor http, que estarão em um subdiretório de mesmo nome, conforme instruções dadas no arquivo format1_pdf e explicadas em aula. Essa informação é privada, e não deve ser compartilhada:
```
uzplumqlyfxeqblr
```
# 🖥️ Script para submissão do arquivo pelo sistema do prof
Fazer o pacote para o prof.
```
make pkge1
```
Logar no SFTP
```
sftp -oHostKeyAlgorithms=+ssh-rsa vsarnt@html.inf.ufrgs.br
```
Digita yes
Digita a senha do inf
Dentro da sessão SFTP, executar:
```
cd public_html
mkdir uzplumqlyfxeqblr
cd uzplumqlyfxeqblr
put etapa1.tgz
chmod 744 etapa1.tgz
cd ..
chmod 711 uzplumqlyfxeqblr
cd ..
chmod 711 public_html
exit
```
