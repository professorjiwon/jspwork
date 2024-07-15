<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>while_2</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String msg = request.getParameter("msg");
	int count = Integer.parseInt(request.getParameter("count"));
	int num = 0;
	while(count > num) {
%>
		<%=msg %><br>
<%
		++num;
	}
%>
</body>
</html>








