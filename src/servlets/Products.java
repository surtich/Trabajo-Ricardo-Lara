package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.Product;
import service.ProductService;


/**
 * Servlet implementation class Products
 */
@WebServlet("/product/listar.do")
public class Products extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Products() {
        super();
        // TODO Auto-generated constructor stub
        productService = new ProductService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("category") != null) {
			int category = Integer.parseInt(request.getParameter("category"));
			List<Product> lstProducts = productService.listProductsByCategory(category);
			String json = new Gson().toJson(lstProducts);
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().write(json);
			
		}else if (request.getParameter("id") != null) {
			int id = Integer.parseInt(request.getParameter("id"));
			if(!productService.removeProductById(id)) {
				request.setAttribute("error", "ERROR: El producto no ha sido borrado.");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin.jsp");
				dispatcher.forward(request, response);
			}
		}else {
			List<Product> lstProducts = productService.listProducts();
			String json = new Gson().toJson(lstProducts);
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().write(json);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
