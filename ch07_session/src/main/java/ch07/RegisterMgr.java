package ch07;

import java.sql.*;

public class RegisterMgr {
	private DBConnectionMgr pool;
	
	public RegisterMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public boolean loginRegister(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean loginCon = false;
		
		try {
			con = pool.getConnection();
			/*
			- Statement로 하려면
			String query = "select count(*) from mem where mem_id = " 
						  + id + " and mem_pw = " + pwd;
			*/
			String query = "select count(*) from mem where mem_id=? and mem_pw=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			rs = pstmt.executeQuery();
			
			if(rs.next() && rs.getInt(1) == 1)
				loginCon = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return loginCon;
	}
}






