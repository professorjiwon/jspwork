<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
	* {margin: 0 auto;}
	div {width:600px;}
	h2, h5{text-align:center; }
	.m50 {margin-top:50px;}
	.m30 {margin-top:30px;}
	table {margin-top: 30px; width:600px;}
</style>
</head>
<body>
	<div>
		<h2 class="m50">투표 프로그램</h2>
		<hr>
			
		<h5 class="m30">설문작성</h5>
		<hr>
		
		<form action="voteInsertProc.jsp" method="post">
			<table class="table">
				<tr>
					<td>질문</td>
					<td colspan="2">q:<input name="question" size="57"></td>
				</tr>
				<tr>
					<td rowspan="7">항목</td>
				<%
					for(int i=1; i<=4; i++) {
						out.print("<td>" + (i*2-1) + ":<input name='item'></td>");
						out.print("<td>" + (i*2) + ":<input name='item'></td>");
						out.print("</tr>");
						if(i<4)
							out.print("<tr>");
					}
				%>
				<!--	
					<td>1:<input name="item"></td>
					<td>2:<input name="item"></td>
				</tr>
				<tr>
					<td>3:<input name="item"></td>
					<td>4:<input name="item"></td>
				</tr>
				<tr>
					<td>5:<input name="item"></td>
					<td>6:<input name="item"></td>
				</tr>
				<tr>
					<td>7:<input name="item"></td>
					<td>8:<input name="item"></td>
				</tr>
				-->
				<tr>
					<td>시작일</td>
					<td>
						<select name = "sdateY">
						<%
							for(int i=2024; i<=2030; i++) {
								out.print("<option value='" + i + "'>" + i);
							}
						%>
						</select>년&ensp;
						<select name = "sdateM">
						<%
							for(int i=1; i<=12; i++) {
								out.print("<option value='" + i + "'>" + i);
							}
						%>
						</select>월&ensp;
						<select name = "sdateD">
						<%
							for(int i=1; i<=31; i++) {
								out.print("<option value='" + i + "'>" + i);
							}
						%>
						</select>일
					</td>
				</tr>
				<tr>
					<td>종료일</td>
					<td>
						<select name = "edateY">
						<%
							for(int i=2024; i<=2030; i++) {
								out.print("<option value='" + i + "'>" + i);
							}
						%>
						</select>년&ensp;
						<select name = "edateM">
						<%
							for(int i=1; i<=12; i++) {
								out.print("<option value='" + i + "'>" + i);
							}
						%>
						</select>월&ensp;
						<select name = "edateD">
						<%
							for(int i=1; i<=31; i++) {
								out.print("<option value='" + i + "'>" + i);
							}
						%>
						</select>일
					</td>
				</tr>
				<tr>
					<td>이중답변</td>
					<td>
						<input type="radio" name="type" value="1" checked>yes&emsp;
						<input type="radio" name="type" value="0">no
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<input type="submit" value="작성하기">&emsp;
						<input type="reset" value="초기화">&emsp;
						<input type="button" value="리스트보기" onclick="location.href='voteList.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>