import java.util.*;

%%

%public
%class Lexer
%standalone

%unicode

%{
	List<String> symbolTable = new ArrayList<>();
%}

Operators = (\+|-|\*|\/|=|>|>=|<|<=|==|\+{2}|--)
Parentheses = [()]
Semicolon = ;
Keywords = (if|then|else|endif|while|do|endwhile|print|newline|read)
Integers = 0 | [1-9][0-9]*
Identifiers = [a-zA-Z][a-zA-Z0-9]*
Strings = \".*\"
Comments = {MultilineComments}|{EndOfLineComments}
MultilineComments = \/\*.*\*\/
EndOfLineComments = [/]{2}.*
	
%%

{Operators} { System.out.print("operator: " + yytext()); }
{Parentheses} { System.out.print("parenthesis: " + yytext()); }
{Semicolon} { System.out.print("semicolon: " + yytext()); }
{Keywords} { System.out.print("keyword: " + yytext()); }
{Integers} { System.out.print("integer: " + yytext()); }
{Strings} { System.out.print("string: " + yytext()); }
{Identifiers} { System.out.print("identifier: " + yytext()); }
{Comments} { System.out.print("comment: " + yytext()); }
