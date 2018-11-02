%{
    #include "head.h"
    #include "y.tab.h"		//se genera al compilar el *.y
    void yyerror(char *);
    //int yylineno = 1;	//en windows se declara
%}
alpha[A-Za-z]
digit[0-9]
%%
[ \t]     			; 					/* whitespaces */
[\n]				{ yylineno++;	}
if				  return IF;
then				return THEN;
else				return ELSE;
{alpha}({alpha}|{digit})*	{yylval = *yytext - 'a';return ID;} 	/* identificadores, yylval vale desde cero hasta ....26 */
.				return yytext[0];
%%
int yywrap(void) {
    return 1;
}
