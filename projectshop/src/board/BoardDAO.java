package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {
	// DataSource, Singleton
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Context init;
	private static final BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	private BoardDAO() {
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
	public HashMap<String, Object> boardList(int page) {
		return boardList(page, null, null);
	}
	
	public HashMap<String, Object> boardList(int page, String type, String word) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String sql = "select * from board where deleted='n' %s order by idx desc";
		boolean flag = type != null && word != null;
		String search = String.format("and %s like '%%%s%%'", type, word);
		sql = String.format(sql, flag ? search : "");
		
		// 페이징 쿼리문
		String offsetSql = " offset %d rows fetch first %d rows only";
		int boardCount = boardCount(sql);	// 조건에 맞는 레코드의 개수를 구하기
		Paging pag = new Paging(page, boardCount);
		offsetSql = String.format(offsetSql, pag.getOffset(), pag.getPerpage());
		sql += offsetSql;
		
		System.out.println(sql);
		
		ArrayList<BoardDTO> list = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			list = new ArrayList<BoardDTO>();
			while(rs.next()) {
				BoardDTO bdto = new BoardDTO();
				bdto.setIdx(rs.getInt("idx"));
				bdto.setTitle(rs.getString("title"));
				bdto.setWriter(rs.getString("writer"));
				bdto.setContent(rs.getString("content"));
				bdto.setWriteDate(rs.getString("writedate"));
				bdto.setViewCount(rs.getInt("viewcount"));
				bdto.setUploadFile(rs.getString("uploadfile"));
				bdto.setDeleted(rs.getString("deleted"));
				bdto.setSecretNum(rs.getString("secretnum"));
				bdto.setSecretCheck(rs.getString("secretcheck"));
				list.add(bdto);
				
			}
		
		} catch (SQLException e) {
			System.out.println("boardList : " + e);
		} finally { close(); }
		
//		for(BoardDTO dto : list) {
//			System.out.println(dto.getTitle());
//		}
		
		map.put("boardList", list);
		map.put("paging", pag);
		
		return map;
	}
	
	// 총 게시글의 개수를 int로 반환하는 메서드
		public int boardCount(String subquery) {
			int count = 0;
			String sql = subquery.replace("*", "count(*)");
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					return rs.getInt(1);
				}
			} catch (SQLException e) {
				System.out.println("boardCount : " + e);
			} finally { close(); }
			
			return count;
		}
	
	public int insert(BoardDTO dto) {
		int row = 0;
		String sql = "insert into board "
				+ "(idx, title, writer, content, uploadFile, secretnum, secretcheck) "
				+ "values (board_seq.nextval, ?, ?, ?, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getUploadFile());
			pstmt.setString(5, dto.getSecretNum());
			pstmt.setString(6, dto.getSecretCheck());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return row;
	}
	
	// read / modify
	
	public BoardDTO selectOne(int idx) {
		
		BoardDTO dto = null;
	    String sql = "select * from board where idx=?";
	      
	      try {
	         conn = ds.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, idx);
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	            dto = new BoardDTO();
	            dto.setContent(rs.getString("content"));
	            dto.setDeleted(rs.getString("deleted"));
	            dto.setIdx(rs.getInt("idx"));
	            dto.setTitle(rs.getString("title"));
	            dto.setUploadFile(rs.getString("uploadFile"));
	            dto.setViewCount(rs.getInt("viewCount"));
	            dto.setWriteDate(rs.getString("writeDate"));
	            dto.setWriter(rs.getString("writer"));
	            dto.setSecretNum(rs.getString("secretNum"));
	            dto.setSecretCheck(rs.getString("secretCheck"));
	         }
	      } catch (SQLException e) {
	         System.out.println("selectOne : " + e);
	      } finally { close(); }
	      
	      return dto;
		
		
	}
	
	// 조회수
	public int viewCount(int idx) {
		int row = 0;
		String sql = "update board set viewCount = viewCount + 1 where idx = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("viewCount : " + e);
		} finally { close(); }
		
		return row;
	}

	// 삭제
	public int delete(int idx) {
		int row = 0;
		String sql = "update board set deleted='y' where idx=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("delete : " + e);
		} finally { close(); }
		
		return row;
	}
	
	public String nowDate() {
		String modifyDate = "%s";
		modifyDate = String.format(modifyDate, new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
				
		return modifyDate;
	}
	
	public int modify(BoardDTO dto) {
		boolean flag = dto.getUploadFile() == null;
		int row = 0;
		String sql = "update board set title=?, writedate=?, content=?"
				+ (flag ? "" : ", uploadFile=? ")
				+ "where idx=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getWriteDate());
			pstmt.setString(3, dto.getContent());
			if(flag == false) {
				pstmt.setString(4, dto.getUploadFile());
			}
			pstmt.setInt(flag ? 4 : 5, dto.getIdx());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return row;
	}
	
	
	
	
}