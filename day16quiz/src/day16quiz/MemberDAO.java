package day16quiz;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {

	private Connection conn;
	private Context init;
	private DataSource ds;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int row;
	private static MemberDAO instance;
	
	private MemberDAO() {
		try {
			init = (Context) new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		} finally {
			if(conn != null) try { conn.close(); } catch (Exception e) {}
		}
	}
	
	
	public static MemberDAO getInstance() {
		if(instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}
	
	
	public ArrayList<MemberDTO> getList() {
		String sql = "select * from member order by idx";
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		MemberDTO mdto;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				mdto = new MemberDTO();
				mdto.setIdx(rs.getInt("idx"));
				mdto.setUserId(rs.getString("userid"));
				mdto.setUserPw(rs.getString("userpw"));
				mdto.setUserName(rs.getString("username"));
				mdto.setAge(rs.getInt("age"));
				mdto.setGender(rs.getString("gender"));
				mdto.setRegistDate(rs.getDate("registdate"));
				list.add(mdto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)		rs.close();
				if(pstmt != null)	pstmt.close();
				if(conn != null)	conn.close();
			} catch (Exception e) {}
		}
		return list;
	}
	
	public int join(MemberDTO inputJoin) {
		String sql = "insert into member (idx, userid, userpw, username, age, gender) values"
				+ " (member_seq.nextval, '%s', '%s', '%s', %d, '%s')";
		sql = String.format(sql, inputJoin.getUserId(), inputJoin.getUserPw(), inputJoin.getUserName(),
				inputJoin.getAge(), inputJoin.getGender());
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)	pstmt.close();
				if(conn != null)	conn.close();
			} catch (Exception e) {}
		}
		return row;
	}
	
	public MemberDTO login(MemberDTO inputLogin) {
		String sql = "select * from member where userid=? and userpw=?";
		MemberDTO mdto = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputLogin.getUserId());
			pstmt.setString(2, inputLogin.getUserPw());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				mdto = new MemberDTO();
				mdto.setIdx(rs.getInt("idx"));
				mdto.setUserId(rs.getString("userid"));
				mdto.setUserPw(rs.getString("userpw"));
				mdto.setUserName(rs.getString("username"));
				mdto.setAge(rs.getInt("age"));
				mdto.setGender(rs.getString("gender"));
				mdto.setRegistDate(rs.getDate("registdate"));
				return mdto;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)		rs.close();
				if(pstmt != null)	pstmt.close();
				if(conn != null)	conn.close();
			} catch (Exception e) {}
		}
		return mdto;
	}
	
	public int modify(MemberDTO inputModify) {
		String sql = null;
		if(inputModify.getUserPw() == null) {
			sql = "update member set username=?, age=?, gender=? where userid=?";
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, inputModify.getUserName());
				pstmt.setInt(2, inputModify.getAge());
				pstmt.setString(3, inputModify.getGender());
				pstmt.setString(4, inputModify.getUserId());
				row = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if(pstmt != null)	pstmt.close();
					if(conn != null)	conn.close();
				} catch (Exception e) {}
			}
		}else {
			sql = "update member set userpw=?, username=?, age=?, gender=? where userid=?";
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, inputModify.getUserPw());
				pstmt.setString(2, inputModify.getUserName());
				pstmt.setInt(3, inputModify.getAge());
				pstmt.setString(4, inputModify.getGender());
				pstmt.setString(5, inputModify.getUserId());
				row = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if(pstmt != null)	pstmt.close();
					if(conn != null)	conn.close();
				} catch (Exception e) {}
			}
		}
		return row;
	}
	
	public int delete(MemberDTO inputDelete) {
		String sql = "delete member where userid=? and userpw=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputDelete.getUserId());
			pstmt.setString(2, inputDelete.getUserPw());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)	pstmt.close();
				if(conn != null)	conn.close();
			} catch (Exception e) {}
		}
		return row;
	}
	
}
