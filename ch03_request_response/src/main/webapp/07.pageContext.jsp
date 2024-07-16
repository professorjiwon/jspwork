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
		out.print("out.print()메소드를 이용한 출력<p/>");
	
		pageContext.getOut().print("pageContext.getOut()을 이용한 출력");
	%>
</body>
</html>