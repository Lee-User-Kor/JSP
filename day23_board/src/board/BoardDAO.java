package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

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
	
	// 게시글의 목록을 불러와서 리스트 형태로 반환하는 메서드
	public HashMap<String, Object> selectList(int page) {
		return selectList(page, null, null);
	}

	// 조건을 전달받아서, 조건에 맞는 리스트를 반환하는 메서드
	public HashMap<String, Object> selectList(int page, String type, String word) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		// 기본 쿼리문
		String sql = "select * from board where deleted='n' %s order by idx desc";
		boolean flag = type != null && word != null;	// 검색 쿼리를 적용할 조건
		String search = String.format("and %s like '%%%s%%'", type, word);
		sql = String.format(sql, flag ? search : "");
		
		// 페이징 쿼리문
		String offsetSql = " offset %d rows fetch first %d rows only";
		int boardCount = boardCount(sql);	// 조건에 맞는 레코드의 개수를 구하기
		Paging pag = new Paging(page, boardCount);
		offsetSql = String.format(offsetSql, pag.getOffset(), pag.getPerPage());
		sql += offsetSql;
		
//		System.out.println(boardCount);
		System.out.println(sql);
		
		ArrayList<BoardDTO> list = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<BoardDTO>();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setContent(rs.getString("content"));
				dto.setDeleted(rs.getString("deleted"));
				dto.setIdx(rs.getInt("idx"));
				dto.setIpaddr(rs.getString("ipaddr"));
				dto.setTitle(rs.getString("title"));
				dto.setUploadFile(rs.getString("uploadFile"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setWriteDate(rs.getString("writeDate"));
				dto.setWriter(rs.getString("writer"));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("selectList : " + e);
		} finally { close(); }
		
		map.put("boardList", list);
		map.put("paging", pag);
		
		return map;
	}
	
	// idx로 글을 하나 불러오는 메서드
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
				dto.setIpaddr(rs.getString("ipaddr"));
				dto.setTitle(rs.getString("title"));
				dto.setUploadFile(rs.getString("uploadFile"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setWriteDate(rs.getString("writeDate"));
				dto.setWriter(rs.getString("writer"));
			}
			
		} catch (SQLException e) {
			System.out.println("selectOne : " + e);
		} finally { close(); }
		
		return dto;
	}
	
	// dto를 전달받아서 DB에 insert 하는 메서드
	public int insert(BoardDTO dto) {
		int row = 0;
		String sql = "insert into board "
				+ "(idx, title, writer, content, ipaddr, uploadFile) "
				+ "values (board_seq.nextval, ?, ?, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getIpaddr());
			pstmt.setString(5, dto.getUploadFile() == null ? "default.jpg" : dto.getUploadFile());
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("insert : " + e);
		} finally { close(); }
		
		return row;
	}

	// idx를 전달받아서 삭제 처리(update)하는 메서드
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

	// dto를 전달받아서 내용을 수정하고 row를 반환하는 메서드
	public int modify(BoardDTO dto) {
		int row = 0;
//		String writeDate = new SimpleDateFormat("yyyy-MM-dd a hh:mm").format(new Date());
		String writeDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
		// hh 는 0 ~ 12, HH는 0 ~ 23, a : 오전 오후
		boolean flag = dto.getUploadFile() == null;
		String sql = "update board set "
				+ "title=?"
				+ ",writer=?"
				+ ",content=?"
				+ ",writeDate=?"	
				+ ",ipaddr=?"
				+ (flag ? "" : ",uploadFile=? ")
				+ "where idx=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, writeDate);
			pstmt.setString(5, dto.getIpaddr());
			if(flag == false)	
				pstmt.setString(6, dto.getUploadFile());
			pstmt.setInt(flag ? 6 : 7, dto.getIdx());
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("modify : " + e);
		} finally { close(); }
		
		return row;
	}

	// idx를 전달받아서 viewCount를 1증가시키는 메서드
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
	
	public int insertReply(ReplyDTO reply) {
		
		int row = 0;
		String sql = "insert into reply (idx, bnum, writer, content)" + 
				"    values (reply_seq.nextval, ?, ?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reply.getBnum());
			pstmt.setString(2, reply.getWriter());
			pstmt.setString(3, reply.getContent());
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("insertReply : " + e);
		} finally { close(); }
		
		return row;
	}
	
	public List<ReplyDTO> selectReplyList(int bnum) {
		List<ReplyDTO> list = null;
		String sql = "select * from reply where bnum=? order by idx";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			rs = pstmt.executeQuery();
			list = new ArrayList<ReplyDTO>();
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
			System.out.println("selectReplyList : " + e);
		} finally { close(); }
		
		return list;
	}
	
	public int deleteReply(int bnum, int idx) {
		int row = 0;
		String sql = "delete from reply where bnum=? and idx=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			pstmt.setInt(2, idx);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return row;
	}
	
	
}










