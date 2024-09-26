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
			symbolTable.add(yytext());
		} else {
			System.out.printf("identifier \"%s\" already in symbol table%n", yytext());
		}
	}
{Comments} { System.out.println("comment: " + yytext()); }
{NewLine} { continue; }

. { 
	System.out.println("Unrecognized character: " + yytext());
	System.out.println("Exiting program...");
	System.exit(1);
}