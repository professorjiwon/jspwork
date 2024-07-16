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
	<h1>config 정보</h1>
	<table border="1">
		<tr>
			<th>초기 파라미터 이름</th>
			<th>초기 파라미터 값</th>
		</tr>
	<%
		Enumeration e = config.getInitParameterNames();
		while(e.hasMoreElements()) {
			String initParamName = (String)e.nextElement();
	%>
		<tr>
			<td><%=initParamName %></td>
			<td><%=config.getInitParameter(initParamName) %>
		</tr>
	<%
		}
	%>
	</table>
</body>
</html>