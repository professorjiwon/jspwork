<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="ch09.*, java.util.*" %>
<jsp:useBean id="vDao" class="ch09.VoteDao" />
<%
	VoteList vlist = vDao.getOneVote(1);
	ArrayList<String> vItem = vDao.getItem(1);

	int type = vlist.getType();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
	* {margin: 0 auto;}
	.voteFrom {width:400px;}
	h2, h5{text-align:center; }
	.m50 {margin-top:50px;}
	table {margin-top: 30px;}
</style>
</head>
<body>
	<div class="voteFrom">
		<h5 class="m50">설문폼</h5>
		
		<form action="voteFormProc.jsp" method="post">
			<table class="table">
				<tr>
					<td>Q : <%=vlist.getQuestion() %></td>
				</tr>
				<tr>
					<td style="padding-left:30px;">
					<%
					for(int i=0; i<vItem.size(); i++) {
						String itemList = vItem.get(i);
						if(type == 1) {
							out.print("<p><input type='checkbox' name='itemnum' value='" + i + "'>");
						} else {
							out.print("<p><input type='radio' name='itemnum' value='" + i + "'>");
						}
						out.print(itemList + "<p/>");
					}
					%>
					</td>
				</tr>
				<tr>
					<td align="center">
						<input type="submit" value=" 투 표 ">&emsp;&emsp;
						<input type="button" value=" 결 과 ">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>