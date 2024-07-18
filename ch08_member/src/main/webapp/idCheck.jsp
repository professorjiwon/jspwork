<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="ch08.MemberMgr"/>
<%
	String id = request.getParameter("id");
	boolean result = mMgr.checkId(id);
	
	if(result) {
		out.print(id + "는 이미 존재하는 ID입니다.");
	} else {
		out.print(id + "는 사용가능합니다");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="" onclick="self.close()">닫기</a>
</body>
</html>