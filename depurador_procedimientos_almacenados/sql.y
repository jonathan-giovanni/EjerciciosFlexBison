%{
    #include "head.h"
    extern int yylineno;	// predefinida en lex.c
    extern char *yytext;	// predefinida en lex.c
    void yyerror(char *);
    int yylex(void);
    void escribe_archivo(char *, char *, int);
    void limpiar_archivo();
%}

%start procedimiento
%token PUNTOCOMA ASTERISCO PARENTESIS ID ENTERO DECIMAL CADENA CALL
%token END BEGING DECLARE PROCEDURE CREATE DELIMITER SET VARCHAR INT NULO 
%token THEN ELSE IF VALUES INTO WHERE FROM OR AND INSERT DELETE UPDATE SELECT 
%token EXIT_COMMAND IN OUT INOUT PARENTESISA DELIMITADOR COMILLA2 COMILLA1
%token ASIGNA DIFERENTE MAYOR_IGUAL MENOR_IGUAL IGUAL MAYOR MENOR COMA PARENTESISB
%token SUMA RESTA DIVISION
%left 'AND' 'OR'
%left '+' '-'
%left '*' '/'
%%
procedimiento:
	DELIMITER DELIMITADOR CREATE PROCEDURE identificador PARENTESISA parametro PARENTESISB BEGING instruccion END DELIMITADOR DELIMITER PUNTOCOMA { printf("proceimiento ok\n");}
	|error DELIMITER PUNTOCOMA	{ yyerrok;}
	| 				{;}
	;
instruccion:
	instruccion sentencia PUNTOCOMA	{ printf("instruccion ok\n");}
	| error PUNTOCOMA		{ yyerrok;}
	| 				{;}
	;
sentencia:
  	I			{ printf("INSERT VALIDO\n");}
  	| S			{ printf("SELECT VALIDO\n");}
	| U			{ printf("UPDATE VALIDO\n");}
	| D			{ printf("DELETE VALIDO\n");}
	| declaracion		{ printf("DECLARACION VALIDO\n");}
	| EXIT_COMMAND  	{exit(EXIT_SUCCESS);}
	;
S:
	SELECT identificador FROM identificador		{;}
	| SELECT ASTERISCO FROM identificador			{;}
	| S WHERE ExpWhere				{;}
	;
I:
	INSERT INTO identificador PARENTESISA identificador PARENTESISB VALUES PARENTESISA campos PARENTESISB {;}
	| INSERT INTO identificador VALUES PARENTESISA campos PARENTESISB {;}
	;
D:
	DELETE FROM identificador WHERE ExpWhere		{;}
	;
U:
	UPDATE identificador SET ExpSet		{;}
	| U WHERE ExpWhere			{;}
	;
identificador:
	ID
	| identificador COMA ID					{;}
	;
expr:
	ID		 	{;}
	| ENTERO		{;}
	| DECIMAL		{;}
	| expr SUMA expr 	{;}
	| expr RESTA expr 	{;}
	| expr ASTERISCO expr 	{;}
	| expr DIVISION expr 	{;}
	;
valor:
	NULO
	| CADENA
	| COMILLA1 ENTERO COMILLA1
	| COMILLA2 ENTERO COMILLA2
	| COMILLA1 DECIMAL COMILLA1
	| COMILLA2 DECIMAL COMILLA2
	| expr
        ;
campos:
	valor			{;}
	|campos COMA valor	{;}
        ;
logico:
	DIFERENTE 
	| MAYOR_IGUAL
	| MENOR_IGUAL
	| IGUAL
	| MAYOR
	| MENOR
	;
ExpWhere:
	identificador logico valor			{;}
	| identificador ASIGNA valor			{;}
	| ExpWhere AND identificador ASIGNA valor	{;}
	| ExpWhere OR identificador ASIGNA valor	{;}
	| ExpWhere AND identificador logico valor	{;}
	| ExpWhere OR identificador logico valor	{;}
	;
asingnaciones:
	identificador ASIGNA valor		{;}
	;
ExpSet:
	asingnaciones				{;}
	| ExpSet COMA asingnaciones		{;}
	;
modo:	IN	{;}
	| OUT	{;}
	| INOUT	{;}
	;
tipo:	INT		{;}
	| DECIMAL	{;}
	| VARCHAR	{;}
	;
parametro: 
	ID tipo				{;}
	| modo ID tipo			{;}
	| parametro COMA ID tipo	{;}
	| parametro COMA modo ID tipo	{;}
	| 				{;}
	;
declaracion:
	DECLARE identificador tipo	{;}
	| 				{;}
	;
%%
void yyerror(char *s){
	printf("ERROR: %s en simbolo \"%s\" en linea %d \n",s,yytext,yylineno);
	escribe_archivo(s,yytext,yylineno);
}
void escribe_archivo(char *simbolo, char *texto, int linea){
	FILE *archivo;
 	archivo = fopen("salida.out","a");//a para aderir
 	if (archivo == NULL){
 		perror("Error al crear, escribir o abrir el archivo");
		exit(1);
 	}
	else {
 		fprintf(archivo,"\nTexto: %s | Simbolo: %s | Linea: %d .\n",simbolo,texto,linea);
	}
        fclose(archivo);
}
void limpiar_archivo(){
	FILE *archivo;
 	archivo = fopen("salida.out","w");
 	if (archivo == NULL){
 		perror("Error al limpiar el archivo");
		exit(1);
 	}
	else {
 		fprintf(archivo,"");
	}
        fclose(archivo);
}
