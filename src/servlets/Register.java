package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cliente;
import service.BCryptService;
import service.ClienteService;

/**
 * Servlet implementation class Registro
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ClienteService clienteService;
	private BCryptService bCryptService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        clienteService = new ClienteService(); 
        bCryptService = new BCryptService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String nif = request.getParameter("nif");
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		int telephone = Integer.parseInt(request.getParameter("telephone"));
		
		if(!nif.equals("") && !name.equals("") && !pass.equals("") && !email.equals("")) {
			String hashPass = bCryptService.createHash(pass);
			Cliente cliente = new Cliente();
			
			cliente.setNif(nif);
			cliente.setName(name);
			cliente.setPassword(hashPass);
			cliente.setAddress(address);
			cliente.setEmail(email);
			cliente.setTelephone(telephone);
			
			clienteService.insertClienteBD(cliente);
			response.sendRedirect("./admin/admin.jsp");
		}else {
			request.setAttribute("error", "Rellene los campos del cliente");
			RequestDispatcher dispatcher = null;
			if(request.getParameter("admin") != "1" ) {
				dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
			}else {
				dispatcher = getServletContext().getRequestDispatcher("/admin/admin.jsp");
			}
			dispatcher.forward(request, response);
		}
		
	}

}
