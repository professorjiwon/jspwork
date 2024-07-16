<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="regBean" class="ch05.MemberBean" />
<jsp:setProperty name="regBean" property="*" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		border-collapse:collapse;
	}
</style>
</head>
<body>
	<table border="1" align="center" >
		<tr>
			<th colspan="2">
				<jsp:getProperty property="name" name="regBean"/>님이 작성한 정보
			</th>
		</tr>
		<tr>
			<td>아이디</td>
			<td><jsp:getProperty property="id" name="regBean"/></td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td><jsp:getProperty property="pwd" name="regBean"/></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><jsp:getProperty property="name" name="regBean"/></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><jsp:getProperty property="birthday" name="regBean"/></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><jsp:getProperty property="email" name="regBean"/></td>
		</tr>
	</table>
</body>
</html>