<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>Login Page</h2>
<hr>
<form method="post" action="login-result.jsp">
	<div>
		<p><input type="text" name="id" placeholder="ID" required autofocus></p>
		<p><input type="password" name="pw" placeholder="Password" required></p>
		<p><input type="submit" value="Login"></p>
	</div>
</form>


</body>
</html>