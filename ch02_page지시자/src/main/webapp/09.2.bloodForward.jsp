<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String bloodType = request.getParameter("bloodType");
%>
</head>
<body>
	<jsp:forward page='<%=bloodType + ".jsp" %>'/>
</body>
</html>