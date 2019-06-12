import java.sql.Connection;
import java.sql.DriverManager;

public class ConexaoJDBC {
	private static String driver = "org.postgresql.Driver";
	
	private static String usuarioBD = "ukqokokp";
	private static String senhaBD = "iqKBnaG1ncjKMaXx4lRgfGaW-de3hyei";
	
	
	public static Connection criarConexao() {
		final String urlConexao = "jdbc:postgresql://raja.db.elephantsql.com:5432/"  + usuarioBD;
		
		Connection conexao = null;
		
		try {
			Class.forName(driver);
			conexao = DriverManager.getConnection(urlConexao, usuarioBD, senhaBD);
			conexao.setAutoCommit(false);
			System.out.println("Conexão com o banco de dados feita com sucesso!");
			
		}catch(Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
			System.exit(0);
		}
		
		return conexao;
	}
}
