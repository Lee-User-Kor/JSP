<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>Login Page</h2>
<hr>
<form method="post" action="login-submit.jsp">
	<p><input type="text" name="id" placeholder="ID" value="${cookie.id.value }" required autofocus></p>
	<p><input type="password" name="pw" placeholder="PW" required></p>
	<p><label><input type="checkbox" ${cookie.storeid.value != null ? 'checked' : '' } name="storeid">ID 저장</label></p>
	<p><input type="submit" value="LOGIN"></p>
</form>



</body>
</html>