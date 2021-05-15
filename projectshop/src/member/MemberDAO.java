package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Context init;
	private DataSource ds;
	private static final MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
	
		return instance;
	}
	
	private MemberDAO() {
		
		try {
			init = (Context) new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch(Exception e) {
			System.out.println("생성자 예외 발생 !!");
		} finally {
			if(conn != null) try { conn.close(); } catch(Exception e) {}
		}
	}
	
	
	private void close() {
		try {
			if(rs != null)		{		rs.close();		rs = null;			}
			if(pstmt != null) 	{		pstmt.close();	pstmt = null;		}
			if(conn != null)	{		conn.close();	conn = null;		}
		} catch (SQLException e) {
			System.out.println("close : " + e);
		}
	}

	public int insert(MemberDTO dto) {
		int row = 0;
		boolean flag = 0 != dto.getPostcode();	// 주소가 있으면 true
		String sql = "insert into member (idx, id, pw, name, tel1, tel2, tel3"
				+ ( flag ? ",postcode, post)" : ")" )
				+ " values ( member_seq.nextval, ?, ?, ?, ?, ?, ?"
				+ (flag ? ", ?, ?)" : ")");
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getTel1());
			pstmt.setString(5, dto.getTel2());
			pstmt.setString(6, dto.getTel3());
			if(flag) {
				pstmt.setInt(7, dto.getPostcode());
				pstmt.setString(8, dto.getPost());
			}
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insert : " + e);
		} finally { close(); }
		return row;
	}
	
	
	public MemberDTO login(MemberDTO input) {
		MemberDTO dto = null;
		String sql = "select * from member where id=? and pw=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, input.getId());
			pstmt.setString(2, input.getPw());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = new MemberDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setPostcode(rs.getInt("postcode"));
				dto.setPost(rs.getString("post"));
				dto.setTel1(rs.getString("tel1"));
				dto.setTel2(rs.getString("tel2"));
				dto.setTel3(rs.getString("tel3"));
			}
		} catch (Exception e) {
			System.out.println("login : " + e);
			e.printStackTrace();
		} finally { close(); }

		return dto;
		
		
	}
	
	public String searchM(String writer) {
		String icon = "";
		String sql = "select id from member where id=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				icon = rs.getString("id");
			}
		} catch (SQLException e) {
			System.out.println("searchM : " + e);
		} finally { close(); }
		return icon;
	}
	
	public int modify(MemberDTO dto,String beforepw) {
		if(dto.getPw() == null) {
			dto.setPw(beforepw);
		}
		return modify(dto);
	}
	
	public int modify(MemberDTO dto) {
		int row = 0;
		String sql = "update member set postcode=?, post=?, tel1=?, tel2=?, tel3=?, pw=? where idx=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getPostcode());
			pstmt.setString(2, dto.getPost());
			pstmt.setString(3, dto.getTel1());
			pstmt.setString(4, dto.getTel2());
			pstmt.setString(5, dto.getTel3());
			pstmt.setString(6,dto.getPw());
			pstmt.setInt(7, dto.getIdx());
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("Modify : " + e);
		} finally { close(); }
		return row;
	}
	

}










