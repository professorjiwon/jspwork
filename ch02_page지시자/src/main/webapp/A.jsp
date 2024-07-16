<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String bloodType = request.getParameter("bloodType");
%>
</head>
<body>
	<b><%=name %></b>님의 혈액형은 <b><%=bloodType %>형</b>이고, 성격은 다음과 같습니다<br>
	어떤 상황에서든 염려하며 조심성이 강하다.<br>
	감동을 잘하며 자기를 희생해서라도 다투기를 피한다.<br>
	순응적이고 자신의 개성을 누른다.<br>
	성실하며 인내심이 강하고 모험을 하지 않는다.<br>
	은근히 할말 다하며 내숭이 있다.<br>
	잘 삐지고 오래간다.<br>
	쑥스러움이나 낯가림을 느낀다.<br>
	인간관계가 애매한 경우가 많다.
</body>
</html>