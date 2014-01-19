package ssl;

import java.awt.datatransfer.StringSelection;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import sun.awt.image.ImageWatched.Link;

import com.mysql.jdbc.Statement;
import com.sun.crypto.provider.AESCipher;

/**
 * Servlet implementation class VerifyEmail
 */
@WebServlet("/verifyemail")

public class VerifyEmail extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VerifyEmail() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String pLink = StringUtils.trimToNull(request.getParameter("link"));

		StringBuilder pUserID = new StringBuilder();
		
		request.setAttribute("link", pLink);
		
		if (DisposeLink(pLink, pUserID)) {
			
			StringBuilder nome = new StringBuilder(), email = new StringBuilder();
			if (Verifica(pUserID.toString(), nome, email).equals("S")) {
		
				HttpSession session = request.getSession(true);
				session.setAttribute("email", email.toString());
				session.setAttribute("email_ok", true);
				response.sendRedirect("ssl/login.jsp");
				
			} else {
				
				request.getRequestDispatcher("email/fail.jsp").forward(request, response);
				
			}
			
			//String url = request.getRequestURL().toString().replaceFirst("https:", "http:").replaceFirst(":8443", "").replaceFirst("/ssl/Login", "/Index");
			//request.getRequestDispatcher(url).forward(request, response);
			//response.sendRedirect("./email_ok.jsp");
		}
		else {
			//response.sendRedirect("./email_error.jsp");
			request.getRequestDispatcher("email/fail.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	private boolean DisposeLink(String pLink, StringBuilder pUserID)
	{
		if ((pLink.length() % 2) == 1) return false;
		
		/*
		StringBuilder trailler = new StringBuilder();
		
		String temp = new String(new char[10]).replace("\0", "0") + pUserID;
		String userID = temp.substring(temp.length() - 10, temp.length());
		
		temp = new String(new char[10]).replace("\0", "0") + pLinkID;
		String linkID = temp.substring(temp.length() - 10, temp.length());

		Random randomGenerator = new Random();
	   for (int cont = 1; cont <= 30; cont++) trailler.append(String.format("%02X", randomGenerator.nextInt(100)));
	   
	   trailler.append(userID);
	   trailler.append(linkID);
		*/
		
   	DESKeySpec keySpec = null;
   	SecretKeyFactory keyFactory = null;
   	SecretKey aesKey = null;
   	Cipher aesCipher = null;
   	
      try {
      	
      	keySpec = new DESKeySpec("12345678".getBytes("UTF8"));
      	keyFactory = SecretKeyFactory.getInstance("DES");
      	aesKey = keyFactory.generateSecret(keySpec);
	      aesCipher = Cipher.getInstance("DES");
	      
      	/*
	      byte[] bytes = trailler.toString().getBytes();
	      
	      aesCipher.init(Cipher.ENCRYPT_MODE, aesKey);
	      byte[] encripted = aesCipher.doFinal(bytes);
	      
	      for (byte b : encripted) link.append(String.format("%02X", b));
	   	*/
      	
      	byte[] encripted = new byte[(int) (pLink.length() / 2)];
      	for (int cont = 0; cont < (int) (pLink.length() / 2); cont++) encripted[cont] = Integer.decode("0x" + pLink.substring(cont * 2, (cont * 2) + 2)).byteValue();
      	
	      aesCipher.init(Cipher.DECRYPT_MODE, aesKey);
	      byte[] decripted = aesCipher.doFinal(encripted);
	      String temp = new String(decripted, "UTF8");
	      
	      pUserID.append(temp.substring(temp.length() - 10, temp.length()));
	      
      } catch (InvalidKeyException | UnsupportedEncodingException | NoSuchAlgorithmException | InvalidKeySpecException | NoSuchPaddingException | IllegalBlockSizeException | BadPaddingException error) {
	      error.printStackTrace();
      } catch (Exception e) {
	      e.printStackTrace();
      } finally {
      	aesCipher = null;
      	aesKey = null;
      	keyFactory = null;
      	keySpec = null;
      }
      
      //System.out.println(text1);
      //System.out.println(text2);
      //System.out.println(textEncript);
      
      /*
	   SecretKey aesKey = keygen.generateKey();
	   
	   Cipher aesCipher = null;
	   try {
	      aesCipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
	      
	      aesCipher.init(Cipher.ENCRYPT_MODE, aesKey);
	      byte[] cleartext = "This is just an example".getBytes();   
	      byte[] ciphertext = aesCipher.doFinal(cleartext);
	      
	      aesCipher.init(Cipher.DECRYPT_MODE, aesKey);
	      byte[] cleartext1 = aesCipher.doFinal(ciphertext);
	      
      } catch (NoSuchAlgorithmException | NoSuchPaddingException | InvalidKeyException | IllegalBlockSizeException | BadPaddingException e) {
	      e.printStackTrace();
      }
	   aesCipher = null;
	   */
      
	   return true;
	}

	private String Verifica(String pUserID, StringBuilder nome, StringBuilder email) {
		
		Connection conn = db.ServerDB.getConnection();
		if (conn == null) {
			System.out.println("// VerifyEmail: getConnection() error");
			return "";
		}

		PreparedStatement stmt = null;
		ResultSet snapUser = null;
		
		String status = "";
		
		try {
			
			stmt = conn.prepareStatement("select nome, sobrenome, email, verified from users where users.id = ?");
			stmt.setString(1, pUserID);
			
			snapUser = stmt.executeQuery();
			if (snapUser.next()) {
				nome.append(snapUser.getString(1) + " " + snapUser.getString(2));
				email.append(snapUser.getString(3));
				status = snapUser.getString(4);
			}				
			
			if (status.equals("N")) {
				
				stmt.close();
				stmt = conn.prepareStatement("update users set verified = 'S' where id = ?");
				stmt.setString(1, pUserID);
				stmt.executeUpdate();
				
				status = "S";
			}

		} catch (Exception e) {

			System.out.println("// VerifyEmail");
			System.out.println("//");
			System.out.println("// " + e.getMessage());
			System.out.println("// StackTrace:");
			e.printStackTrace();

		} finally {
			
			if (snapUser != null) {
				try {
					snapUser.close();
				} catch (SQLException sqlex) {
					// ignore -- as we can't do anything about it here
				}
				snapUser = null;
			}
			
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException sqlex) {
					// ignore -- as we can't do anything about it here
				}
				stmt = null;
			}
		}

		try {
			conn.setAutoCommit(true);
			conn.close();
		} catch (SQLException sqlex) {
			// ignore -- as we can't do anything about it here
		}
		conn = null;

		return status;
	}
}
