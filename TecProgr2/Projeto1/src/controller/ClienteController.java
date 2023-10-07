package controller;

import dao.ClienteDAO;
import java.util.List;
import model.Cliente;

public class ClienteController {
    
    private ClienteDAO clienteDao;
    public ClienteController(){
        clienteDao = new ClienteDAO();
    }

    public void create(String nome, int idade) {
        Cliente cliente = new Cliente();
        cliente.setNome(nome);
        cliente.setIdade(idade);
        clienteDao.create(cliente);
    }
    public void update(Cliente cliente){
        clienteDao.update(cliente);
    }
    public void delete(int id){
        clienteDao.delete(id);
    }
    public List<Cliente> get(int id){
        return clienteDao.get("");
    }
}
