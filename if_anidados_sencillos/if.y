%{
    #include "head.h"
    int yylex(void);
    void yyerror(char *);
    int sym[26];
%}
%start line
%token ID IF THEN ELSE
%nonassoc IFX             //evita la ambiguedad
%nonassoc ELSE            //evita la ambiguedad
%%

line:
  line expr 	{;}
  | /* cadena vacia */
  ;
expr:
	IF expr THEN expr %prec IFX
	| IF expr THEN expr ELSE expr
  | ID
	;
%%
void yyerror(char *s)
{
  extern int yylineno;	// predefinida en lex.c
  extern char *yytext;	// predefinida en lex.c

  printf("ERROR: %s en simbolo \"%s\" en linea %d \n",s,yytext,yylineno);
  exit(1);
}
