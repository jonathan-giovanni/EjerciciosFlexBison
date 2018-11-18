%{
    #include "head.h"
    void yyerror(char *);
    int yylex(void);
    int sym[26];
    extern int columna;
%}

%start linea
%token NUMERO STRING ID SELECT FROM WHERE AND OR INSERT INTO VALUES DELETE UPDATE
%token LIMIT SET CAMPO_TABLA OP_LOGICO OP_ARITME NULO
%token EXIT_COMMAND
%left ','
%left OP_ARITME
%left '*'

%%
linea:
        linea sentencia {;}
        | /* cadena vacia */
        ;
sentencia:
        sentencia_select ';'                   {printf("\ncomando select Correcto\n");}
        | sentencia_insert ';'                 {printf("\ncomando insert Correcto\n");}
        | sentencia_delete ';'                 {printf("\ncomando delete Correcto\n");}
        | sentencia_update ';'                 {printf("\ncomando update Correcto\n");}
        | '\n'
	    | EXIT_COMMAND                          {exit(EXIT_SUCCESS);}
        | error '\n'                            {yyerrok;}/*recuperacion de errores*/
        ;

sentencia_select:
        SELECT select_expr FROM ID limit_exp
        | SELECT select_expr FROM ID WHERE sentencia_where limit_exp
        ;
sentencia_insert:
        INSERT INTO ID VALUES '(' valores_lst ')'
        | INSERT INTO ID '(' tabla_valor ')' VALUES '(' valores_lst ')'
        ;
sentencia_delete:
        DELETE FROM ID WHERE sentencia_where limit_exp
        ;
sentencia_update:
        UPDATE ID SET asignar_lst limit_exp
        | UPDATE ID SET asignar_lst WHERE sentencia_where limit_exp
        ;
select_expr:  
        '*'
        | tabla_valor
        ;
aritm_expr:
        ID
        | CAMPO_TABLA
        | NUMERO
        | aritm_expr OP_ARITME aritm_expr
        | aritm_expr '*' aritm_expr
        ;
tabla_valor:
        ID
        | CAMPO_TABLA
        | tabla_valor ',' tabla_valor
        ;
sentencia_where:
        comparar
        | comparar AND sentencia_where
        | comparar OR sentencia_where
        ; 
comparar:
        asignar
        | ID OP_LOGICO valores_exp
        | CAMPO_TABLA OP_LOGICO valores_exp
        ;
asignar:
        ID '=' valores_exp
        | CAMPO_TABLA '=' valores_exp
        ;
asignar_lst:
        asignar
        | asignar_lst ',' asignar_lst
        ;
valores_lst:
        valores_exp
        | valores_lst ',' valores_lst
        ;
valores_exp:
        aritm_expr
        | STRING
        | NULO
        ;
limit_exp:
        LIMIT NUMERO
        | /*cadena vacia*/
        ;
%%
void yyerror(char *s)
{
  extern int yylineno;	// predefinida en lex.c
  extern char *yytext;	// predefinida en lex.c
  printf("\nERROR: %s en simbolo \"%s\" en linea %d columna  %d\n",s,yytext,yylineno,columna); 
}
