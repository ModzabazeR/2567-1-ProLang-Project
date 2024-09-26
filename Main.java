import java.io.FileReader;

public class Main {
    public static void main(String[] args) {
        try {
            FileReader reader = new FileReader("./input.txt");
            Lexer lexer = new Lexer(reader);

            while(!lexer.yyatEOF()) {
                lexer.yylex();
            }
            System.err.println(lexer.symbolTable);

            lexer.yyclose();

        } catch(Exception e) {
            System.out.println(e);
        }
    }
}