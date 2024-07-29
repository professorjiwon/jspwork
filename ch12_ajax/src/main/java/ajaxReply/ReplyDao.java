package ajaxReply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReplyDao {
	private DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public ArrayList<Reply> getReplyList(int ref) {
		ArrayList<Reply> alist = new ArrayList<Reply>();
		
		try {
			con = pool.getConnection();
			//sql = "select no, content, ref, name, to_char(redate, 'YYYY-MM-DD') from reply where ref=? order by no desc";
			sql = "select * from reply where ref=? order by no desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				alist.add(new Reply(rs.getInt(1),
									rs.getString(2),
									rs.getInt(3),
									rs.getString(4),
									rs.getString(5)));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;
	}
	
	public int insertReply(Reply bean) {
		int result = 0;
		try {
			con = pool.getConnection();
			sql = "insert into reply values(seq_reply.nextval,?,?,?,sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getContent());
			pstmt.setInt(2, bean.getRef());
			pstmt.setString(3, bean.getName());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return result;
	}
}
