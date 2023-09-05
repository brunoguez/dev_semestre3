package config;

import java.sql.*;

public class Conn {

    public Connection conectar() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://localhost/dbusuario?"
                    + "useTimezone=true&serverTimezone=UTC&user=root&password=root");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
