
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     PUNTOCOMA = 258,
     ASTERISCO = 259,
     PARENTESIS = 260,
     ID = 261,
     ENTERO = 262,
     DECIMAL = 263,
     CADENA = 264,
     CALL = 265,
     END = 266,
     BEGING = 267,
     DECLARE = 268,
     PROCEDURE = 269,
     CREATE = 270,
     DELIMITER = 271,
     SET = 272,
     VARCHAR = 273,
     INT = 274,
     NULO = 275,
     THEN = 276,
     ELSE = 277,
     IF = 278,
     VALUES = 279,
     INTO = 280,
     WHERE = 281,
     FROM = 282,
     OR = 283,
     AND = 284,
     INSERT = 285,
     DELETE = 286,
     UPDATE = 287,
     SELECT = 288,
     EXIT_COMMAND = 289,
     IN = 290,
     OUT = 291,
     INOUT = 292,
     PARENTESISA = 293,
     DELIMITADOR = 294,
     COMILLA2 = 295,
     COMILLA1 = 296,
     ASIGNA = 297,
     DIFERENTE = 298,
     MAYOR_IGUAL = 299,
     MENOR_IGUAL = 300,
     IGUAL = 301,
     MAYOR = 302,
     MENOR = 303,
     COMA = 304,
     PARENTESISB = 305,
     SUMA = 306,
     RESTA = 307,
     DIVISION = 308
   };
#endif
/* Tokens.  */
#define PUNTOCOMA 258
#define ASTERISCO 259
#define PARENTESIS 260
#define ID 261
#define ENTERO 262
#define DECIMAL 263
#define CADENA 264
#define CALL 265
#define END 266
#define BEGING 267
#define DECLARE 268
#define PROCEDURE 269
#define CREATE 270
#define DELIMITER 271
#define SET 272
#define VARCHAR 273
#define INT 274
#define NULO 275
#define THEN 276
#define ELSE 277
#define IF 278
#define VALUES 279
#define INTO 280
#define WHERE 281
#define FROM 282
#define OR 283
#define AND 284
#define INSERT 285
#define DELETE 286
#define UPDATE 287
#define SELECT 288
#define EXIT_COMMAND 289
#define IN 290
#define OUT 291
#define INOUT 292
#define PARENTESISA 293
#define DELIMITADOR 294
#define COMILLA2 295
#define COMILLA1 296
#define ASIGNA 297
#define DIFERENTE 298
#define MAYOR_IGUAL 299
#define MENOR_IGUAL 300
#define IGUAL 301
#define MAYOR 302
#define MENOR 303
#define COMA 304
#define PARENTESISB 305
#define SUMA 306
#define RESTA 307
#define DIVISION 308




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


