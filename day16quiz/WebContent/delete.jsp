<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>Delete</h2>
<hr>
<form method="post" action="delete-submit.jsp">
	<p>${user.userId }</p>
	<p><input type="hidden" name="userId" value="${user.userId }"></p>
	<p><input type="password" name="userPw" placeholder="Password" required></p>
	<p><input type="submit" value="DELETE"></p>
</form>

</body>
</html>