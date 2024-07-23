<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<jsp:useBean id="bDao" class="board.BoardDao" />
<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	
	bDao.upCount(num);
	Board board = bDao.getOneBoard(num);
	session.setAttribute("bean", board);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글읽기</title>

<style>
	* {margin: 0 auto;}
	table {margin-top: 50px; width:800px; }
	table th {height:40px; background-color: #B778FF;}
	table td {text-align:center; height:30px;}
	.col {background-color: #E8D9FF;}
	.col2 {background-color: #F6F6F6;}
	a {text-decoration:none; color:black;}
	a:hover {text-decoration:underline; color:coral; cursor:pointer;}
</style>
</head>
<body>
		<table>
		<tr>
			<th colspan="4">글 읽 기</th>
		</tr>
		<tr>
			<td width="15%" class="col">이름</td>
			<td width="35%" class="col2"><%=board.getName() %></td>
			<td width="15%" class="col">등록날짜</td>
			<td width="35%" class="col2"><%=board.getRegdate().substring(0,10) %></td>
		</tr>
		<tr>
			<td width="15%" class="col">제목</td>
			<td colspan="3" class="col2"><%=board.getSubject() %></td>
		</tr>
		<tr>
			<td colspan="4" style="height:120px; text-align:left;">
				내용 :<br>
				<%=board.getContent() %>
			</td>
		</tr>
		<tr>
			<td colspan="4" style="text-align:right;"><%=board.getIp() %>로 부터 글을 남기셨습니다 / 조회수 : <%=board.getCount() %> </td>
		</tr>
		<tr>
			<td colspan="4"><hr><br>
				[ <a href="">리스트</a> | 
				<a href=""> 수 정</a> | 
				<a href="">답 변</a> | 
				<a href=""> 삭 제</a> ]
			</td>
		</tr>
	</table>
</body>
</html>