<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>

<h1>ex01.jsp - database 접속 확인</h1>
<hr>
<%@ page import="java.sql.Connection, java.sql.Statement, java.sql.ResultSet" %>
<%
	String driver = "oracle.jdbc.driver.OracleDriver";						// 어떤 드라이버 클래스를 사용하는지
	String url = "jdbc:oracle:thin:@localhost:1521:xe";						// 어떤 DB에 접속하는지 (IP, Port, ServiceName)
	String user = "c##itbank";												// 어떤 계정으로 접속하는지
	String password = "it";													// 계정의 비밀번호가 무엇인지
	String sql = "select sysdate from dual";								// 접속해서 어떤 명령어를 실행할 것인지
	
	Class.forName(driver);													// 지정한 드라이버 클래스를 메모리에 불러온다
	Connection conn = DriverManager.getConnection(url, user, password);		// 접속(연결 생성)
	Statement stmt = conn.createStatement();								// 연결 상태 불러오기 (현재 상태가 정상이면 명령을 전달할것임)
	ResultSet rs = stmt.executeQuery(sql);									// 명령을 전달해서 결과목록을 받아옴
	
	out.print("<ul>");														
	while(rs.next()) {														// 결과에 다음줄이 있으면
		String data = rs.getString(1);										// 다음 줄에서 1번째 문자열을 하나 가져온다
		out.print("<li>" + data +"</li>");									// 가져온 문자열을 태그 사이에 넣어서 화면에 출력한다
	}																		// 반복문 끝
	out.print("</ul>");
	
	rs.close();																// 생성한 역순으로 객체를 닫아준다
	stmt.close();
	conn.close();
%>






</body>
</html>