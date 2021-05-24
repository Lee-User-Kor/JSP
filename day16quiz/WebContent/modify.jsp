<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>Modify</h2>
<hr>
<form method="post" action="modify-submit.jsp">
	<p>${user.userId }</p>
	<p><input type="hidden" name="userId" value="${user.userId }"></p>
	<p><input type="password" name="userPw" placeholder="Password"></p>
	<p><input type="text" name="userName" value="${user.userName }" placeholder="Name"></p>
	<p><input type="number" name="age" value="${user.age }" placeholder="Age" min="0" max="100"></p>
	<p><select name="gender">
		<option value="남성" ${user.gender == '남성' ? 'selected' : '' }>남성</option>
		<option value="여성" ${user.gender == '여성' ? 'selected' : '' }>여성</option>
	</select></p>
	<p><input type="submit" value="MODIFY"></p>
</form>




</body>
</html>