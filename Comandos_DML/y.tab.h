/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

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
     NUMERO = 258,
     STRING = 259,
     ID = 260,
     SELECT = 261,
     FROM = 262,
     WHERE = 263,
     AND = 264,
     OR = 265,
     INSERT = 266,
     INTO = 267,
     VALUES = 268,
     DELETE = 269,
     UPDATE = 270,
     LIMIT = 271,
     SET = 272,
     CAMPO_TABLA = 273,
     OP_LOGICO = 274,
     OP_ARITME = 275,
     NULO = 276,
     EXIT_COMMAND = 277
   };
#endif
/* Tokens.  */
#define NUMERO 258
#define STRING 259
#define ID 260
#define SELECT 261
#define FROM 262
#define WHERE 263
#define AND 264
#define OR 265
#define INSERT 266
#define INTO 267
#define VALUES 268
#define DELETE 269
#define UPDATE 270
#define LIMIT 271
#define SET 272
#define CAMPO_TABLA 273
#define OP_LOGICO 274
#define OP_ARITME 275
#define NULO 276
#define EXIT_COMMAND 277




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

