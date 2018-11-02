# If anidados simplificado

<b>If anidados de manera simplificada siguiendo la siguiente estructura:</b>

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
<b>Entrada de prueba:</b> 


	if a then
	  if b then
	     c
	  else
             d

<b>Uso</b>
* Ubicarse dentro del directorio del proyecto en la consola
* Proceder a llamar a <b>make</b>
