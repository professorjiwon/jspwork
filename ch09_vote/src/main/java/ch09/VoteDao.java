package ch09;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class VoteDao {
	private DBConnectionMgr pool;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public VoteDao() {
		pool = DBConnectionMgr.getInstance();
	}
	
	// 설문 등록하기
	public boolean voteInsert(VoteList vlist, VoteItem vitem) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert into votelist values(seq_vote.nextval,?,?,?,sysdate,?,default)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vlist.getQuestion());
			pstmt.setString(2, vlist.getSdate());
			pstmt.setString(3, vlist.getEdate());
			pstmt.setInt(4, vlist.getType());
			
			int result = pstmt.executeUpdate();
			
			int result2 = 0;
			if(result == 1) {
				sql = "insert into voteitem values(seq_vote.currval,?,?,default)";
				pstmt = con.prepareStatement(sql);
				
				String item[] = vitem.getItem();
				for(int i=0; i<item.length; i++) {
					if(item[i] == null || item[i].equals(""))
						break;
					pstmt.setInt(1, i);
					pstmt.setString(2, item[i]);
					result2 = pstmt.executeUpdate();
				}
			}
			
			if(result2 == 1)
				flag = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return flag;
	}
	
	// 설문폼(투표하기)에 넣을 질문1개 가져오기
	public VoteList getOneVote(int num) {
		VoteList vlist = new VoteList();
		
		try {
			con = pool.getConnection();
			sql = "select * from votelist where num=" + num;
			rs = con.createStatement().executeQuery(sql);
			if(rs.next()) {
				vlist.setQuestion(rs.getString("question"));
				vlist.setType(rs.getInt("Type"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return vlist;
	}
	
	// 설문폼(투표하기)에 넣을 item들 가져오기
	public ArrayList<String> getItem(int num) {
		ArrayList<String> alist = new ArrayList<String>();
		
		try {
			con = pool.getConnection();
			sql = "select item from voteitem where listnum=" + num;
			rs = con.createStatement().executeQuery(sql);
			while(rs.next()) {
				alist.add(rs.getString(1));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;
	}
}










