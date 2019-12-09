package servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.core.ApplicationPart;

import model.Product;
import service.ProductService;

/**
 * Servlet implementation class AltaProducto
 */
@WebServlet("/admin/AltaProducto")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class AltaProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productService;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AltaProducto() {
		super();
		productService = new ProductService();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext context = request.getServletContext();
		String strName = request.getParameter("name");
		String strOffer = request.getParameter("offer");
		String strPrice = request.getParameter("price");
		String strStock = request.getParameter("stock");
		String strNameCategory = request.getParameter("category");
		ApplicationPart foto = (ApplicationPart) request.getPart("photo");

		

		if ((strName != null && !strName.equals("")) && !strNameCategory.equals("")) {
			int idCategory=Integer.parseInt(strNameCategory);
			String imgFolder = productService.findCayegoryById(idCategory);
			
			Product product = new Product();
			product.setName(strName);
			product.setOffer(strOffer);
			product.setCategory(idCategory);
			
			if(!strPrice.equals("") || strPrice != null) {
				float price = Float.parseFloat(strPrice);
				product.setPrice(price);
			}
			
			if(!strStock.equals("") || strStock != null) {
				int stock = Integer.parseInt(strStock);
				product.setStock(stock);
			}
			
			
			if(foto != null) {
				File uploadDir = new File(context.getRealPath("imagenes"));
				if (!uploadDir.exists()) {
					uploadDir.mkdir();
				}
				String fileName = foto.getSubmittedFileName();
	
				InputStream in = foto.getInputStream();
	
				byte[] buffer = new byte[in.available()];
				in.read(buffer);
	
				String path = context.getRealPath("imagenes/" + imgFolder +"/"+ fileName);
				File targetFile = new File(path);
				OutputStream outStream = new FileOutputStream(targetFile);
				outStream.write(buffer);
				outStream.close();
				
				product.setImg("imagenes/" + imgFolder +"/"+ fileName);
			}
			
			if(productService.insertProduct(product)) {
				response.sendRedirect("admin.jsp");
			}
		}else {
			request.setAttribute("error", "Rellene los campos obligatorios del Producto");
			RequestDispatcher dispatcher = null;
			dispatcher = getServletContext().getRequestDispatcher("/admin.jsp");
			dispatcher.forward(request, response);
		}
	}

}
