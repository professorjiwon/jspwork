<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page session="true"%> 
<%@ page buffer="16kb"%>
<%@ page autoFlush="true" %>
<%@ page trimDirectiveWhitespaces = "true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page_etc</title>
</head>
<body>
	<%
		Date date = new Date();
	%>
	<p>현재 날짜와 시간은?</p>
	<%=date.toLocaleString() %>
</body>
</html>



