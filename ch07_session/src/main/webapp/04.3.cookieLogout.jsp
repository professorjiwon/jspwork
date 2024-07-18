<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	for(int i=0; i<cookies.length; i++) {
		if(cookies[i].getName().equals("idKey")) {
			cookies[i].setMaxAge(0);
			response.addCookie(cookies[i]);
		}
	}
%>
<script type="text/javascript">
	alert("로그아웃 되었습니다");
	location.href = "04.1.cookieLogin.jsp";
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
</head>
<body>

</body>
</html>