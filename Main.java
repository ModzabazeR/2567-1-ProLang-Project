import java.io.Reader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class Main {
	public static void main(String[] args) {
		try {
			FileInputStream stream = new FileInputStream("input.txt");
			Reader reader = new java.io.InputStreamReader(stream);
			Lexer lexer = new Lexer(reader);

			while (!lexer.yyatEOF()) {
				lexer.yylex();
			}

		} catch (FileNotFoundException e) {
			System.out.println("An error occurred.");
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}