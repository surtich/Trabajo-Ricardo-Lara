package service;

import java.util.List;

import dao.ClienteDAO;
import model.Cliente;
import model.Product;

public class ClienteService {
	
	private ClienteDAO clienteDAO;
	
	public ClienteService() {
		clienteDAO = new ClienteDAO();
	}

	public Cliente findByNif(String nif) {
		return clienteDAO.numClienteByNif(nif);
	}
	
	public String findPassByNif(String nif) {
		return clienteDAO.passClienteByNif(nif);
	}
	
	public boolean insertClienteBD(Cliente cliente) {
		return clienteDAO.insertNewCliente(cliente);
	}
	
	public boolean removeClientByNif(String nif) {
		return clienteDAO.delClientByNif(nif);
	}
	
	public boolean updateClient(Cliente client) {
		return clienteDAO.updateClient(client);
	}
	
	public List<Cliente> listCliente() {
		return clienteDAO.findAllClienteData();
	}
}
