CXX = g++
CXXFLAGS = -std=c++11 -Wall

# Alvo principal
target: etapa1

# Regra para criar o executável final
etapa1: lex.yy.o main.o symbols.o
	$(CXX) lex.yy.o main.o symbols.o -o etapa1

# Regra genérica para compilar arquivos .cpp em .o
%.o: %.cpp 
	$(CXX) $(CXXFLAGS) $< -c

# Regra específica para gerar o scanner a partir do flex
lex.yy.cpp: scanner.l
	flex -o lex.yy.cpp scanner.l 

# Dependências específicas
main.o: main.cpp tokens.h symbols.hpp
symbols.o: symbols.cpp symbols.hpp
lex.yy.o: lex.yy.cpp tokens.h symbols.hpp

# Limpeza dos arquivos gerados
clean:
	rm -f etapa1 lex.yy.cpp *.o

# Regra para executar testes (opcional)
test: etapa1
	./etapa1 < test.txt
	
pkge1:
	tar cvzf etapa1.tgz main.cpp makefile scanner.l tokens.h symbols.cpp symbols.hpp

#EOF