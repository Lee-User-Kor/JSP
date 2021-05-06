package day12;

import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.DriverManager;

public class HumanDAO {	// Human 테이블의 데이터에 접근하는 객체
						// Database Access Object
	
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String user = "c##itbank";
	private final String password = "it";
	
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	public HumanDAO() {
		String driver = "oracle.jdbc.driver.OracleDriver";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			System.out.println("DAO 생성자 예외 : " + e);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 클래스르 불러올 수 없음 : " + e);
		}
	}
	
	// ${dao.humanList } => dao.getHumanList()
	
	public ArrayList<Human> getHumanList() {
		String sql = "select * from human";
		ArrayList<Human> list = null;
		list = new ArrayList<Human>();
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Human h = new Human();
				h.setAge(rs.getInt("age"));
				h.setName(rs.getString("name"));
				list.add(h);
			}
			return list;
		} catch(SQLException e) {
			System.out.println("getHumanList : " + e);
		} finally {	// 예외 발생 여부에 상관없이 반드시 실행되는 코드
			try { if(rs != null)	 rs.close(); } 		catch(Exception e) {}
			try { if(stmt != null)	 stmt.close(); }	catch(Exception e) {}
			try { if(conn != null) 	conn.close(); }		catch(Exception e) {}
		}
		return list;
	}
}
