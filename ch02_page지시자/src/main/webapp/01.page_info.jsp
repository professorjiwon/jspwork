<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="JSP 현재 페이지의 정보" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page_info</title>
</head>
<body>
	<h1>page_info</h1>
	<%=this.getServletInfo() %>
</body>
</html>