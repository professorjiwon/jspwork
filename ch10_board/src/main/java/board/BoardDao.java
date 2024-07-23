package board;

import java.sql.*;
import java.util.ArrayList;

public class BoardDao {
	private DBConnectionMgr pool;
	Connection con = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public BoardDao() {
		pool = DBConnectionMgr.getInstance();
	}
	
	// 게시판 리스트
	public ArrayList<Board> getBoardList(String keyField,String keyWord, int start, int end) {
		ArrayList<Board> alist = new ArrayList<Board>();
		
		try {
			con = pool.getConnection();
			if(keyWord == null || keyWord.equals("")) {
				sql = "select * "
					+ "  from (select ROWNUM AS RNUM, BT1.* "
					+ "         from (select * from board order by ref desc, pos) BT1"
					+ "        )"
					+ "  where RNUM between ? and ?";
				pstmt= con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				sql = "select * "
					+ "  from (select ROWNUM AS RNUM, BT1.* "
					+ "         from (select * from board order by ref desc, pos) BT1"
					+ "			where " + keyField + " like ?"
					+ "        )"
					+ "  where RNUM between ? and ?";
				pstmt= con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setNum(rs.getInt("num"));
				board.setSubject(rs.getString("subject"));
				board.setName(rs.getString("name"));
				board.setRegdate(rs.getString("regdate"));
				board.setCount(rs.getInt("count"));
				board.setRef(rs.getInt("ref"));
				board.setPos(rs.getInt("pos"));
				board.setDepth(rs.getInt("depth"));
				alist.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;
	}
	
	// 게시물 총 레코드수
	public int getTotalCount(String keyField, String keyWord) {
		int totalCount = 0;
		
		try {
			con = pool.getConnection();
			if(keyWord == null || keyWord.equals("")) {
				sql = "select count(num) from board";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "select count(num) from board where " + keyField + " like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
				totalCount = rs.getInt(1);
			
			System.out.println("totalCount : " + totalCount);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return totalCount;
	}
	
	
	// 게시물 총 레코드수
	public int getTotalCount2() {
		int totalCount = 0;
		
		try {
			con = pool.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return totalCount;
	}
}








