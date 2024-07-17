package ch06;

import java.sql.*;

public class OracleDBTest2 {

	public static void main(String[] args) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tjoeun","1234");
			System.out.println("Success");
			
			st = con.createStatement();
			// select문 사용시 executeQuery() 메소드 사용
			rs = st.executeQuery("select * from department");
			
			while(rs.next()) {
				String id = rs.getString(1);
				String title = rs.getString("dept_title");
				String location = rs.getString(3);
				System.out.println(id + ", " + title + ", " + location);
			}	
		} catch (SQLException e) {
			System.out.println("접속오류");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 오류");
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

	}

}
