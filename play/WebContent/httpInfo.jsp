<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>HTTP Info</title>
</head>

<body>

	getCharacterEncoding: ${getCharacterEncoding} <br />
	getContextPath: ${getContextPath} <br />
	getMethod: ${getMethod} <br />
	getPathInfo: ${getPathInfo} <br />
	getPathTranslated: ${getPathTranslated} <br />
	getQueryString: ${getQueryString} <br />
	getRemoteUser: ${getRemoteUser} <br />
	getRequestedSessionId: ${getRequestedSessionId} <br />
	getRequestURI: ${getRequestURI} <br />
	getRequestURL: ${getRequestURL} <br />
	getServletPath: ${getServletPath} <br />
	getContentLength: ${getContentLength} <br />
	getContentType: ${getContentType} <br />
	getLocalAddr: ${getLocalAddr} <br />
	getLocalName: ${getLocalName} <br />
	getLocalPort: ${getLocalPort} <br />
	getProtocol: ${getProtocol} <br />
	getRemoteAddr: ${getRemoteAddr} <br />
	getRemoteHost: ${getRemoteHost} <br />
	getRemotePort: ${getRemotePort} <br />
	getScheme: ${getScheme} <br />
	getServerName: ${getServerName} <br />
	getServerPort: ${getServerPort} <br />
	isSecure: ${isSecure} <br />

</body>
</html>