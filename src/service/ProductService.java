package service;

import java.util.List;

import dao.ProductDAO;
import model.Product;

public class ProductService {
	
	private ProductDAO productDAO;
	
	public ProductService() {
		productDAO = new ProductDAO();
	}

	public List<Product> listProducts() {
		return productDAO.findAllProductData();
	}
	
	public List<Product> listProductsByCategory(int category){
		return productDAO.findAllProductDataByCategory(category);
	}
	
	public Product findProductById(int id) {
		return productDAO.findProductById(id);
	}
	
	public boolean removeProductById(int id) {
		return productDAO.removeProductById(id);
	}
	
	public boolean insertProduct(Product product) {
		return productDAO.insertProduct(product);
	}
	
	public boolean updateProduct(Product product) {
		return productDAO.updateProduct(product);
	}
	
	public String findCayegoryById(int id) {
		return productDAO.findCategoryById(id);
	}
}
