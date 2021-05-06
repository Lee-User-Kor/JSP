<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp</title>
</head>
<body>
<%
	if(session.getAttribute("login") != null) {
		response.sendRedirect("ex02.result.jsp");
	}
%>


<h1>Session Login</h1>
<hr>

<form method="POST" action="ex02-submit.jsp">
	<p><input type="text" name="id" placeholder="ID"></p>
	<p><input type="password" name="pw" placeholder="Password"></p>
	<p><input type="submit" value="로그인"></p>
</form>


















</body>
</html>