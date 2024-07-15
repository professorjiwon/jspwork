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
	String name = "Korea web JSP";
%>
<h1>Action의 Include Tag</h1>
<jsp:include page="06.3.action_includeTag3.jsp" /><p/>
Action의 include Body입니다.
<%=name %>
</body>
</html>





