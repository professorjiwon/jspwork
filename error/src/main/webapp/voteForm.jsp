<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch09.*, java.util.*" %>    
<jsp:useBean id="vDao" class="ch09.VoteDao" />   
<%
	int num = 0;
	if(!(request.getParameter("num") == null || request.getParameter("num").equals(""))) {
		num = Integer.parseInt(request.getParameter("num"));    // 무조건 String으로 들어오기 때문에 강제 형변환
	}
	
	VoteList vlist = vDao.getOneVote(num);  // 만약 아무것도 받지 않고 0을 받을 경우 error
	ArrayList<String> vItem = vDao.getItem(num);
	
	/* String question = vlist.getQuestion();  밑에 바로 값을 넣어줌*/
	
	int type = vlist.getType();   // 설문폼(투표하기)에 넣을 질문 1개 가져오기에서 둘 중 하나는 변수로 담아줌
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
	.voteForm {width:400px;}
	h2, h5{text-align:center; }
	.m50 {margin-top:50px;}
	table {margin-top: 30px;}
</style>
</head>
<body>
	<div class="voteForm">
		<h5 class="m30">설문폼</h5>
			
		<form action="voteFormProc.jsp" method="post"  class="voteForm"> 			
				
			<table class="table">
				<tr>
					<th align="left">Q : <%=vlist.getQuestion() %></th>  <!--설문폼(투표하기)에 넣을 질문 1개 가져오기에서 둘 중 하나는 바로 값으로 넣어줌 -->
				</tr>
				<tr>
					<td style="padding-left:30px;">
						<%
							for(int i=0; i<vItem.size(); i++) {
								String itemList = vItem.get(i);
								if(type == 1) {
									out.print("<p><input type='checkbox' name='itemnum' value='" + i + "'>");  // i는 itemnum에 해당
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
						<input type="button" value=" 결 과 " 
							onclick="window.open('voteView.jsp?num=<%=num%>', 'voteView', 'width=670, height=460')">
					</td>			
				</tr>
			</table>
			<input type="hidden" name="num" value="<%=num %>">
		</form>
	</div>
</body>
</html>


