<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch06.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBConnectionPool</title>
</head>
<body>
	<h1>DBConnectionPool을 이용한 ORACLE연동</h1>
<%
	DBConnectionMgr pool = DBConnectionMgr.getInstance();

	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	
	try {
		con = pool.getConnection();
		st = con.createStatement();
		String sql = "select * from emp_01";
		rs = st.executeQuery(sql);
%>
	<table border="1">
		<tr>
			<th>사번</th>
			<th>사원명</th>
			<th>부서명</th>
		</tr>
<%
	while(rs.next()) {
%>
		<tr>
			<td><%=rs.getString("emp_id") %></td>
			<td><%=rs.getString("emp_name") %></td>
			<td><%=rs.getString("dept_code") %></td>
		</tr>
<%
	}
%>		
	</table>
<%
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		if(con != null) {
			try { pool.freeConnection(con); } 
			catch (Exception e) { }
		}
	}
%>
</body>
</html>