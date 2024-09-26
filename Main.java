// import java.io.Reader;
// import java.io.FileInputStream;
// import java.io.FileNotFoundException;
// import java.io.IOException;

// public class Main {
// 	public static void main(String[] args) {
// 		try {
// 			FileInputStream stream = new FileInputStream("input.txt");
// 			Reader reader = new java.io.InputStreamReader(stream);
// 			Lexer lexer = new Lexer(reader);

// 			while (!lexer.yyatEOF()) {
// 				lexer.yylex();
// 			}

// 		} catch (FileNotFoundException e) {
// 			System.out.println("An error occurred.");
// 			e.printStackTrace();
// 		} catch (IOException e) {
// 			e.printStackTrace();
// 		}
// 	}
// }

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {


        try {
            FileReader reader = new FileReader("./input.txt");
            Lex lexer = new Lex(reader);

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