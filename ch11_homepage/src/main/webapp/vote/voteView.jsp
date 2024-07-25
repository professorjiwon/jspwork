<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,vote.*" %>
<jsp:useBean id="vDao" class="vote.VoteDao" />
<%
	int num = 0;
	if(!(request.getParameter("num")==null || request.getParameter("num").equals(""))) {
		num = Integer.parseInt(request.getParameter("num"));
	}
	
	int sum = vDao.sumCount(num);
	ArrayList<VoteItem> alist = vDao.getView(num);
	VoteList vlist = vDao.getOneVote(num);
	Random r = new Random();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
	.divView {width:450px; margin:20px 0 0 40px;}
</style>
</head>
<body>
	<div class="divView" >
		<table class="table">
			<tr>
				<th colspan="4">Q : <%=vlist.getQuestion() %><th>
			</tr>
			<tr>
				<td colspan="4">총 투표수 : <%=sum %><td>
			</tr>
			<tr>
				<th width="15%">번호</th>
				<th width="30%">item</th>
				<th align="left">그래프</th>
				<th width="15%">득표수</th>
			</tr>
		<%
			for(int i=0; i<alist.size(); i++) {
				VoteItem vitem = alist.get(i);
				
				int rgb = r.nextInt(255*255*255);		// 랜덤으로 rgb를 10진수로 추출하기
				String rgbHex = Integer.toHexString(rgb);  // rgb10진수를 16진수로 변환하기
				String hRGB = "#" + rgbHex;				// 16진수 앞에 # 붙이기(= #ff8b6a )
				
				int ratio = (int)(Math.ceil(vitem.getCount() / (double)sum * 100));
		%>
			<tr>
				<td><%=i+1 %></td>
				<td><%=vitem.getItem()[0] %></td>
				<td>
					<table width="<%=ratio %>" height="15">
						<tr>
							<td bgcolor="<%=hRGB %>" style="border:none"></td>
						</tr>
					</table>
				</td>
				<td><%=vitem.getCount() %></td>
			</tr>
		<%
			}
		%>
		</table>
	</div>
</body>
</html>







