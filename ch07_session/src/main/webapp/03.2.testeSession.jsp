<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Enumeration name = session.getAttributeNames();
	while(name.hasMoreElements()) {
		String sName = (String)name.nextElement();
		String value = (String)session.getAttribute(sName);
		out.print("session name : " + sName + "<p/>");
		out.print("session value : " + value + "<hr>");
	}
%>
</body>
</html>