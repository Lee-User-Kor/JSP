<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>로그인 유지</h1>
<hr>
<%
	if(session.getAttribute("login") != null) {
		response.sendRedirect("ex02-result.jsp");
	}
%>


<form method="POST" action="ex02-submit.jsp">
	<p><input type="text" name="id" placeholder="ID"></p>
	<p><input type="password" name="pw" placeholder="Password"></p>
	<p><input type="checkbox" name="keepSession">로그인 상태 유지</p>
	<p><input type="submit" value="로그인"></p>
</form>


</body>
</html>