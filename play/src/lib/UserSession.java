package lib;

public class UserSession {
	
	public boolean userSession = false;
	public boolean systemAdmin = false;
	public User user = new User();

	public UserSession() {
		// TODO Auto-generated constructor stub
	}

	public boolean isUserSession() {
		return userSession;
	}

	public boolean isSystemAdmin() {
		return systemAdmin;
	}

	public User getUser() {
		return user;
	}
}
