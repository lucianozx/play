package lib;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.jdbc.Statement;

import db.ServerDB;

public final class ManagerFigura {

    public static boolean add(StringBuilder id, String filename, String type, String size, String folder) {

	Connection conn = db.ServerDB.getConnection();
	if (conn == null) {
	    System.out.println("// VerifyEmail: getConnection() error");
	    return false;
	}

	boolean status = false;

	PreparedStatement stmt = null;
	ResultSet snap = null;

	try {

	    stmt = conn.prepareStatement("insert figuras (timestamp, filename, type, size, folder, status) values (now(), ?, ?, ?, ?, null)", Statement.RETURN_GENERATED_KEYS);
	    stmt.setString(1, filename);
	    stmt.setString(2, type);
	    stmt.setString(3, size);
	    stmt.setString(4, folder);
	    stmt.executeUpdate();

	    snap = stmt.getGeneratedKeys();
	    if (snap.next())
		id.append(snap.getInt(1));

	    status = true;

	} catch (Exception e) {

	    SystemLogException.Print(e);

	} finally {

	    ServerDB.DisposeResource(snap);
	    ServerDB.DisposeResource(stmt);
	}

	ServerDB.DisposeResource(conn);

	return status;
    }
    
    public static void update(String id) {

	Connection conn = db.ServerDB.getConnection();
	if (conn == null) {
	    System.out.println("// VerifyEmail: getConnection() error");
	    return;
	}

	PreparedStatement stmt = null;
	ResultSet snap = null;

	try {

	    stmt = conn.prepareStatement("update figuras set status = 'ok' where id = ? ");
	    stmt.setString(1, id);

	    stmt.executeUpdate();

	} catch (Exception e) {

	    SystemLogException.Print(e);

	} finally {

	    ServerDB.DisposeResource(snap);
	    ServerDB.DisposeResource(stmt);
	}

	ServerDB.DisposeResource(conn);
    }
    
    public static void delete(String id) {

	Connection conn = db.ServerDB.getConnection();
	if (conn == null) {
	    System.out.println("// VerifyEmail: getConnection() error");
	    return;
	}

	PreparedStatement stmt = null;
	ResultSet snap = null;

	try {

	    stmt = conn.prepareStatement("update figuras set status = null where id = ? ");
	    stmt.setString(1, id);

	    stmt.executeUpdate();

	} catch (Exception e) {

	    SystemLogException.Print(e);

	} finally {

	    ServerDB.DisposeResource(snap);
	    ServerDB.DisposeResource(stmt);
	}

	ServerDB.DisposeResource(conn);
    }    
}
