<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05.jsp</title>
</head>
<body>

<form method="post">
	<input type="text" name="name" placeholder="이름을 입력하세요">
	<input type="submit">
</form>

<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
%>

<h3><%=name != null ? name : "" %></h3>



</body>
</html>