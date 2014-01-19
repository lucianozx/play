package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public final class ServerDB
{
	private String msgErro01000 = "&erro=01000 - falha no banco de dados";
	
	static public void DisposeResource(PreparedStatement stmt)
	{
		if (stmt == null) return;
		
		try {
			stmt.close();
		} catch (SQLException sqlex) {

		}
		stmt = null;
	}
	
	static public void DisposeResource(ResultSet snap)
	{
		if (snap == null) return;
			
		try {
			snap.close();
		} catch (SQLException sqlex) {

		}
		snap = null;
	}
	
	static public void DisposeResource(Connection conn)
	{
		if (conn == null) return;
		
		try {
			conn.close();
		} catch (SQLException sqlex) {

		}
		conn = null;		
	}
	
	static public Connection getConnection()
	{
		//System.out.println("//");
		//System.out.println("// sql pool start");

		InitialContext ctx = null;

		//System.out.println("//");
		//System.out.println("// Command InitialContext()");
		for (int iCont = 0;; iCont++)
		{
			//System.out.println("//   try:" + iCont + " - " + new Date().toString());

			try
			{
				//System.out.println("//");
				//System.out.println("//   ctx = new InitialContext()");

				ctx = new InitialContext();

				//System.out.println("//   ctx = new InitialContext() ok");
				break;
			}
			catch (NamingException e)
			{
				e.printStackTrace();

				if (iCont >= 10)
				{
					//System.out.println("//   ctx = new InitialContext() erro");
					//System.out.println("//");
					//System.out.println("// sql pool exit error");
					//System.out.println("//");

					return null;
				}

				try
				{
					Thread.sleep(500);
				}
				catch (InterruptedException ex)
				{
					ex.printStackTrace();
				}
			}
		}

		DataSource ds = null;

		//System.out.println("//");
		//System.out.println("// Command ctx.lookup()");
		for (int iCont = 0;; iCont++)
		{
			//System.out.println("//   try:" + iCont + " - " + new Date().toString());

			try
			{
				//System.out.println("//");
				//System.out.println("//   ds = (DataSource) ctx.lookup(\"java:comp/env/jdbc/db\")");

				ds = (DataSource) ctx.lookup("java:comp/env/jdbc/db");

				//System.out.println("//   ds = (DataSource) ctx.lookup(\"java:comp/env/jdbc/db\") ok");
				break;
			}
			catch (NamingException e)
			{
				e.printStackTrace();

				if (iCont >= 10)
				{
					//System.out.println("//   ds = (DataSource) ctx.lookup(\"java:comp/env/jdbc/db\") erro");
					//System.out.println("//");
					//System.out.println("// sql pool exit error");
					//System.out.println("//");

					return null;
				}

				try
				{
					Thread.sleep(500);
				}
				catch (InterruptedException ex)
				{
					ex.printStackTrace();
				}
			}
		}

		Connection conn = null;

		//System.out.println("//");
		//System.out.println("// Command ds.getConnection()");
		for (int iCont = 0;; iCont++)
		{
			//System.out.println("//   try:" + iCont + " - " + new Date().toString());

			try
			{
				//System.out.println("//");
				//System.out.println("//   conn = ds.getConnection()");

				conn = ds.getConnection();

				//System.out.println("//   conn = ds.getConnection() ok");
				break;
			}
			catch (SQLException e)
			{
				e.printStackTrace();

				if (iCont >= 10)
				{
					//System.out.println("//   conn = ds.getConnection() erro");
					//System.out.println("//");
					//System.out.println("// sql pool exit error");
					//System.out.println("//");

					return null;
				}

				try
				{
					Thread.sleep(500);
				}
				catch (InterruptedException ex)
				{
					ex.printStackTrace();
				}
			}
		}

		boolean status = false;
		Statement stmtSession = null;

		//System.out.println("//");
		//System.out.println("// Command alter session");
		for (int iCont = 0; iCont < 10; iCont++)
		{
			//System.out.println("//   try:" + iCont + " - " + new Date().toString());

			try
			{
				//System.out.println("//");
				//System.out.println("//   stmtSession = conn.createStatement()");

				stmtSession = conn.createStatement();

				//System.out.println("//   stmtSession = conn.createStatement() ok");
			}
			catch (SQLException e)
			{
				e.printStackTrace();

				//System.out.println("//   stmtSession = conn.createStatement() erro");

				try
				{
					Thread.sleep(500);
				}
				catch (InterruptedException ex)
				{
					ex.printStackTrace();
				}

				continue;
			}

			try
			{
				//System.out.println("//");
				//System.out.println("//   stmtSession.executeUpdate(\"SET time_zone = '-3:00'\")");

				stmtSession.executeUpdate("SET time_zone = '-3:00'");

				//System.out.println("//   stmtSession.executeUpdate(\"SET time_zone = '-3:00'\") ok");
				status = true;
			}
			catch (SQLException e)
			{
				e.printStackTrace();

				//System.out.println("//   stmtSession.executeUpdate(\"SET time_zone = '-3:00'\") erro");

				try
				{
					Thread.sleep(500);
				}
				catch (InterruptedException ex)
				{
					ex.printStackTrace();
				}

			}

			try
			{
				//System.out.println("//");
				//System.out.println("//   stmtSession.close()");

				stmtSession.close();

				//System.out.println("//   stmtSession.close() ok");
			}
			catch (SQLException e)
			{
				e.printStackTrace();

				//System.out.println("//   stmtSession.close() erro");
			}

			stmtSession = null;

			if (status) break;
		}

		//System.out.println("//");
		//System.out.println("// sql pool exit");
		//System.out.println("// return " + (status ? "true - alter session ok" : "false - alter session erro"));
		//System.out.println("//");

		return (status ? conn : null);
	}
}
