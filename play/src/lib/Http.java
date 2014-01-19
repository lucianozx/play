package lib;

import javax.servlet.http.HttpServletRequest;

public final class Http
{
	static public String getServerContextPath(HttpServletRequest request) {
		try
      {
	      return "http://" + request.getServerName() + request.getContextPath() + "/";
      }
      catch (Exception e)
      {

      }
		return "";
	}
}
