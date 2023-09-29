
package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conn {
    public Connection conectar() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://localhost/clinica?"
                    + "useTimezone=true&serverTimezone=UTC&user=root&password=root");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
