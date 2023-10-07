package projeto1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

    public Connection GetConnection() {
        System.out.println("Conectando ao Banco de dados");
        try {
            return DriverManager.getConnection("jdbc:mysql//localhost/projeto1", "root", "root");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
