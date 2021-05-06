<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz/success.jsp</title>
</head>
<body>

<%-- <%
	session.getAttribute("userInfo");
%> --%> 
<h1>Login Success !!<br>User Info ↓↓</h1>
<hr>
<fieldset>
	<ul>
		<li><strong>ID</strong> : ${userInfo.id }</li>
		<li><strong>PW</strong> : ${userInfo.pw }</li>
		<li><strong>이름</strong> : ${userInfo.name }</li>
		<li><strong>나이</strong> : ${userInfo.age }</li>
	</ul>
</fieldset>


</body>
</html>