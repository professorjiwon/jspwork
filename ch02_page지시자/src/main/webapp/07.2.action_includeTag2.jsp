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
	<h1>Action IncludeTag파라미터 받기</h1>
	<jsp:include page="07.3.action_includeTag3.jsp">
		<jsp:param value="jsp수업중" name="siteName"/>
		<jsp:param value="02-1345-6789" name="siteTel"/>
	</jsp:include>
	<%=siteName %><br>
	<%=siteTel %>
</body>
</html>