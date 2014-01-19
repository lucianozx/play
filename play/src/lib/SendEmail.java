package lib;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
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

import db.ServerDB;

public class SendEmail {

	public SendEmail() {
		// TODO Auto-generated constructor stub
	}
	
	public void sendEmailVerificationLink(String url, String email) {
		
		StringBuilder userId = new StringBuilder(), nome = new StringBuilder(), senha = new StringBuilder();
		
		if (Read(email, userId, nome, senha)) {
			
			StringBuilder link = new StringBuilder();
			CreateLink(userId.toString(), link);
		
			StringBuilder html = new StringBuilder();
			ReadFile("emailLink.html", html);

			if (html.toString().length() > 0) {

				final String var_nome_usuario = "_nome_usuario_";
				final String var_url = "_url_";
				final String var_link = "_link_";

				int index = html.lastIndexOf(var_nome_usuario);
				html.replace(index, index + var_nome_usuario.length(), nome.toString());

				index = html.lastIndexOf(var_url);
				html.replace(index, index + var_url.length(), url);
				
				index = html.lastIndexOf(var_link);
				html.replace(index, index + var_link.length(), link.toString());
			}			
			
			SendMailTLS mail = new SendMailTLS();
			//mail.SendMail(email, "7app - Verificação de email", html.toString());
			mail.SendMail(email, "Verificação de email", html.toString());
			mail = null;
		}
	}
	
	public void sendEmailPassword(String url, String email) {
		
		StringBuilder userId = new StringBuilder(), nome = new StringBuilder(), senha = new StringBuilder();
		
		if (Read(email, userId, nome, senha)) {
			
			StringBuilder pLink = new StringBuilder();
			CreateLink(userId.toString(), pLink);
			
			StringBuilder html = new StringBuilder();
			ReadFile("emailPassword.html", html);

			if (html.toString().length() > 0) {

				final String var_nome_usuario = "_nome_usuario_";
				final String var_password = "_password_";

				int index = html.lastIndexOf(var_nome_usuario);
				html.replace(index, index + var_nome_usuario.length(), nome.toString());

				index = html.lastIndexOf(var_password);
				html.replace(index, index + var_password.length(), senha.toString());
			}			
			
			SendMailTLS mail = new SendMailTLS();
			mail.SendMail(email, "Envio de senha", html.toString());
			mail = null;
		}
	}
	
	private boolean Read(String email, StringBuilder userId, StringBuilder nome, StringBuilder senha) {
		
		Connection conn = db.ServerDB.getConnection();
		if (conn == null) {
			System.out.println("// VerifyEmail: getConnection() error");
			return false;
		}

		PreparedStatement stmt = null;
		ResultSet snapUser = null;
		
		boolean status = false;
		try {
			
			stmt = conn.prepareStatement("select id, nome, senha from users where email = ?");
			stmt.setString(1, email);
			
			snapUser = stmt.executeQuery();
			if (snapUser.next()) { 
				userId.append(snapUser.getString(1));
				nome.append(snapUser.getString(2));
				senha.append(snapUser.getString(3));
				status = true;
			}
			
		} catch (Exception e) {
			
			SystemLogException.Print(e);
			
		} finally {
			
			ServerDB.DisposeResource(snapUser);
			ServerDB.DisposeResource(stmt);
		}

		ServerDB.DisposeResource(conn);

		return status;
	}
	
	public class SendMailTLS {

		public void SendMail(String email, String subject, String content) {

			final String username = "7app.webmaster@gmail.com";
			final String password = "luc12357";

			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");

			Session session = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});

			try {

				Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress(username));
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
				message.setSubject(subject);
				
				if (content.length() > 0) {
					message.setContent(content, "text/html; charset=utf-8");
				} else {
					message.setText("Não foi possível enviar o link de verificação.");
				}
				Transport.send(message);

				System.out.println("Done");

			} catch (MessagingException e) {
				throw new RuntimeException(e);
			}
		}
	}
	
	private void ReadFile(String fileName, StringBuilder html) {
		try {

			File file = new File("/home/storage/email/" + fileName);
			if (!file.canRead()) {
				file = new File("C:/home/ec2-user/static/email/" + fileName);
			}

			Reader reader = new InputStreamReader(new FileInputStream(file), "UTF-8");

			int byteRead;
			while ((byteRead = reader.read()) != -1) {
				html.append((char) byteRead);
			}
			reader.close();

		} catch (Exception e) {

			System.err.println("Error: " + e.getMessage());

		}
	}
	
	private boolean CreateLink(String pUserID, StringBuilder link)
	{
		
		/*
		byte[] linkBytes = null;
		try {
	      linkBytes = link.toString().getBytes("US-ASCII");
      } catch (UnsupportedEncodingException e) {
	      // TODO Auto-generated catch block
	      e.printStackTrace();
      }
		
		MessageDigest sha = null;
      try {
	      sha = MessageDigest.getInstance("SHA-1");
      } catch (NoSuchAlgorithmException e) {
	      e.printStackTrace();
      }	
		sha.update(linkBytes);
		byte[] hash = sha.digest();
		sha = null;
		

		KeyGenerator keygen = null;
      try {
	      keygen = KeyGenerator.getInstance("AES");
      } catch (NoSuchAlgorithmException e) {
	      e.printStackTrace();
      }
      */

		StringBuilder trailler = new StringBuilder();
		
		String temp = new String(new char[10]).replace("\0", "0") + pUserID;
		String userID = temp.substring(temp.length() - 10, temp.length());
		
		Random randomGenerator = new Random();
	   for (int cont = 1; cont <= 30; cont++) trailler.append(String.format("%02X", randomGenerator.nextInt(100)));
	   
	   trailler.append(userID);

   	DESKeySpec keySpec = null;
   	SecretKeyFactory keyFactory = null;
   	SecretKey aesKey = null;
   	Cipher aesCipher = null;
   	
      try {
      	
      	keySpec = new DESKeySpec("12345678".getBytes("UTF8"));
      	keyFactory = SecretKeyFactory.getInstance("DES");
      	aesKey = keyFactory.generateSecret(keySpec);

	      byte[] bytes = trailler.toString().getBytes();
	      
	      aesCipher = Cipher.getInstance("DES");
	      aesCipher.init(Cipher.ENCRYPT_MODE, aesKey);
	      byte[] encripted = aesCipher.doFinal(bytes);
	      
	      for (byte b : encripted) link.append(String.format("%02X", b));
	   
	      /*
	      aesCipher.init(Cipher.DECRYPT_MODE, aesKey);
	      byte[] decripted = aesCipher.doFinal(encripted);
	      text2 = new String(decripted, "UTF8");
	      */
	      
      } catch (InvalidKeyException | UnsupportedEncodingException | NoSuchAlgorithmException | InvalidKeySpecException | NoSuchPaddingException | IllegalBlockSizeException | BadPaddingException e1) {
	      e1.printStackTrace();
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
}
