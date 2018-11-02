%{
    #include "head.h"
    int yylex(void);
    void yyerror(char *);
    int sym[26];
%}
%start line
%token INTEGER PRINT EXIT_COMMAND ID WHILE IF THEN LE GE EQ NE OR AND ELSE
%nonassoc IFX
%nonassoc ELSE
%right '='
%left AND OR
%left '<' '>' LE GE EQ NE
%left '+''-'
%left '*''/'
%right UMINUS
%left '!'
%%

line:
        line stmt 	{;}
        | /* cadena vacia */
        ;
stmt:
	';'
	| expr ';'				{ $$ = $1; }
	| PRINT expr ';'			{ printf("%d\n", $2); }
	| ID '=' expr ';' 			{ sym[$1] = $3; }
	| EXIT_COMMAND ';' 			{ exit(EXIT_SUCCESS);}
	| WHILE '(' expr ')' stmt		
	| IF '(' expr ')' stmt %prec IFX	
	| IF '(' expr ')' stmt ELSE stmt	
	| '{' stmt_list '}'              	{ $$ = $2; }
	;
stmt_list:
          stmt                  { $$ = $1; }
        | stmt_list stmt        
        ;
expr:
        INTEGER
        | ID			{ $$ = sym[$1]; }
        | expr '+' expr		{ $$ = $1 + $3; }
        | expr '-' expr		{ $$ = $1 - $3; }
        | expr '*' expr		{ $$ = $1 * $3; }
        | expr '/' expr     	{ $$ = $1 / $3; }
	| expr'<'expr		{ $$ = $1 < $3; }
	| expr'>'expr		{ $$ = $1 > $3; }
	| expr LE expr		{ $$ = $1 <= $3; }
	| expr GE expr		{ $$ = $1 >= $3; }
	| expr EQ expr		{ $$ = $1 == $3; }
	| expr NE expr		{ $$ = $1 != $3; }
	| expr OR expr		{ $$ = $1 || $3; }
	| expr AND expr		{ $$ = $1 && $3; }
        | '(' expr ')'		{ $$ = $2; }
        ;
%%
void yyerror(char *s)
{
  extern int yylineno;	// predefinida en lex.c
  extern char *yytext;	// predefinida en lex.c

  printf("ERROR: %s en simbolo \"%s\" en linea %d \n",s,yytext,yylineno); 
  exit(1);
}
