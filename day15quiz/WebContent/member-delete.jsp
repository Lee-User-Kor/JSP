<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>Delete Account Page</h2>
<hr>
<form method="post" action="member-delete-submit.jsp">
	<p>${user.id } (${user.name }) 님의 회원 탈퇴를 진행합니다.</p>
	<p><input type="hidden" name="id" value="${user.id }"></p>
	<p><input type="password" name="pw" placeholder="Password"></p>
	<p><input type="submit" value="DELETE"><a href="${cpath }"><input type="button" value="NO, GO BACK"></a></p>
</form>

</body>
</html>