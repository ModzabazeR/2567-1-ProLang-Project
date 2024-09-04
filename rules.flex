import java.util.*;

%%

%public
%class Lexer
%standalone

%unicode

%{
	List<String> symbolTable = new ArrayList<>();
%}

Operators = \d
Parentheses = \d
Semicolon = \d
Keywords = \d
Integers = \d
Identifiers = \d
Strings = \d
Comments = \d

%%

{Operators} { System.out.print("operator: " + yytext()); }