<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	String name = request.getParameter("name");
%>
Action의 IncludeTag의 Top입니다<p/>
<%=name %> Fighting!!!
</body>
</html>