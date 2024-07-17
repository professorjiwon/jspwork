package ch06;

import java.sql.*;
import java.util.ArrayList;

public class EmpBeanDBPool7 {
	private DBConnectionMgr pool = null;
	
	public EmpBeanDBPool7() {
		pool = DBConnectionMgr.getInstance(); 
	}
	
	public ArrayList<EmpBean> getList() {
		ArrayList<EmpBean> alist = new ArrayList<EmpBean>();
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			st = con.createStatement();
			rs = st.executeQuery("select emp_id,emp_name,email,phone,job_name"
								+ " from employee, job"
								+ " where employee.job_code = job.job_code");
			while(rs.next()) {
				EmpBean bean = new EmpBean();
				bean.setEmp_id(rs.getString("emp_id"));
				bean.setEmp_name(rs.getString("emp_name"));
				bean.setEmail(rs.getString("email"));
				bean.setPhone(rs.getString("phone"));
				bean.setJob_name(rs.getString("job_name"));
				alist.add(bean);
			}
		} catch (Exception e) {                                                         
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;
	}

}
