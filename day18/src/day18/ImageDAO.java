package day18;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ImageDAO {
	
	// DataSource 사용할거니까 Context.xml과 web.xml을 먼저 구성하자
	private Connection conn;
	private Context init;
	private DataSource ds;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int row;
	private static ImageDAO instance;
	
	public static ImageDAO getInstance() {
		if(instance == null) {
			instance = new ImageDAO();
		}
		return instance;
	}
	private ImageDAO() {
		try {
			init = (Context) new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			System.out.println("생성자 예외 발생 : " + e);
		} finally {
			if(conn != null) try { conn.close(); } catch (Exception e) {}
		}
	}
	private void close() {
		try {
			if(rs != null) {
				rs.close();
				rs = null;
			}
			if(pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
			if(conn != null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			System.out.println("close : " + e);
		}
	}
	public int insert(ImageDTO dto) {
		String sql = "insert into image values (image_seq.nextval, ?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getOriginalFileName());
			pstmt.setString(2, dto.getStoredFileName());
			row = pstmt.executeUpdate();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { close(); }
		return row;
	}
	public List<ImageDTO> selectList() {
		ArrayList<ImageDTO> list = null;
		String sql = "select * from image order by idx";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list = new ArrayList<ImageDTO>();
			while(rs.next()) {
				ImageDTO dto = new ImageDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setOriginalFileName(rs.getString("originalFileName"));
				dto.setStoredFileName(rs.getString("storedFileName"));
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("selectList : " + e);
		} finally {	close(); }
		return list;
	}
	
	
	
}
