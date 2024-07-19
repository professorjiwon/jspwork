<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(id != null) {
%>
		<b><%=id %></b>님 환영합니다.<p/>
		즐거운 쇼핑 되세요<p/>
		<a href="logout.jsp">로그아웃</a>
<%		
	} else {
%>
	<form method="post" action="loginProc.jsp">
		<table align="center">
			<tr>
				<th colspan="2"><h3>로그인</h3></th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input name="id" required></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd" required></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="로그인">&ensp;
					<input type="button" value="회원가입" onclick="location.href='member.jsp'"> 
				</td>
			</tr>
		</table>
	</form>
<%	}	%>
</body>
</html>