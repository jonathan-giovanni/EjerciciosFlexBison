#If anidados

If anidados siguiendo la siguiente estructura:

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
