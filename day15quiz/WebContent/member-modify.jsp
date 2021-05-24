<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>Member Info Modify Page</h2>
<hr>
<form method="post" action="member-modify-submit.jsp">
	<p><strong>${user.id }</strong></p>
	<p><input type="hidden" name="id" value="${user.id }"></p>
	<p><input type="password" name="pw" placeholder="Password"></p>
	<p><input type="text" name="name" value="${user.name }"></p>
	<p><input type="number" name="age" value="${user.age }"></p>
	<p><input type="submit" value="MODIFY"></p>
</form>


</body>
</html>