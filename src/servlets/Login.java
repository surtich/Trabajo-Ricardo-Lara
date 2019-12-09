package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cliente;
import service.BCryptService;
import service.ClienteService;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ClienteService clienteService;
	private BCryptService bCryptService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		
		String strNif = request.getParameter("nif");
		String strPass = request.getParameter("pass");
		if((strNif != null && !strNif.equals("")) && (strPass != null && !strPass.equals(""))) {
			
			Cliente cliente = clienteService.findByNif(strNif);
			String hashPassword = clienteService.findPassByNif(strNif);	
			
			if(cliente != null && bCryptService.verifyHash(strPass, hashPassword)) {
				HttpSession session = request.getSession();
				session.setAttribute("nif", strNif);
				boolean isAdmin = cliente.isAdmin();
				
				if(isAdmin) {
					response.sendRedirect("admin/admin.jsp");
				}else {
					response.sendRedirect("tienda.html");
				}
				
			}else {
				request.setAttribute("error", "Usuario o cotraseña incorrectos");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
				dispatcher.forward(request, response);
			}
			
		}else {
			request.setAttribute("error", "Rellene los campos del cliente");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
			dispatcher.forward(request, response);
		}
	}

}
