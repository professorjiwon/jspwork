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
	침착하며 감정에 휘둘리지 않는다.<br>
	어떤 상황에서든 가볍게 보지 않는다.<br>
	남의 말에 잘 움직이지 않고 정신력이 강하다. <br>
	점잖고 자부심이 강하다<br>
	변화를 좋아하고 유머가 있다.<br>
	로맨티스트로 여러 분야에서 천재적 소질을 가지고 있다.<br>
	리더 역할을 할 때가 많고 기분파이며 솔직하다.<br>
	호불호가 심하고 표정을 잘 못 숨긴다.<br>
	일단 저지르고 본다.
</body>
</html>