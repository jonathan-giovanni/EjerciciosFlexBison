# Depurador de comandos DML en MySQL

</b>Tecnologia a utilizar </b> 
* FLEX
* BISON

<b>Justificación: </b>
ambas tecnologias son compatibles de manera nativa con windows,
por lo tanto se espera que el desarrollo sea más agil.

</b> Tecnologia de interfaz grafica a utilizar: </b>

* JAVA usando el IDE Netbeans

# Comandos DML:

comando SELECT obtenido de:
https://dev.mysql.com/doc/refman/5.5/en/select.html

    SELECT
        ( * | select_expr [, select_expr ...])
        [FROM table_references
        [WHERE where_condition]

---------------------------------------------
comando INSERT obtenido de:
https://dev.mysql.com/doc/refman/5.7/en/insert.html

    INSERT
        [INTO] tbl_name
        [(col_name [, col_name] ...)]
        {VALUES | VALUE} (value_list) ...

---------------------------------------------
comando DELETE obtenido de:
https://dev.mysql.com/doc/refman/5.5/en/delete.html

    DELETE FROM tbl_name
        [WHERE where_condition]
        [LIMIT row_count]

---------------------------------------------
comando UPDATE obtenido de:
https://dev.mysql.com/doc/refman/5.5/en/update.html

    UPDATE table_reference
        SET assignment_list
        [WHERE where_condition]
        [LIMIT row_count]

