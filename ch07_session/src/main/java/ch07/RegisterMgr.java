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
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return loginCon;
	}
}






