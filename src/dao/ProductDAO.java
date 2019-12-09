package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import Classes.Connect;
import model.Product;

public class ProductDAO {
	
	public ArrayList<Product> findAllProductData() {
		ArrayList<Product> products = new ArrayList<Product>();
		Connection conn = Connect.connectAsAdmin();
		
		try {
			Statement statement = conn.createStatement();
					
			ResultSet resultSet = statement.executeQuery("SELECT * FROM productos");
			while (resultSet.next()) {
				Product product = new Product();
				product.setId(resultSet.getInt("id"));
				product.setName(resultSet.getString("nombre"));
				product.setOffer(resultSet.getString("oferta"));
				product.setPrice(resultSet.getFloat("precio"));
				product.setCategory(resultSet.getInt("categoria"));
				product.setStock(resultSet.getInt("stock"));
				product.setImg(resultSet.getString("imagen"));
				
				products.add(product);
				
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return products;
	}
	
	public ArrayList<Product> findAllProductDataByCategory(int category) {
		ArrayList<Product> products = new ArrayList<Product>();
		Connection conn = Connect.connectAsAdmin();
		
		try {
			
			PreparedStatement statement = conn.prepareStatement("SELECT * FROM productos WHERE categoria = ?");
			statement.setInt(1, category);
			ResultSet resultSet = statement.executeQuery();
			
			
			while (resultSet.next()) {
				Product product = new Product();
				product.setId(resultSet.getInt("id"));
				product.setName(resultSet.getString("nombre"));
				product.setOffer(resultSet.getString("oferta"));
				product.setPrice(resultSet.getFloat("precio"));
				product.setCategory(resultSet.getInt("categoria"));
				product.setStock(resultSet.getInt("stock"));
				product.setImg(resultSet.getString("imagen"));
				
				products.add(product);
				
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return products;
	}
	
	public String findCategoryById(int id) {
		String category = null;
		Connection conn = null;
		PreparedStatement query = null;
		try {
			conn = Connect.connectAsAdmin();
			query = conn.prepareStatement("SELECT categoria FROM categorias WHERE id = ?");
			query.setInt(1, id);
			ResultSet resultSet = query.executeQuery();
			if(resultSet.next()) {
				category=resultSet.getString("categoria");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
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
		return category;
		
	}
	
	public Product findProductById(int id) {
		Product product = new Product();
		Connection conn = null;
		PreparedStatement statement = null;
		
		try {
			conn = Connect.connectAsAdmin();
			statement = conn.prepareStatement("SELECT * FROM productos WHERE id = ?");
			statement.setInt(1, id);
			ResultSet resultSet = statement.executeQuery();
			
			if(resultSet.next()) {
				product.getId();
				product.getName();
				product.getOffer();
				product.getPrice();
				product.getCategory();
				product.getStock();
				product.getImg();
			}
			
		}catch(SQLException e) {
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
		
		return product;
	}
	
	public boolean removeProductById(int id) {
		boolean delete = false;
		Connection conn = null;
		PreparedStatement statement = null;
		
		try {
			conn = Connect.connectAsAdmin();
			statement = conn.prepareStatement("DELETE FROM productos WHERE id = ?");
			statement.setInt(1, id);
			
			
			if(statement.executeUpdate() == 1) {
				delete = true;
			}
		}catch(SQLException e) {
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
		
		return delete;
	}
	
	public boolean insertProduct(Product product) {
		boolean insert = false;
		Connection conn = null;
		PreparedStatement statement = null;
		
		try {
			conn = Connect.connectAsAdmin();
			statement = conn.prepareStatement("INSERT INTO productos (nombre, oferta, precio, categoria, stock, imagen) VALUES (?,?,?,?,?,?)");
			statement.setString(1, product.getName());
			statement.setString(2, product.getOffer());
			statement.setFloat(3, product.getPrice());
			statement.setInt(4, product.getCategory());
			statement.setInt(5, product.getStock());
			statement.setString(6, product.getImg());
			
			if(statement.executeUpdate() == 1) {
				insert = true;
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
		
		return insert;
	}
	
	public boolean updateProduct(Product product) {
		boolean success = false;
		Connection conn = null;
		PreparedStatement statement = null;
		
		try {
			conn = Connect.connectAsAdmin();
			statement = conn.prepareStatement("UPDATE productos SET nombre = ?, oferta = ?, precio = ?, categoria = ?, stock = ?, imagen = ? WHERE id = ?");
			statement.setString(1, product.getName());
			statement.setString(2, product.getOffer());
			statement.setFloat(3, product.getPrice());
			statement.setInt(4, product.getCategory());
			statement.setInt(5, product.getStock());
			statement.setString(6, product.getImg());
			statement.setInt(7, product.getId());
			
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
