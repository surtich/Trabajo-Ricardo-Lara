package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.Cliente;
import service.ClienteService;

/**
 * Servlet implementation class Clientes
 */
@WebServlet("/client/listar.do")
public class Clientes extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ClienteService clienteService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Clientes() {
        super();
        clienteService = new ClienteService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("nif") != null) {
			String nif = request.getParameter("nif");
			if(!clienteService.removeClientByNif(nif)) {
				request.setAttribute("error", "ERROR: El producto no ha sido borrado.");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin.jsp");
				dispatcher.forward(request, response);
			}
		}else {
			List<Cliente> lstClient = clienteService.listCliente();
			String json = new Gson().toJson(lstClient);
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().write(json);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
