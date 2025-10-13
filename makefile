CXX = g++
CXXFLAGS = -std=c++11 -Wall

# Alvo principal
target: etapa3

# Regra para criar o executável final
etapa3: parser.tab.o lex.yy.o symbols.o ast.o
	$(CXX) parser.tab.o lex.yy.o symbols.o ast.o -o etapa3

# Regra genérica para compilar arquivos .cpp em .o
%.o: %.cpp 
	$(CXX) $(CXXFLAGS) $< -c

# Regra específica para gerar o parser a partir do bison
parser.tab.cpp parser.tab.hpp: parser.ypp
	bison -d -o parser.tab.cpp parser.ypp

# Regra específica para gerar o scanner a partir do flex
lex.yy.cpp: scanner.l parser.tab.hpp
	flex -o lex.yy.cpp scanner.l 

# Dependências específicas
parser.tab.o: parser.tab.cpp symbols.hpp ast.hpp
symbols.o: symbols.cpp symbols.hpp 
ast.o: ast.cpp ast.hpp symbols.hpp
lex.yy.o: lex.yy.cpp parser.tab.hpp symbols.hpp

# Limpeza dos arquivos gerados
clean:
	rm -f etapa1 etapa2 etapa3 lex.yy.cpp parser.tab.cpp parser.tab.hpp *.o

# Regra para executar testes
test3: etapa3
	./etapa3 sample.txt eq1.txt
	./etapa3 eq1.txt eq2.txt
	diff eq1.txt eq2.txt

# Empacotamento
pkge3:
	rm -f etapa3.tgz
	tar cvzf etapa3.tgz makefile scanner.l parser.ypp symbols.cpp symbols.hpp ast.cpp ast.hpp

#EOF