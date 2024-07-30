<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="vDao" class="vote.VoteDao"/> 
<jsp:useBean id="vList" class="vote.VoteList"/>
<jsp:setProperty name="vList" property="*" />
<jsp:useBean id="vItem" class="vote.VoteItem"/> 
<jsp:setProperty name="vItem" property="*" />
<%
	String sdate = request.getParameter("sdateY") + "-"
				 + request.getParameter("sdateM") + "-"
				 + request.getParameter("sdateD");
	String edate = request.getParameter("edateY") + "-"
			 	 + request.getParameter("edateM") + "-"
			 	 + request.getParameter("edateD");
	
	vList.setSdate(sdate);
	vList.setEdate(edate);
	
	boolean result = vDao.voteInsert(vList, vItem);
	
	String msg = "설문 추가에 실패하였습니다.";
	String location = "voteInsert.jsp";
	if(result) {
		msg = "설문이 추가 되었습니다.";
		location = "voteList.jsp";
	}
%>
<script>
	alert("<%=msg %>");
	location.href = "<%=location %>";
</script>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>