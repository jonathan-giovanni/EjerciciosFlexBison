aritme: y.tab.c lex.yy.c main.c head.h
	gcc y.tab.c lex.yy.c main.c -o dml
	
y.tab.c: dml.y
	yacc -d dml.y -o y.tab.c
	
lex.yy.c: dml.l
	flex dml.l
	
clean:
	rm dml
	rm lex.yy.c
	rm y.tab.c
	rm y.tab.h
