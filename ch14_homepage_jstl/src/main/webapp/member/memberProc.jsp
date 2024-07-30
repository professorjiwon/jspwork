<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mem" class="member.Member" />
<jsp:useBean id="mMgr" class="member.MemberMgr" />
<jsp:setProperty name="mem" property="*" />
<%
	boolean result = mMgr.insertMember(mem);
	String msg = "회원가입에 실패하였습니다.";
	String location = "member.jsp";
	if(result) {
		msg = "회원가입을 하였습니다.";
		location = "login.jsp";
	}
%>
<script>
	alert("<%=msg %>");
	location.href="<%=location %>";
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