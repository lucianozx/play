package ssl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lib.SendEmail;
import lib.SystemLogException;

import org.apache.commons.lang3.StringUtils;

import db.ServerDB;

/**
 * Servlet implementation class SendPassword
 */
@WebServlet("/ssl/sendPassword")

public class SendPassword extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SendPassword() {
		super();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = StringUtils.trimToNull(request.getParameter("email"));
		if (email == null) 
		{
			response.sendRedirect("/ssl/password.jsp");
			return;
		}
		
		String url = "http://" + request.getServerName() + request.getContextPath() + "/";
		
		String status = Read(email);
		if (status.equals("S"))	{
			
			SendEmail send = new SendEmail();
			send.sendEmailPassword(url, email);
			send = null;
			
		} else if (status.equals("N")) {
			
			response.sendRedirect(url + "email/unverified.jsp");
		}
	}
	
	private String Read(String email) {
		
		Connection conn = db.ServerDB.getConnection();
		if (conn == null) {
			System.out.println("// VerifyEmail: getConnection() error");
			return "";
		}

		PreparedStatement stmt = null;
		ResultSet snapUser = null;
		
		String status = "";
		
		try {

			stmt = conn.prepareStatement("select users.verified from users where email = ?");
			stmt.setString(1, email);
			
			snapUser = stmt.executeQuery();
			if (snapUser.next()) status = snapUser.getString(1);
			
		} catch (Exception e) {
			
			SystemLogException.Print(e);
			
		} finally {
			
			ServerDB.DisposeResource(snapUser);
			ServerDB.DisposeResource(stmt);
		}

		ServerDB.DisposeResource(conn);

		return status;
	}
}
