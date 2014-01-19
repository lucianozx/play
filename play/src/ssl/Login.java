package ssl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import db.ServerDB;

import java.io.BufferedReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import lib.SendEmail;
import lib.SystemLogException;
import lib.User;
import lib.UserSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/ssl/login")
public class Login extends HttpServlet
{
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#HttpServlet()
    */
   public Login()
   {
      super();
      // TODO Auto-generated constructor stub
   }

   private String httpsURL(String origURL)
   {
      int index = origURL.indexOf(":");
      StringBuffer newURL = new StringBuffer(origURL);
      newURL.insert(index, 's');
      return (newURL.toString());
   }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
   {
      doPost(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
   {

      String email = StringUtils.trimToNull(request.getParameter("email"));
      String senha = StringUtils.trimToNull(request.getParameter("senha"));

      String url = "http://" + request.getServerName() + request.getContextPath() + "/";

      if ((email == null) || (senha == null))
      {
	 request.getRequestDispatcher("/ssl/login.jsp").forward(request, response);
	 // response.sendRedirect(url + "ssl/login.jsp");
	 return;
      }

      UserSession user = new UserSession();

      if (UserValidation(email, senha, user))
      {
	 if (user.user.verified.equals("S"))
	 {
	    HttpSession session = request.getSession(true);
	    session = request.getSession(true);
	    session.setMaxInactiveInterval(600);
	    session.setAttribute(session.getId(), session.getId());
	    // session.setAttribute("param", "ok");
	    session.setAttribute("user", user);

	    try
	    {
	       System.out.println("Session.user.systemAdmin: " + (((UserSession) session.getAttribute("user")).systemAdmin ? "true" : "false"));
	    } catch (Exception e)
	    {

	    }

	    try
	    {
	       System.out.println("Session.user.systemAdmin: " + (((UserSession) session.getAttribute("user")).systemAdmin ? "true" : "false"));
	    } catch (Exception e)
	    {

	    }

	    response.sendRedirect(url);
	 }
	 else if (user.user.verified.equals("N"))
	 {
	    HttpSession session = request.getSession(true);
	    session.invalidate();

	    session = request.getSession(true);
	    request.setAttribute("email", email);
	    request.getRequestDispatcher("/email/login_unverified.jsp").forward(request, response);
	 }
      }
      else
      {
	 HttpSession session = request.getSession(true);
	 session.invalidate();
	 session = request.getSession(true);
	 session.setAttribute("email", email);
	 session.setAttribute("erro", "true");
	 // response.sendRedirect(url + "ssl/login.jsp");

	 // request.setAttribute("erro", "true");
	 request.getRequestDispatcher("login.jsp").forward(request, response);
      }

      /*
       * if (StringUtils.equalsIgnoreCase(email, "administrador") &&
       * StringUtils.equalsIgnoreCase(senha, "a123")) { HttpSession session =
       * request.getSession(true); // if (session.isNew()) // {
       * session.setMaxInactiveInterval(108000);
       * session.setAttribute(session.getId(), session.getId());
       * session.setAttribute("param", "ok"); session.setAttribute("nome",
       * "administrador"); // }
       * 
       * // String url = //
       * request.getRequestURL().toString().replaceFirst("https:", //
       * "http:").replaceFirst(":8443", "").replaceFirst("/ssl/Login", //
       * "/Index"); // request.getRequestDispatcher(url).forward(request,
       * response);
       * 
       * response.sendRedirect(url);
       * 
       * } else {
       * 
       * }
       */
   }

   private boolean UserValidation(String email, String senha, UserSession user)
   {

      System.out.println("//");
      System.out.println("// getClassName(): " + Thread.currentThread().getStackTrace()[0].getClassName());
      System.out.println("// getMethodName(): " + Thread.currentThread().getStackTrace()[0].getMethodName());
      System.out.println("// getFileName(): " + Thread.currentThread().getStackTrace()[0].getFileName());
      System.out.println("// getLineNumber(): " + Thread.currentThread().getStackTrace()[0].getLineNumber());
      System.out.println("//");
      System.out.println("// getClassName(): " + Thread.currentThread().getStackTrace()[1].getClassName());
      System.out.println("// getMethodName(): " + Thread.currentThread().getStackTrace()[1].getMethodName());
      System.out.println("// getFileName(): " + Thread.currentThread().getStackTrace()[1].getFileName());
      System.out.println("// getLineNumber(): " + Thread.currentThread().getStackTrace()[1].getLineNumber());
      System.out.println("//");

      Connection conn = db.ServerDB.getConnection();
      if (conn == null)
      {
	 System.out.println("// " + this.toString() + ": getConnection() error");
	 return false;
      }

      try
      {

	 PreparedStatement stmtAdmin = null;
	 ResultSet snapAdmin = null;
	 try
	 {
	    stmtAdmin = conn.prepareStatement("select nome from administrator where email = ? and senha = ?");
	    stmtAdmin.setString(1, email);
	    stmtAdmin.setString(2, senha);

	    snapAdmin = stmtAdmin.executeQuery();
	    if (snapAdmin.next())
	    {
	       user.userSession = true;
	       user.systemAdmin = true;
	       user.user.nome = snapAdmin.getString(1);
	       user.user.verified = "S";
	    }
	 } catch (Exception e)
	 {
	    SystemLogException.Print(e);
	 } finally
	 {
	    ServerDB.DisposeResource(snapAdmin);
	    ServerDB.DisposeResource(stmtAdmin);
	 }

	 if (!user.userSession)
	 {

	    PreparedStatement stmtUser = null;
	    ResultSet snapUser = null;
	    StringBuilder sql = new StringBuilder();

	    try
	    {

	       // @formatter:off

		    sql.append("select nome," + " sobrenome," + " email,"
			    + " senha," + " endereco," + " city," + " country,"
			    + " formacao," + " especialidade," + " genero,"
			    + " data," + " cpf," + " rg," + " texto,"
			    + " info," + " infoParceiros," + " verified"
			    + " from users" + " where email = ?"
			    + " and senha = ?");

		    // @formatter:on

	       stmtUser = conn.prepareStatement(sql.toString());
	       stmtUser.setString(1, email);
	       stmtUser.setString(2, senha);

	       snapUser = stmtUser.executeQuery();
	       if (snapUser.next())
	       {

		  user.userSession = true;
		  user.systemAdmin = false;

		  user.user.verified = snapUser.getString(17);

		  if (user.user.verified.equals("S"))
		  {

		     user.user.nome = snapUser.getString(1);
		     user.user.sobrenome = snapUser.getString(2);
		     user.user.email = snapUser.getString(3);
		     user.user.senha = snapUser.getString(4);
		     user.user.endereco = snapUser.getString(5);
		     user.user.city = snapUser.getString(6);
		     user.user.country = snapUser.getString(7);
		     user.user.formacao = snapUser.getString(8);
		     user.user.especialidade = snapUser.getString(9);
		     user.user.genero = snapUser.getString(10);
		     user.user.data = snapUser.getString(11);
		     user.user.cpf = snapUser.getString(12);
		     user.user.rg = snapUser.getString(13);
		     user.user.texto = snapUser.getString(14);
		     user.user.info = snapUser.getString(15);
		     user.user.infoParceiros = snapUser.getString(16);

		  }
	       }
	    } catch (Exception e)
	    {

	       SystemLogException.Print(e);

	    } finally
	    {

	       ServerDB.DisposeResource(snapUser);
	       ServerDB.DisposeResource(stmtUser);
	    }
	 }

      } catch (Exception e)
      {

	 SystemLogException.Print(e);

      } finally
      {

      }

      ServerDB.DisposeResource(conn);

      return user.userSession;
   }
}
