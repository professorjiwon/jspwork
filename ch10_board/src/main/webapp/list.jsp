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
	h2{text-align:center; }
	.m50 {margin-top:50px;}
	table {margin-top: 30px; width:800px;}
	table th {text-align:center;}
	.a {text-decoration:none; color:black; cursor:pointer;}
</style>
</head>
<body>
	<div>
		<h2 class="m50">JSPBoard</h2><p/>
		<table class="table">
			<tr>
				<td colspan="5">Total : </td>
			</tr>		
			<tr>
				<th width="10%">번호</th>
				<th width="40%">제목</th>
				<th width="15%">이름</th>
				<th width="25%">날짜</th>
				<th width="10%">조회수</th>
			</tr>
			
	
			<tr>
				<td colspan="3" align="center">[1]</td>
				<td colspan="2" align="right">
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