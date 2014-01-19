

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.BufferedReader;

/**
 * Servlet implementation class Login
 */
@WebServlet("/HttpInfo")
public class HttpInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public HttpInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String getCharacterEncoding = request.getCharacterEncoding();
		String getContextPath = request.getContextPath();
		String getMethod = request.getMethod();
		String getPathInfo = request.getPathInfo();
		String getPathTranslated = request.getPathTranslated();
		String getQueryString = request.getQueryString();
		String getRemoteUser = request.getRemoteUser();
		String getRequestedSessionId = request.getRequestedSessionId();
		String getRequestURI = request.getRequestURI();
		StringBuffer getRequestURL = request.getRequestURL();
		//String getRequestURL = request.getRequestURL();
		String getServletPath = request.getServletPath();
		int getContentLength = request.getContentLength();
		String getContentType = request.getContentType() ;
		String getLocalAddr = request.getLocalAddr();
		String getLocalName = request.getLocalName();
		int getLocalPort = request.getLocalPort();
		String getProtocol = request.getProtocol();
		BufferedReader getReader = request.getReader();
		String getRemoteAddr = request.getRemoteAddr();
		String getRemoteHost = request.getRemoteHost();
		int getRemotePort = request.getRemotePort();
		String getScheme = request.getScheme();
		String getServerName = request.getServerName();
		int getServerPort = request.getServerPort();
		boolean isSecure = request.isSecure();

		request.setAttribute("getCharacterEncoding", getCharacterEncoding);
		request.setAttribute("getContextPath", getContextPath);
		request.setAttribute("getMethod", getMethod);
		request.setAttribute("getPathInfo", getPathInfo);
		request.setAttribute("getPathTranslated", getPathTranslated);
		request.setAttribute("getQueryString", getQueryString);
		request.setAttribute("getRemoteUser", getRemoteUser);
		request.setAttribute("getRequestedSessionId", getRequestedSessionId);
		request.setAttribute("getRequestURI", getRequestURI);
		request.setAttribute("getRequestURL", getRequestURL.toString());
		request.setAttribute("getServletPath", getServletPath);
		request.setAttribute("getContentLength", (int) getContentLength);
		request.setAttribute("getContentType", getContentType);
		request.setAttribute("getLocalAddr", getLocalAddr);
		request.setAttribute("getLocalName", getLocalName);
		request.setAttribute("getLocalPort", getLocalPort);
		request.setAttribute("getProtocol", getProtocol);
		request.setAttribute("getReader", getReader);
		request.setAttribute("getRemoteAddr", getRemoteAddr);
		request.setAttribute("getRemoteHost", getRemoteHost);
		request.setAttribute("getRemotePort", getRemotePort);
		request.setAttribute("getScheme", getScheme);
		request.setAttribute("getServerName", getServerName);
		request.setAttribute("getServerPort", getServerPort);
		request.setAttribute("isSecure", isSecure);

		request.getRequestDispatcher("/httpInfo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
