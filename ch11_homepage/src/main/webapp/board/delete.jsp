<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<jsp:useBean id="bDao" class="board.BoardDao" />
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	Board board = (Board)session.getAttribute("bean");
	
	if(request.getParameter("pass") != null) {
		String inputPass = request.getParameter("pass");
		String dbPass = board.getPass();
		
		if(inputPass.equals(dbPass)) {
			boolean result = bDao.deleteBoard(num);
			if(result) {
				response.sendRedirect("list.jsp?nowPage=" + nowPage);
			} else {
			%>
				<script type="text/javascript">
					alert("댓글이 있어 삭제할 수 없습니다");
					history.go(-2);
				</script>
			<%		
			}	
		} else {
		%>
			<script type="text/javascript">
				alert("비밀번호가 맞지 않습니다.");
				history.back();
			</script>
		<%
		}
	} 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{width:600px; margin-top: 50px;}
	table th{background-color:#CACACA; height:40px;}
	table td {height:30px; text-align:center;}
</style>
</head>
<body>
	<form action="delete.jsp" method="post">
		<table align="center">
			<tr>
				<th>사용자의 비밀번호를 입력해주세요.</th>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td><input type="password" name="pass" required></td>
			</tr>
			
			<tr>
				<td><br><hr></td>
			</tr>
			<tr>
				<td align="center">
					<input type="submit" value="삭제완료">&emsp;
					<input type="reset" value="다시쓰기">&emsp;
					<input type="button" value="뒤로" onclick="history.go(-1)">
				</td>
			</tr>
		</table>
		<input type="hidden" name="num" value="<%=num %>">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
	</form>  
</body>
</html>