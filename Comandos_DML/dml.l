%{
    #include "head.h"
    #include "y.tab.h"
    void yyerror(char *);
   	// int yylineno = 1; //en windows se declara
   	int columna = 0; //para columnas
%}

%%			
(s|S)(e|E)(l|L)(e|E)(c|C)(t|T)						{columna+=6;return SELECT;}
(f|F)(r|R)(o|O)(m|M)								{columna+=5;return FROM;}
(w|W)(h|H)(e|E)(r|R)(e|E)							{columna+=5;return WHERE;}
(a|A)(n|N)(d|D)										{columna+=3;return AND;}
(o|O)(r|R)											{columna+=2;return OR;}
(i|I)(n|N)(s|S)(e|E)(r|R)(t|T)						{columna+=6;return INSERT;}
(i|I)(n|N)(t|T)(o|O)								{columna+=4;return INTO;}
(v|V)(a|A)(l|L)(u|U)(e|E)(s|S)						{columna+=6;return VALUES;}
(u|U)(p|P)(d|D)(a|A)(t|T)(e|E)						{columna+=6;return UPDATE;}
(d|D)(e|E)(l|L)(e|E)(t|T)(e|E)						{columna+=6;return DELETE;}
(l|L)(i|I)(m|M)(i|I)(t|T)							{columna+=5;return LIMIT;}
(s|S)(e|E)(t|T)										{columna+=3;return SET;}
(n|N)(u|U)(l|L)(l|L)								{columna+=4;return NULO;}


"exit"												{columna+=5;return EXIT_COMMAND;}

[a-zA-Z_][a-zA-Z0-9_]*								{columna+=strlen(yytext);return ID;}
([a-zA-Z_][a-zA-Z0-9_]*"."[a-zA-Z_][a-zA-Z0-9_]+)	{columna+=strlen(yytext);return CAMPO_TABLA;}


('[a-zA-Z0-9\.]*'|\"[a-zA-Z0-9\.]*\")				{columna+=strlen(yytext);return STRING;}

(">"|"<"|">="|"<="|"<>")							{columna+=strlen(yytext);return OP_LOGICO;}
"*"													{columna++;return *yytext;}  
("+"|"-"|"/")									    {columna++;return OP_ARITME;}
[0-9]+("."[0-9]+)?      							{columna+=strlen(yytext);return NUMERO;}/* numeros */
[()=;,] 											{columna++; return *yytext; }  
[ \t]     											{columna+=strlen(yytext);}
[\n]												{columna=0;yylineno++;return *yytext;}/* contar lineas */
													/* cualquier otra cosa es un error */
.           										{columna+=strlen(yytext);ECHO;yyerror("caracter invalido"); } 	/* error */
%%
int yywrap(void) {
    return 1;
}
