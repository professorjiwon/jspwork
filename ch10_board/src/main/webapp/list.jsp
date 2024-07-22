<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, board.*" %>
<jsp:useBean id="bDao" class="board.BoardDao" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
	* {margin: 0 auto;}
	div {width:800px;}
	h2, .cen{text-align:center; }
	.m50 {margin-top:50px;}
	table {margin-top: 30px; width:800px;}
	table th, table td {text-align:center;}
	.a {text-decoration:none; color:black; cursor:pointer;}
</style>
</head>
<body>
	<div>
		<h2 class="m50">JSPBoard</h2><p/>
		<table class="table">
			<tr>
				<td colspan="5" style="text-align:left;">Total : </td>
			</tr>		
			<tr>
				<th width="10%">번호</th>
				<th width="40%">제목</th>
				<th width="15%">이름</th>
				<th width="25%">날짜</th>
				<th width="10%">조회수</th>
			</tr>
			<%
			ArrayList<Board> alist = bDao.getBoardList();
		
			for(int i=0; i<alist.size(); i++) {
				Board board = alist.get(i);
				String rdate = board.getRegdate().substring(0,10);
				
		%>
			<tr>
				<td><%=board.getNum() %></td>
				<td style="text-align:left;"><a href="read.jsp?num=<%=board.getNum() %>" class="a"><%=board.getSubject() %></a></td>
				<td><%=board.getName() %></td>
				<td><%=rdate %></td>
				<td><%=board.getCount() %></td>
			</tr>
		<%		
			}
		%>
		
			<tr>
				<td colspan="5" style="border:none;"><br></td>
			</tr>
	
			<tr>
				<td colspan="3">[1]</td>
				<td colspan="2" style="text-align:right;">
					<a href="" class="a">[글쓰기]</a>&emsp;
					<a href="" class="a">[처음으로]</a>
				</td>
			</tr>
		</table>
		<form name="searchFrm" method="get" action="list.jsp">
			<table align="center" width="700">
				<tr>
					<td align="center">
						<select name="keyField">
							<option value="name">이름</option>
							<option value="subject">제목</option>
							<option value="content">내용</option>
						</select>
						<input name="keyWord" required>
						<input type="submit" value="찾기">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>