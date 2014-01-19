

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Session
 */
@WebServlet("/Session")
public class Session extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Session() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String username = request.getParameter("Username");
		String password = request.getParameter("Password");

		if (username.equals("admin") && password.equals("123"))
		{
			HttpSession userSession = request.getSession(true);
			if (userSession.isNew())
			{
				userSession.setMaxInactiveInterval(30);
				userSession.setAttribute(userSession.getId(), userSession.getId());
			}
			request.setAttribute("msg", "Usuário/Senha Inválidos");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("msg", "Usuário/Senha Inválidos");
			request.getRequestDispatcher("/ssl/login.jsp").forward(request, response);
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
