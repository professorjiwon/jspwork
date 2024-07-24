<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	Board board = (Board)session.getAttribute("bean");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{width:600px; margin-top: 50px;}
	table th{background-color:#813477; height:40px; color:white;}
	table td {height:30px;}
	textarea {resize: none;}
</style>
</head>
<body>
	<form action="boardUpdate" method="post">
		<table align="center">
			<tr>
				<th colspan="2">수 정 하 기</th>
			</tr>
			<tr>
				<td colspan="2"><br></td>
			</tr>
			<tr>
				<td width="15%">성명</td>
				<td><input name="name" value="<%=board.getName() %>"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input name="subject" value="<%=board.getSubject() %>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" rows="10" cols="50"><%=board.getContent() %></textarea></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" required> 수정시에는 비밀번호가 필요합니다.</td>
			</tr>
			<tr>
				<td colspan="2"><br><br><hr></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정완료">&emsp;
					<input type="reset" value="다시수정">&emsp;
					<input type="button" value="뒤로" onclick="history.go(-1)">
				</td>
			</tr>
		</table>
		<input type="hidden" name="num" value="<%=num %>">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
	</form>  
</body>
</html>