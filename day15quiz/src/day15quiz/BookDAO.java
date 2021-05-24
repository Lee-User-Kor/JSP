package day15quiz;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class BookDAO {
	
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String user = "c##itbank";
	private final String password = "it";
	
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	private int row;
	private ArrayList<Book> list;
	
	public BookDAO() {
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
	
	
	// 목록
	public ArrayList<Book> list() {
		String sql = "select * from book";
		list = new ArrayList<Book>();
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Book b = new Book();
				b.setName(rs.getString("name"));
				b.setWriter(rs.getString("writer"));
				b.setPublisher(rs.getString("publisher"));
				b.setWrittenDate(rs.getString("writtenDate"));
				b.setCount(rs.getInt("count"));
				list.add(b);
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
	
	// 수정 전 찾고 세션저장
	public Book find(Book inputList) {
		String sql = "select * from book where name='%s' and writer='%s'";
		sql = String.format(sql, inputList.getName(), inputList.getWriter());
		Book b = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				b = new Book();
				b.setName(rs.getString("name"));
				b.setWriter(rs.getString("writer"));
				b.setPublisher(rs.getString("publisher"));
				b.setWrittenDate(rs.getString("writtendate"));
				b.setCount(rs.getInt("count"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null)	 { try {rs.close();} 	catch (SQLException e) {} }
			if(stmt != null) { try {stmt.close();}	catch (SQLException e) {} }
			if(conn != null) { try {conn.close();}	catch (SQLException e) {} }
		}
		return b;
	}
	
	// 수정
	public int modify(Book inputModify, Book whatBook) {
		String sql = "update book set name='%s', writer='%s', publisher='%s',"
					+ " writtendate='%s', count=%d where name='%s'";
		sql = String.format(sql, inputModify.getName(), inputModify.getWriter(), inputModify.getPublisher(),
					inputModify.getWrittenDate(), inputModify.getCount(), whatBook.getName());
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
	
	// 삭제
	public int delete(Book whatBook) {
		String sql = "delete from book where name='%s' and writer='%s'";
		sql = String.format(sql, whatBook.getName(), whatBook.getWriter());
		
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
	
	// 추가
	public int add(Book inputAdd) {
		String sql = "insert into book values ('%s', '%s', '%s', '%s', %d)";
		sql = String.format(sql, inputAdd.getName(), inputAdd.getWriter(), inputAdd.getPublisher(),
				inputAdd.getWrittenDate(), inputAdd.getCount());
		
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













