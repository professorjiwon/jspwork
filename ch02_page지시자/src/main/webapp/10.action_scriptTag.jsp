<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scriptTag</title>
</head>
<body>
	<%-- <%! 선언문 (멤버변수,메서드) %> --%>
	<jsp:declaration>
		public int min(int x, int y) {
			return x > y ? y : x;
		}
	</jsp:declaration>
	
	<%-- <% 스크립트릿 (지역변수,for,if..)%> --%>
	<jsp:scriptlet>
		int num = 1;
	</jsp:scriptlet>
	
	<%-- <%=표현식 (변수나 메서드 호출하여 출력)  %> --%>
	num = <jsp:expression>num</jsp:expression><br>
	3와 5중 작은 수는? <jsp:expression>min(3,5)</jsp:expression>
</body>
</html>



