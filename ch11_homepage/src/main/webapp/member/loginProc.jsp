<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="member.MemberMgr" />
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	boolean result = mMgr.loginMember(id, pwd);
	
	String msg = "로그인에 실패하였습니다.";
	if(result) {
		session.setAttribute("idKey", id);
		msg = "로그인에 성공하였습니다.";
	}
%>
<script type="text/javascript">
	alert("<%=msg %>");
	location.href = "../index.jsp";
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