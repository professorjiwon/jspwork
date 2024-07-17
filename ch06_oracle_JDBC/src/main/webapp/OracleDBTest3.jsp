<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tjoeun","1234");
		st = con.createStatement();
		rs = st.executeQuery("select * from department");
%>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>TITLE</th>
			<th>LOCATION</th>
		</tr>
<% 
	while(rs.next()) {
		String id = rs.getString(1);
		String title = rs.getString(2);
		String location = rs.getString(3);
%>
		<tr>
			<td><%=id %></td>
			<td><%=title %></td>
			<td><%=location %></td>
		</tr>
<%
	}
%>	
	</table>
<%
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		if(st != null) {
			try { st.close(); } 
			catch (SQLException e) { e.printStackTrace(); }
		}
		if(rs != null) {
			try { rs.close(); } 
			catch (SQLException e) { e.printStackTrace(); }
		}
		if(con != null) {
			try { con.close(); } 
			catch (SQLException e) { e.printStackTrace(); }
		}
	}
%>
</body>
</html>