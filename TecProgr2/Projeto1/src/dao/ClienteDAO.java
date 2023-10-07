package dao;

import com.mysql.cj.jdbc.PreparedStatementWrapper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Cliente;
import projeto1.ConnectionFactory;

public class ClienteDAO {
    
    private Connection c;
    
    public ClienteDAO() {
        c = new ConnectionFactory().GetConnection();
    }
    
    public void create(Cliente cliente) {
        String query = "insert into cliente values (default,?,?)";
        try {
            PreparedStatement stmt = c.prepareStatement(query);
            stmt.setString(1, cliente.getNome());
            stmt.setInt(2, cliente.getIdade());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public void update(Cliente cliente) {
        String query = "update cliente set nome=?, idade=? where id=?";
        try {
            PreparedStatement stmt = c.prepareStatement(query);
            stmt.setString(1, cliente.getNome());
            stmt.setInt(2, cliente.getIdade());
            stmt.setInt(3, cliente.getId());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public void delete(int id) {
        String query = "delete from cliente where id=" + id;
        try {
            PreparedStatement stmt = c.prepareStatement(query);
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public List<Cliente> get(String where) {
        String query = "select * from cliente " + where;
        try {
            List<Cliente> clientes = new ArrayList<Cliente>();
            PreparedStatement stmt = c.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setId(rs.getInt("id"));
                cliente.setIdade(rs.getInt("idade"));
                cliente.setNome(rs.getString("nome"));
            }
            rs.close();
            stmt.close();
            return clientes;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
