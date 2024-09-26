import java.util.*;

%%

%public
%class Lex
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
NewLine = [\n\r\s]+
	
%%

{Operators} { System.out.println("operator: " + yytext()); }
{Parentheses} { System.out.println("parenthesis: " + yytext()); }
{Semicolon} { System.out.println("semicolon: " + yytext()); }
{Keywords} { System.out.println("keyword: " + yytext()); }
{Integers} { System.out.println("integer: " + yytext()); }
{Strings} { System.out.println("string: " + yytext()); }
{Identifiers} {
		System.out.println("identifier: " + yytext()); 
		if (!symbolTable.contains(yytext())) {
			System.out.println("add: " +yytext());
			symbolTable.add(yytext());
		} else {
			System.out.println("Not add");
		}	 
	}
{Comments} { System.out.println("comment: " + yytext()); }
{NewLine} {continue;}