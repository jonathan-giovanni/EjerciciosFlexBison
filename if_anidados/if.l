%{
    #include "head.h"
    #include "y.tab.h"		//se genera al compilar el *.y
    void yyerror(char *);
    int yylineno = 1;	//en windows se declara
%}
alpha[A-Za-z]
digit[0-9]
%%
"print"				{return PRINT;}
"exit"				{return EXIT_COMMAND;}      			
{digit}+      			{yylval = atoi(yytext);return INTEGER;} /* enteros */		// atoi pasa a numeros enteros
[-+()=/*;] 			{ return *yytext; }			/* operadores */    
[ \t]     			; 					/* whitespaces */
[\n]				{ yylineno++;	}   
if				return IF;
then				return THEN;
else				return ELSE;
{alpha}({alpha}|{digit})*	{yylval = *yytext - 'a';return ID;} 	/* identificadores, yylval vale desde cero hasta ....26 */
"<="				return LE;
">="				return GE;
"=="				return EQ;
"!="				return NE;
"||"				return OR;
"&&"				return AND;
.				return yytext[0];
%%
int yywrap(void) {
    return 1;
}