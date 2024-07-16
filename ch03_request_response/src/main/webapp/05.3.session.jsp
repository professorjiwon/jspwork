<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String season = request.getParameter("season");
	String fruit = request.getParameter("fruit");
	
	String id = (String)session.getAttribute("idKey");
	String sessionId = session.getId();
	int intervalTime = session.getMaxInactiveInterval();
%>
</head>
<body>
<%
	if(id != null) {
%>
		<h1>Session Ex1</h1>
		<%=id %>님이 좋아하는 계절과 과일은 <%=season %>과 <%=fruit %>입니다<p/>
		세션 ID : <%=sessionId %><p/>
		세션 유지시간 : <%=intervalTime %>초<p/>
<%
		session.invalidate();
	} else {
		out.print("세션의 시간이 경과하였거나 다른 이유로 연결 할 수 없습니다");
	}
%>
</body>
</html>