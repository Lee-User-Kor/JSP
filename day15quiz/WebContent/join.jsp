<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>Join Page</h2>
<hr>
<form method="post" action="join-submit.jsp">
	<p><input type="text" name="id" placeholder="ID" required autofocus></p>
	<p><input type="password" name="pw" placeholder="Password" required></p>
	<p><input type="text" name="name" placeholder="NAME" required></p>
	<p><input type="number" name="age" placeholder="AGE" required></p>
	<p><input type="submit" value="JOIN"></p>
</form>



</body>
</html>