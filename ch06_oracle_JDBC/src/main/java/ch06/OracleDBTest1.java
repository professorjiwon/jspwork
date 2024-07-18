package ch06;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class OracleDBTest1 {
	public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			/* mysql사용시
				Class.forName("com.mysql.jdbc.Driver");
				("jdbc:mysql://localhost:3306","db이름","db의 비밀번호)
			*/
			/* mariadb 사용시
				Class.forName("org.mariadb.jdbc.Driver");
				("jdbc:mariadb://localhost:3306","db이름","db의 비밀번호)
			 */
			Connection con = DriverManager.getConnection
					("jdbc:oracle:thin:@localhost:1521:xe","tjoeun","1234");
			System.out.println("Success");
		} catch (SQLException e) {
			System.out.println("접속오류");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 오류");
		}

	}
}
