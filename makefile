etapa1: lex.yy.cpp
    g++ -std=c++11 lex.yy.cpp -o etapa1

lex.yy.cpp: scanner.l
    flex -o lex.yy.cpp scanner.l

clean:
	rm -f lex.yy.cpp etapa1