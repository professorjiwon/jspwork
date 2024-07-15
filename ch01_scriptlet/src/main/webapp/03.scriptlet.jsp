<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scriptlet</title>
</head>
<body>
	<%-- 
		스크립트릿 : 지역변수선언, 반복문, 조건문등
		[사용법]
		<%
			프로그램
		%>	
		
		표현식 : 변수나 메서드 호출시 사용
		[사용법]
		<%=변수나 메서드%>
	--%>
	<%
		String name = "이고잉";
		int num = 1;
		boolean bool = true;
		double douNum = 3.14;
	%>
	나의 이름은 <%=name %>이고,<br>
	<%=num %>회차 수업입니다.<br>
	지금 수업에 참여 중 입니까?<%=bool %><br>
	원주율은 <%=douNum %>입니다.<br>
	
	<%
		if(true) {
			num = 10;
		}
	%>
	<%=num %>으로 변경됨.
</body>
</html>