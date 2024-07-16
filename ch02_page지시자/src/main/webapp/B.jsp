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
	사람과 교제하는 것을 좋아하고 산뜻하다.<br>
	무엇이든 마음속에 오래 품고 있지 않고 금방 잊어버린다.<br>
	눈치가 빠르고 사교적인 편이다.<br>
	A형과 반대로 개성을 강하게 드러내며 행동적이고 정열적이다.<br>
	연애에 있어 쉽게 달구어지고 쉽게 깨지기 쉽다. <br>
	자신이 맞다고 느끼면 무슨 일이 있어도 밀어붙인다.<br>
	귀가 얇고 직설적이다.<br>
	자존심 강하고 쿨한 척하지만 속마음은 여리다.
</body>
</html>