package day12;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DBTest {
	
	private static final String driver = "oracle.jdbc.driver.OracleDriver";
	private static final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String user = "c##itbank";
	private static final String password = "it";
	
	private static Connection conn;
	private static Statement stmt;
	private static ResultSet rs;
	
	public static void main(String[] args) {							// Java DataBase Connectivity, JDBC
		
		String sql = "select * from v$version";
		ArrayList<Object> list = new ArrayList<Object>();
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				String banner = rs.getString(1);						// 값의 순번(인덱스) 를 넣어서 불러도 되고
				String banner_full = rs.getString("banner_full");		// 값의 이름(컬럼이름)을 넣어서 불러와도 된다
				String banner_lagacy = rs.getString("banner_legacy");	// 문자열을 불러오려면 getString()
				int con_id = rs.getInt("con_id");						// 정수 값을 불러오려면 getInt()
				
				list.add(banner);
				list.add(banner_full);
				list.add(banner_lagacy);
				list.add(con_id);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {														// 접속 여부에 상관없이 꼭 마무리를 해주자. 마무리가 안되면 다음 접속시 접속이 안될수도 있다
			try {
				if(rs != null)		rs.close();
				if(stmt != null)	stmt.close();
				if(conn != null)	conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	// try ~ catch ~ finally
		
		list.forEach(System.out::println);
	}
}
