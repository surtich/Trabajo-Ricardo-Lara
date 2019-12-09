package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Classes.Connect;
import model.Cliente;

public class ClienteDAO {

	public Cliente numClienteByNif(String nif) {
		Cliente cliente = null;
		Connection conn = null;
		PreparedStatement query = null;
		try {
			conn = Connect.connectAsAdmin();
			query = conn.prepareStatement("SELECT * FROM clientes WHERE nif = ?");
			query.setString(1, nif);
			ResultSet resultSet = query.executeQuery();
			
			if (resultSet.next()) {
				cliente = new Cliente();
				cliente.setNif(resultSet.getString("nif"));
				cliente.setName(resultSet.getString("nombre"));
				cliente.setEmail(resultSet.getString("email"));
				cliente.setTelephone(resultSet.getInt("telefono"));
				cliente.setPassword(resultSet.getString("password"));
				cliente.setAdmin(resultSet.getBoolean("admin"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (query != null) {
					query.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return cliente;
	}

	public List<Cliente> findAllClienteData() {
		List<Cliente> clientes = new ArrayList<Cliente>();
		Connection conn = null;
		Statement statement = null;

		try {
			conn = Connect.connectAsAdmin();
			statement = conn.createStatement();

			ResultSet resultSet = statement.executeQuery("SELECT * FROM clientes");
			while (resultSet.next()) {
				Cliente cliente = new Cliente();
				cliente.setNif(resultSet.getString("nif"));
				cliente.setName(resultSet.getString("nombre"));
				cliente.setAddress(resultSet.getString("direccion"));
				cliente.setEmail(resultSet.getString("email"));
				cliente.setTelephone(resultSet.getInt("telefono"));
				cliente.setPassword(resultSet.getString("password"));

				clientes.add(cliente);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(statement != null) {
					statement.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return clientes;
	}

	public String passClienteByNif(String nif) {
		String hashPassword = "";
		Connection conn = null;
		PreparedStatement query = null;

		try {
			conn = Connect.connectAsAdmin();
			query = conn.prepareStatement("SELECT password from clientes WHERE nif = ?");
			query.setString(1, nif);
			ResultSet resultSet = query.executeQuery();
			while (resultSet.next()) {
				hashPassword = resultSet.getString("password");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(query != null) {
					query.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return hashPassword;
	}

	public boolean insertNewCliente(Cliente cliente) {

		String nif = cliente.getNif();
		String name = cliente.getName();
		String pass = cliente.getPassword();
		String address = cliente.getAddress();
		String email = cliente.getEmail();
		long telephone = cliente.getTelephone();
		boolean success = false;

		Connection conn = null;
		PreparedStatement query = null;

		try {
			conn = Connect.connectAsAdmin();
			query = conn.prepareStatement(
					"INSERT INTO clientes (nif, nombre, direccion, email, telefono, password) VALUES (?,?,?,?,?,?)");
			query.setString(1, nif);
			query.setString(2, name);
			query.setString(3, address);
			query.setString(4, email);
			query.setLong(5, telephone);
			query.setString(6, pass);

			if (query.executeUpdate() == 1) {
				success = true;
			}
			// query.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(query != null) {
					query.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return success;
	}
	
	public boolean delClientByNif(String nif) {
		boolean success = false;
		Connection conn = null;
		PreparedStatement statement = null;
		
		try {
			conn = Connect.connectAsAdmin();
			statement = conn.prepareStatement("DELETE FROM clientes WHERE nif = ?");
			statement.setString(1, nif);
			
			if(statement.executeUpdate() == 1) {
				success = true;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			try {
				if(statement != null) {
					statement.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return success;
	}

	public boolean updateClient(Cliente client) {
		boolean success = false;
		Connection conn = null;
		PreparedStatement statement = null;
		
		try {
			conn = Connect.connectAsAdmin();
			statement = conn.prepareStatement("UPDATE clientes SET nombre = ?, direccion = ?, email = ?, email = ?, telefono = ?, password = ? WHERE nif = ?");
			statement.setString(1, client.getName());
			statement.setString(2, client.getAddress());
			statement.setString(3, client.getEmail());
			statement.setInt(4, client.getTelephone());
			statement.setString(5, client.getPassword());
			statement.setString(6, client.getNif());
			
			
			if(statement.executeUpdate() == 1) {
				success = true;
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			try {
				if (statement != null) {
					statement.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return success;
	}

}
