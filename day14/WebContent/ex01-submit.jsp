<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01-submit.jsp</title>
</head>
<body>
<%@ page import="java.sql.*, day14.*" %>
<jsp:useBean id="user" class="day14.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>
<%
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
// 	String sql = "insert into member values ('%s', '%s', '%s', %d)";
// 	sql = String.format(sql, user.getId(), user.getPw(), user.getName(), user.getAge());
	
// 	System.out.println("SQL : " + sql);
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection(url, "c##itbank", "it");
// 	Statement stmt = conn.createStatement();
// 	int row = stmt.executeUpdate(sql);		// select가 아니면   stmt.excuteUpdate() 메서드 (int)
											// select이면		stmt.excuteQuery()  메서드 (ResultSet)
											
	// 미리 준비된  sql에 값을 순서대로 넣을 수 있도록 처리하는 클래스 PreparedStatement
	String sql = "insert into member values (?, ?, ?, ?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, user.getId());		// setString이면 문자열 따옴표 처리를 자동으로 수행한다
	pstmt.setString(2, user.getPw());
	pstmt.setString(3, user.getName());
	pstmt.setInt(4, user.getAge());			// setInt이면 따옴표 처리를 하지 않는다
	
	int row = pstmt.executeUpdate();	
	System.out.println("row : " + row);
	
	String result = "추가 실패";
	if(row != 0) {
		result = "추가 성공!!";
	}
%>
<h2><%=result %></h2>

</body>
</html>