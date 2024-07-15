<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String siteName = request.getParameter("siteName");
		String siteTel = request.getParameter("siteTel");
	%>
	Action의 includeTag Top입니다<br>
	Top : <%=siteName %><br>
	Top : <%=siteTel %><br>
</body>
</html>