<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<form action="login-result.jsp" method="post">
	<p><input type="text" name="id" placeholder="ID" autofocus required autocomplete="off"></p>
	<p><input type="password" name="pw" placeholder="PW" required></p>
	<p><input type="submit" value="로그인"></p>
</form>


</body>
</html>