<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*, day14.MemberDTO" %>
<jsp:useBean id="user" class="day14.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>
<%
	request.setCharacterEncoding("UTF-8");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String sql = "select * from member where id='%s' and pw='%s'";
	sql = String.format(sql, user.getId(), user.getPw());
	System.out.println("SQL:" + sql);
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection(url, "c##itbank", "it");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()) {
		MemberDTO mdto = new MemberDTO();
		mdto.setId(rs.getString("id"));
		mdto.setPw(rs.getString("pw"));
		mdto.setName(rs.getString("name"));
		mdto.setAge(rs.getInt("age"));
		session.setAttribute("userInfo", mdto);
	}
	if(session.getAttribute("userInfo") == null) {
		response.sendRedirect("ex02-form.jsp");
	}
	
// 	rs.getMetaData() : 줄 수와 각 컬럼이름과 데이터에 접근할 수 있는 객체
%>
<c:if test="${pageContext.request.method == 'POST' }">
<form method="GET">
<h1>로그인 ${empty userInfo ? '실패' : '성공' } !!</h1>
<hr>
<p>${userInfo.id } (${userInfo.name })님, 어서오세요!!</p>
<fieldset>
	<legend>유저 정보</legend>
	<ul>
		<li>ID : ${userInfo.id }</li>
		<li>PW : ${userInfo.pw }</li>
		<li>NAME : ${userInfo.name }</li>
		<li>AGE : ${userInfo.age }</li>
	</ul>
</fieldset>
<p><input type="submit" value="로그아웃"></p>
</form>
</c:if>

<c:if test="${pageContext.request.method == 'GET' }">
	<%
		session.removeAttribute("userInfo");
	%>
	<c:redirect url="ex02-form.jsp"></c:redirect>
</c:if>


</body>
</html>