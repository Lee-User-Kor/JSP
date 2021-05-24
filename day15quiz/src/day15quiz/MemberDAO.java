package day15quiz;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class MemberDAO {
	
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String user = "c##itbank";
	private final String password = "it";
	
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	private int row;
	private ArrayList<MemberDTO> list;
	
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
	
	// 회원가입
	public int join(MemberDTO inputJoin) {
		String sql = "insert into member values ('%s', '%s', '%s', %d)";
		sql = String.format(sql, inputJoin.getId(), inputJoin.getPw(), inputJoin.getName(), inputJoin.getAge());
		
		try {
			stmt = conn.createStatement();
			row = stmt.executeUpdate(sql);
			
			if(row != 0) {
				return row;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return row;
	}
	
	// 로그인
	public MemberDTO login(MemberDTO inputLogin) {
		String sql = "select * from member where id='%s' and pw='%s'";
		sql = String.format(sql, inputLogin.getId(), inputLogin.getPw());
		MemberDTO mdto = null;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				mdto = new MemberDTO();
				mdto.setId(rs.getString("id"));
				mdto.setPw(rs.getString("pw"));
				mdto.setName(rs.getString("name"));
				mdto.setAge(rs.getInt("age"));
				
				return mdto;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null)	try {rs.close();}	catch (SQLException e) {}
			if(stmt != null)	try {stmt.close();}	catch (SQLException e) {}
			if(conn != null)	try {conn.close();}	catch (SQLException e) {}
		}
		return mdto;
	}
	
	// 정보 수정
	public int modify(MemberDTO inputModify) {
		String sql = null;
		
		if(inputModify.getPw() == null) {
			sql = "update member set name='%s', age=%d where id='%s'";
			sql = String.format(sql, inputModify.getName(), inputModify.getAge(), inputModify.getId());
		}else {
			sql = "update member set pw='%s', name='%s', age=%d where id='%s'";
			sql = String.format(sql, inputModify.getPw(), inputModify.getName(), inputModify.getAge(), inputModify.getId());
		}
		
		try {
			stmt = conn.createStatement();
			row = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(stmt != null) { try {stmt.close();} catch (SQLException e) {} }
			if(conn != null) { try {conn.close();} catch (SQLException e) {} }
		}
		return row;
	}
	
	// 회원 목록
	public ArrayList<MemberDTO> getMemberList() {
		String sql = "select * from member";
		list = new ArrayList<MemberDTO>();
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				MemberDTO mdto = new MemberDTO();
				mdto.setId(rs.getString("id"));
				mdto.setPw(rs.getString("pw"));
				mdto.setName(rs.getString("name"));
				mdto.setAge(rs.getInt("age"));
				list.add(mdto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null)	 { try {rs.close();} 	catch (SQLException e) {} }
			if(stmt != null) { try {stmt.close();}	catch (SQLException e) {} }
			if(conn != null) { try {conn.close();}	catch (SQLException e) {} }
		}
		return list;
	}
	
	// 회원탈퇴
	public int delete(MemberDTO inputDelete) {
		String sql = "delete from member where id='%s' and pw='%s'";
		sql = String.format(sql, inputDelete.getId(), inputDelete.getPw());
		
		try {
			stmt = conn.createStatement();
			row = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(stmt != null) { try {stmt.close();} catch (SQLException e) {} }
			if(conn != null) { try {conn.close();} catch (SQLException e) {} }
		}
		return row;
	}
	
	
}





















