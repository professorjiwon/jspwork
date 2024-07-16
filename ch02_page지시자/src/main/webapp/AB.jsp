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
	몹시 섬세하고 신경질적인 것 같기도 하다<br>
	반대로 쉬어보이면서도 차갑다<br>
	두 가지 성격이 섞여 있어 잘 알기 어렵고 이성교제에 있어 제일 애를 먹는다.<br>
	너무 여러 가지 많은 것에 신경을 쓰며 낯가림을 많이 한다.<br>
	감정표현에 서툴고 아부하거나 나대는 것을 싫어한다.<br>
	비관적이고 의심이 많다.<br>
	사람을 잘 안믿는 편이다.
</body>
</html>