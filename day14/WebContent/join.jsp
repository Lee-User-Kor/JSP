<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>Join Page</h2>
<hr>

<form method="post" action="join-result.jsp">
	<div>
		<p><input type="text" name="id" placeholder="ID" required autofocus></p>
		<p><input type="password" name="pw" placeholder="Password" required></p>
		<p><input type="text" name="name" placeholder="User Name" required></p>
		<p><input type="number" name="age" placeholder="Age" min="0" max="100" required></p>
		<p><input type="submit" value="Join"></p>
	</div>
</form>



</body>
</html>