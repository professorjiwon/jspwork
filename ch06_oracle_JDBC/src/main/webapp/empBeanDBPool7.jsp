<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, ch06.*" %>
<jsp:useBean id="pool" class="ch06.EmpBeanDBPool7" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>직급명</th>
		</tr>
	<%
	ArrayList<EmpBean> alist = pool.getList();
	for(int i=0; i<alist.size(); i++) {
		EmpBean bean = alist.get(i);
	%>
		<tr>
			<td><%=bean.getEmp_id() %></td>
			<td><%=bean.getEmp_name() %></td>
			<td><%=bean.getEmail() %></td>
			<td><%=bean.getPhone() %></td>
			<td><%=bean.getJob_name() %></td>
		</tr>
	<%
	}
	%>
	</table>
</body>
</html>







