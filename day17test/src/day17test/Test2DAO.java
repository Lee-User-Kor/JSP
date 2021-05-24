package day17test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.sql.DataSource;

import oracle.jdbc.pool.OracleConnectionPoolDataSource;

public class Test2DAO {
	
	private OracleConnectionPoolDataSource ocpds;		// 각 회사마다 다른 커넥션 풀 데이터 소스
	private DataSource ds;								// 최종적으로 메서드가 참조할 변수
	private Connection conn;							// 연결을 잠시 저장해 둘 참조변수
	
	public Test2DAO() {
		try {
			ocpds = new OracleConnectionPoolDataSource();		// 오라클 드라이버로 연결가능한 데이터 소스 생성
			ocpds.setURL("jdbc:oracle:thin:@localhost:1521:xe");// 주소
			ocpds.setUser("c##itbank");							// 계정
			ocpds.setPassword("it");							// 비밀번호
			
			Properties props = new Properties();				// 기타 옵션을 묶어서 전달할 객체 (Map)
			props.setProperty("maxTotal", "20");				// xml에서 작성했었던 상세 옵션들
			props.setProperty("maxIdle", "10");			
			props.setProperty("maxWaitMillis", "-1");
			
			ocpds.setConnectionProperties(props);				// props객체의 내용을 ocpds에 반영한다
			
			ds = ocpds;		// 준비가 끝난 ocpds를 ds로 설정한다
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public String test() {
		String sql = "select * from v$version";
		String result = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();			// DataSource에게 Connection을 하나 받아온다
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getString(1);
				System.out.println("result : " + result);
				return result;
			}
			
		} catch (SQLException e) {
			System.out.println("test 예외 발생 : " + e);
			
		} finally {
			
			try {
				if(rs != null)		rs.close();
				if(pstmt != null) 	pstmt.close();
				if(conn != null) 	conn.close();
			} catch(Exception e) {}
		}
		return result;
	}

}
