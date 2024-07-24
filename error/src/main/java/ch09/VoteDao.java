package ch09;

import java.sql.*;
import java.util.*;

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
			sql = "insert into votelist values(seq_vote.nextval,?,?,?,sysdate,?,default)";  // nextval = 1
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vlist.getQuestion());  
			pstmt.setString(2, vlist.getSdate());
			pstmt.setString(3, vlist.getEdate());
			pstmt.setInt(4, vlist.getType());     // ?에 들어가는 값들
			
			int result = pstmt.executeUpdate();
			
			int result2 = 0;
			if(result == 1) {
				sql = "insert into voteitem values(seq_vote.currval,?,?,default)";     // currval = 1
				pstmt = con.prepareStatement(sql);
				
				String item[] = vitem.getItem();
				for(int i=0; i<item.length; i++) {
					if(item[i] == null || item[i].equals(""))
						break;
					pstmt.setInt(1, i);  // 0부터는 i, 1부터는 i+1
					pstmt.setString(2, item[i]);
					
					result2 = pstmt.executeUpdate();    // 업데이트 잘 되면 1, 안되면 0
				}
			}
			
			if(result2 == 1) {    // 두개의 값 모두 1이 반환되어야 문제 없이 수행된 것으로 true
				flag = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return flag;
		
	}
	
	// 설문폼(투표하기)에 넣을 질문 1개 가져오기
	public VoteList getOneVote(int num) {
		VoteList vlist = new VoteList();
		
		try {
			con = pool.getConnection();
			if(num == 0) 
				sql ="select * from votelist order by num desc";   // getMaxNum() 호출 가능
			else
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
	
	public int getMaxNum() {
		int max = 0;
		try {
			con = pool.getConnection();
			sql = "select max(num) from votelist";
			rs = con.createStatement().executeQuery(sql);
			if(rs.next()) {
				max = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return max;		
	}
	
	// 설문폼(투표하기)에 넣을 item들 가져오기
	public ArrayList<String> getItem(int num) {
		ArrayList<String> alist = new ArrayList<String>();
		
		try {
			con = pool.getConnection();
			if(num == 0) {
				num = getMaxNum();
			}
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
	
	public ArrayList<VoteList> getList() {
		ArrayList<VoteList> alist = new ArrayList<VoteList>();
		try {
			con = pool.getConnection();
			sql = "select * from votelist order by num desc";
			rs = con.createStatement().executeQuery(sql);
			while(rs.next()) {
				VoteList vlist = new VoteList();
				vlist.setNum(rs.getInt(1));   // 1 자리에 num 넣줘도 됨
				vlist.setQuestion(rs.getString(2));
				vlist.setSdate(rs.getString(3));
				vlist.setEdate(rs.getString(4));
				alist.add(vlist);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return alist;
	}
	
	// 투표시 count증가
	public boolean updateCount(int num, String[] itemnum) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "update voteitem set count = count+1 where listnum=? and itemnum=?";
			pstmt = con.prepareStatement(sql);
			if(num == 0)
				num = getMaxNum();
			
			for(int i=0; i<itemnum.length; i++) {
				if(itemnum[i] == null || itemnum[i].equals(""))
					break;
				pstmt.setInt(1, num);
				pstmt.setInt(2, Integer.parseInt(itemnum[i]));
				// int result = pstmt.executeUpdate();   // 상태가 변하는 것은 .executeUpdate()를 사용
				if(pstmt.executeUpdate() == 1)
					flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return flag;
	}
	
	// listnum에 해당하는 전체 count 가져오기
	public int sumCount(int num) {
		int count = 0;
		
		try {
			con = pool.getConnection();
			sql = "select sum(count) from voteitem where listnum=?";
			pstmt = con.prepareStatement(sql);
			if(num == 0)
				pstmt.setInt(1, getMaxNum());
			else
				pstmt.setInt(1, num);
			
			System.out.println("DB num : " + num);
			rs = pstmt.executeQuery();
			if(rs.next())
				count = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return count;
	}
	
	// listnum에 해당하는 각 item의 count 얻어오기
	public ArrayList<VoteItem> getView(int num) {
		ArrayList<VoteItem> alist = new ArrayList<VoteItem>();
		
		try {
			con = pool.getConnection();
			sql = "select item, count from voteitem where listnum=?";
			pstmt = con.prepareStatement(sql);
			
			if(num == 0)
				pstmt.setInt(1, getMaxNum());
			else
				pstmt.setInt(1, num);
		
			rs = pstmt.executeQuery();
			while(rs.next()) {
				VoteItem vitem = new VoteItem();
				String item[] = new String[1];   // 맞춰서 들어가야 되기 때문에 1자리여도 배열로 만들어준 것
				item[0] = rs.getString(1);
				
				vitem.setItem(item);
				vitem.setCount(rs.getInt(2));
				alist.add(vitem);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;
	}
}
