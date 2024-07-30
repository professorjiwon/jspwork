<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
					<input type="button" value="회원가입" onclick="location.href='member.jsp'">&ensp;
					<input type="button" value="홈으로" onclick="location.href='../index.jsp'"> 
				</td>
			</tr>
		</table>
	</form>
</body>
</html>