package day13;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {	// Database Access Object
	
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String user = "c##itbank";
	private final String password = "it";
	
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	public MemberDAO() {
		String driver = "oracle.jdbc.driver.OracleDriver";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<MemberDTO> getMemberList() {
		ArrayList<MemberDTO> list = null;
		String sql = "select * from member";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			list = new ArrayList<MemberDTO>();
			
			while(rs.next()) {
				MemberDTO m = new MemberDTO();
				m.setId(rs.getString("id"));
				m.setPw(rs.getString("pw"));
				m.setName(rs.getString("name"));
				m.setAge(rs.getInt("age"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try { if(rs != null)	rs.close(); }	catch(Exception e) {}
			try { if(stmt != null)	stmt.close(); }	catch(Exception e) {}
			try { if(conn != null)	conn.close(); }	catch(Exception e) {}
		}
		return list;
	}
	
	public MemberDTO getMember(String id) { 
		String sql = "select * from member where id='" + id +"'";
		System.out.println("SQL : " + sql);
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				MemberDTO m = new MemberDTO();
				m.setId(rs.getString("id"));
				m.setPw(rs.getString("pw"));
				m.setName(rs.getString("name"));
				m.setAge(rs.getInt("age"));
				return m;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try { if(rs != null)	rs.close(); }	catch(Exception e) {}
			try { if(stmt != null)	stmt.close(); }	catch(Exception e) {}
			try { if(conn != null)	conn.close(); }	catch(Exception e) {}
		}
		return null;
	}
}
