package day14;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MemberDAO {
	
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "c##itbank";
	private String password = "it";
	
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
	
	public String join(MemberDTO joinData) {
		String sql = "insert into member values ('%s', '%s', '%s', %d)";
		sql = String.format(sql, joinData.getId(), joinData.getPw(), joinData.getName(), joinData.getAge());
		
		String result = "회원가입 실패";
		try {
			stmt = conn.createStatement();
			int row = stmt.executeUpdate(sql);
			
			if(row != 0) {
				result = "회원가입을 축하드립니다!!";
				return result;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(stmt != null) { try {stmt.close();} catch (SQLException e) {} }
			if(conn != null) { try {conn.close();} catch (SQLException e) {} }
		}
		return result;
	}
	
	public MemberDTO login(MemberDTO loginData) {
		String sql = "select * from member where id='%s' and pw='%s'";
		sql = String.format(sql, loginData.getId(), loginData.getPw());
		System.out.println("SQL : " + sql);
		MemberDTO mdto = new MemberDTO();

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				mdto.setId(rs.getString("id"));
				mdto.setPw(rs.getString("pw"));
				mdto.setName(rs.getString("name"));
				mdto.setAge(rs.getInt("age"));
				return mdto;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null)	 { try {rs.close();} 	catch (SQLException e) {} }
			if(stmt != null) { try {stmt.close();}	catch (SQLException e) {} }
			if(conn != null) { try {conn.close();}	catch (SQLException e) {} }
		}
		return mdto;
	}
	
	
	
	
	
	
	
}
