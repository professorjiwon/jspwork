<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = "";
	Cookie[] cookies = request.getCookies();
	for(int i=0; i<cookies.length; i++) {
		if(cookies[i].getName().equals("idKey")) {
			id = cookies[i].getValue();
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookie login OK</title>
</head>
<body>
	<h2>Cookie 로그인</h2>
	<h3><%=id %>님이 로그인 하였습니다</h3>
	<h3><a href="04.3.cookieLogout.jsp">로그아웃</a></h3>
</body>
</html>