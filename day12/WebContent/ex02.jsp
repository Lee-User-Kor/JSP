<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp</title>
</head>
<body>

<h1>ex02.jsp - Database 접속 여부 확인하기 (버전 확인)</h1>
<hr>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%
	String ip = "localhost";
	int port = 1521;
	String url = "jdbc:oracle:thin:@" + ip + ":" + port + ":xe";
	String driver = "oracle.jdbc.driver.OracleDriver";
	String user = "c##itbank";
	String password = "it";
	String sql = "select * from v$version";
	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, password); 
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()) {	// 여러줄을 포함하면 한줄씩 처리
		String data = rs.getString(1);
		pageContext.setAttribute("data", data);
	}
%>
<ul>
	<li>${data }</li>
</ul>



</body>
</html>