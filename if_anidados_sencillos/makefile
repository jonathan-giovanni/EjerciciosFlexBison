aritme: y.tab.c lex.yy.c main.c head.h
	gcc y.tab.c lex.yy.c main.c -o if_parse

y.tab.c: if.y
	bison -dy if.y

lex.yy.c: if.l
	flex if.l

clean:
	rm if_parse
	rm lex.yy.c
	rm y.tab.c
	rm y.tab.h
