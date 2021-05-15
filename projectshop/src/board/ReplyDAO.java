package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ReplyDAO {
	
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Context init;
	private static final ReplyDAO instance = new ReplyDAO();
	
	public static ReplyDAO getInstance() {
		return instance;
	}
	
	private ReplyDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			System.out.println("생성자 예외 발생 : " + e);
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
	
	public int insert(ReplyDTO dto) {
		int row = 0;
		String sql = "insert into reply (bnum, idx, writer, content) values (?, reply_seq.nextval, ?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBnum());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getContent());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insert : "+e);
		} finally { close(); }
		return row;
	}
	
	public ArrayList<ReplyDTO> replyList(int bnum) {
		ArrayList<ReplyDTO> list = new ArrayList<ReplyDTO>();
		String sql = "select * from reply where bnum=? order by idx desc";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReplyDTO dto = new ReplyDTO();
				dto.setBnum(rs.getInt("bnum"));
				dto.setContent(rs.getString("content"));
				dto.setIdx(rs.getInt("idx"));
				dto.setWriteDate(rs.getString("writeDate"));
				dto.setWriter(rs.getString("writer"));
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("replyList : "+e);
		} finally { close(); }
		
		return list;
	}
	
	public int delete(int idx) {
		int row = 0;
		String sql = "delete from reply where idx=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,idx);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("delete : "+e);
		} finally { close(); }
		
		return row;
	}
	
	public int modify(ReplyDTO dto) {
		int row = 0;
		String sql = "update reply set content=? where idx=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getContent());
			pstmt.setInt(2, dto.getIdx());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("modify : " + e);
		} finally { close(); }
		
		
		return row;
		
	}
	
	

}



















