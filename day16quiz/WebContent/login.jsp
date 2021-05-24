<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>Login</h2>
<hr>
<form method="post" action="login-submit.jsp">
	<p><input type="text" name="userId" placeholder="ID" required autofocus></p>
	<p><input type="password" name="userPw" placeholder="Password" required></p>
	<p><input type="submit" value="LOGIN"></p>
</form>

</body>
</html>