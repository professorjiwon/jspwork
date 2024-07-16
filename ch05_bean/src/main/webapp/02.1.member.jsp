<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="script.js" charset="utf-8" type="text/javascript"></script>
<style>
	table{
		border-collapse:collapse;
	}
</style>
</head>
<body>
	<table border="1" align="center">
		<form method="post" name="regForm" action="02.2.memberProc.jsp">
			<tr>
				<th colspan="3">회원가입</th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input name="id"></td>
				<td>5글자이상 영문과 숫자로만 기재</td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="pwd"></td>
				<td>영문, 숫자, 특수기호가 각 1개이상씩, 3글자 이상</td>
			</tr>
			<tr>
				<td>패스워드확인</td>
				<td><input type="password" name="repwd"></td>
				<td>위에쓴 패스워드를 다시 써 주세요</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="name"></td>
				<td>한글로 2글자 이상</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input name="birthday"></td>
				<td>ex)2020.02.03</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input name="email"></td>
				<td>ex) ex@naver.com</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<input type="button" value="회원가입" onclick="inputCheck();">&emsp;
					<input type="reset">
				</td>
			</tr>
		</form>
	</table>
</body>
</html>