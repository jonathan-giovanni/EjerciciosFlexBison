%{
    #include "head.h"
    #include "y.tab.h"
    void yyerror(char *);
    int yylineno = 1; //en windows se declara.
%}
select 				(s|S)(e|E)(l|L)(e|E)(c|C)(t|T)
update				(u|U)(p|P)(d|D)(a|A)(t|T)(e|E)
delete				(d|D)(e|E)(l|L)(e|E)(t|T)(e|E)
insert				(i|I)(n|N)(s|S)(e|E)(r|R)(t|T)
from				(f|F)(r|R)(o|O)(m|M)
where				(w|W)(h|H)(e|E)(r|R)(e|E)
into				(i|I)(n|N)(t|T)(o|O)
and				(a|A)(n|N)(d|D)
or				(o|O)(r|R)
set				(s|S)(e|E)(t|T)
values				(v|V)(a|A)(l|L)(u|U)(e|E)(s|S)
if				(i|I)(f|F)
then				(t|T)(h|H)(e|E)(n|N)
else				(e|E)(l|L)(s|S)(e|E)
int 				(i|I)(n|N)(t|T)
varchar				(v|V)(a|A)(r|R)(c|C)(h|H)(a|A)(r|R)
null				(n|N)(u|U)(l|L)(l|L)
delimiter			(d|D)(e|E)(l|L)(i|I)(m|M)(i|I)(t|T)(e|E)(r|R)
create 				(c|C)(r|R)(e|E)(a|A)(t|T)(e|E)
procedure			(p|P)(r|R)(o|O)(c|C)(e|E)(d|D)(u|U)(r|R)(e|E)
declare				(d|D)(e|E)(c|C)(l|L)(a|A)(r|R)(e|E)
beging				(b|B)(e|E)(g|G)(i|I)(n|N)
end				(e|E)(n|N)(d|D)
call				(c|C)(a|A)(l|L)(l|L)
exit				(e|E)(x|X)(i|I)(t|T)
in				(i|I)(n|N)
out				(o|O)(u|U)(t|T)
inout				(i|I)(n|N)(o|O)(u|U)(t|T)
letra			[a-zA-Z]
cadena1			("\'"){letra}*("\'")
cadena2			("\""){letra}*("\"")
entero			[0-9]+
dec			{entero}("."){entero}?
id			("_"|{letra})("_"|{letra}|{entero})*
%%
"+"		{yylval= *yytext;return SUMA;}
"-"		{yylval= *yytext;return RESTA;}
"/"		{yylval= *yytext;return DIVISION;}
"<"		{yylval= *yytext;return MENOR;}
">"		{yylval= *yytext;return MAYOR;}
"=="		{yylval= *yytext;return IGUAL;}
"<="		{yylval= *yytext;return MENOR_IGUAL;}
">="		{yylval= *yytext;return MAYOR_IGUAL;}
"<>"		{yylval= *yytext;return DIFERENTE;}
"="		{yylval= *yytext;return ASIGNA;}
"\'"		{yylval= *yytext;return COMILLA1;}
"\""		{yylval= *yytext;return COMILLA2;}
"&&"		{yylval= *yytext;return DELIMITADOR;}
"//"		{yylval= *yytext;return DELIMITADOR;}
")"		{yylval= *yytext;return PARENTESISB;}
","		{yylval= *yytext;return COMA;}
"("		{yylval= *yytext;return PARENTESISA;}
"*"		{yylval= *yytext;return ASTERISCO;}
";"		{yylval= *yytext;return PUNTOCOMA;}
{exit}		{yylval= *yytext;return EXIT_COMMAND;}
{in}		{yylval= *yytext;return IN;}
{out}		{yylval= *yytext;return OUT;}
{inout}		{yylval= *yytext;return INOUT;}
{select}	{yylval= *yytext;return SELECT;}
{update}	{yylval= *yytext;return UPDATE;}
{delete}	{yylval= *yytext;return DELETE;}
{insert}	{yylval= *yytext;return INSERT;}
{and}		{yylval= *yytext;return AND;}
{or}		{yylval= *yytext;return OR;}
{from}		{yylval= *yytext;return FROM;}
{where}		{yylval= *yytext;return WHERE;}
{into}		{yylval= *yytext;return INTO;}
{values}	{yylval= *yytext;return VALUES;}
{if}		{yylval= *yytext;return IF;}
{else}		{yylval= *yytext;return ELSE;}
{then}		{yylval= *yytext;return THEN;}
{null}		{yylval= *yytext;return NULO;}
{int}		{yylval= *yytext;return INT;}
{varchar}	{yylval= *yytext;return VARCHAR;}
{set}		{yylval= *yytext;return SET;}
{delimiter}	{yylval= *yytext;return DELIMITER;}
{create}	{yylval= *yytext;return CREATE;}
{procedure}	{yylval= *yytext;return PROCEDURE;}
{declare}	{yylval= *yytext;return DECLARE;}
{beging}	{yylval= *yytext;return BEGING;}
{end}		{yylval= *yytext;return END;}
{call}		{yylval= *yytext;return CALL;}
{cadena1}	{yylval= *yytext;return CADENA;}
{cadena2}	{yylval= *yytext;return CADENA;}
{entero}	{yylval= *yytext;return ENTERO;}
{dec}		{yylval= *yytext;return DECIMAL;}
{id}		{yylval= *yytext; return ID;}
[ \t]     	{;}
[\n]		{ yylineno++;}
.           	{ECHO;yyerror("caracter invalido");}
%%
int yywrap(void) {
    return 1;
}
