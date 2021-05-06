<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>
</head>
<body>

<h1>ex03.jsp - human 테이블 내용 불러오기</h1>
<hr>
<%@ page import="java.sql.*" %>
<%@ page import="day12.Human"%>
<%@ page import="java.util.ArrayList"%>
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "c##itbank";
	String password = "it";
	String sql = "select * from human";
	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, password);
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	// 이 시점에서 DB에 있는 데이터가 자바로 이미 넘어와 있음
	// 이후는 불러온 데이터를 어떻게 화면에 출력할 것인가에 대한 내용
	
	ArrayList<Human> list = new ArrayList<Human>();
	
	while(rs.next()) {	// 3번 반복될 예정
		String name = rs.getString("name");	// name 컬럼의 값을 문자열로 반환
		int age = rs.getInt("age");			// age 컬럼의 값을 정수로 반환
		Human h = new Human();				// 비어있는 객체를 생성하고
		h.setName(name);					// DB에서 불러온 이름을 빈 객체에 채워넣고
		h.setAge(age);						// DB에서 불러온 나이를 빈 객체에 채워넣고
		list.add(h);
	}
	pageContext.setAttribute("list", list);
	// 실제로는 역순으로 close 해야겠지만 생략...
	
	rs.close();
	stmt.close();
	conn.close();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table border="3" cellpadding="10" cellspacing="0" align="center" width="500px">
	<tr>
		<th>이름</th>
		<th>나이</th>
	</tr>
	<c:forEach var="human" items="${list }">
		<tr>
			<td>${human.name }</td>
			<td>${human.age }</td>
		</tr>
	</c:forEach>
</table>










</body>
</html>