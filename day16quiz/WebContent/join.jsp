<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<h2>Join</h2>
<hr>
<form method="post" action="join-submit.jsp">
	<p><input type="text" name="userId" placeholder="ID" required autofocus></p>
	<p><input type="password" name="userPw" placeholder="Password" required></p>
	<p><input type="text" name="userName" placeholder="Name" required></p>
	<p><input type="number" name="age" placeholder="Age" min="0" max="100" required></p>
	<p><select name="gender"><option value="남성">남성</option><option value="여성">여성</option></select></p>
	<p><input type="submit" value="JOIN"></p>
</form>





</body>
</html>