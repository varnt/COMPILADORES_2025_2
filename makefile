CXX = g++
CXXFLAGS = -std=c++11 -Wall

# Alvo principal
target: etapa2

# Regra para criar o executável final
etapa2: parser.tab.o lex.yy.o symbols.o
	$(CXX) parser.tab.o lex.yy.o symbols.o -o etapa2

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
parser.tab.o: parser.tab.cpp symbols.hpp
symbols.o: symbols.cpp symbols.hpp 
main.o: main.cpp symbols.hpp parser.tab.hpp
lex.yy.o: lex.yy.cpp parser.tab.hpp symbols.hpp

# Limpeza dos arquivos gerados
clean:
	rm -f etapa1 etapa2 lex.yy.cpp parser.tab.cpp parser.tab.hpp *.o

# Regra para executar testes
test2: etapa2
	./etapa2 sample.txt
	
# Empacotamento
pkge2:
	rm -f etapa2.tgz
	tar cvzf etapa2.tgz makefile scanner.l parser.ypp symbols.cpp symbols.hpp 

#EOF