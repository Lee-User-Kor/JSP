<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<c:if test="${pageContext.request.method == 'GET' }">

	<h2>로그인</h2>
	<form method="POST">
		<p><input type="text" name="userid" placeholder="ID"></p>
		<p><input type="password" name="userpw" placeholder="Password"></p>
		<p><input type="submit" value="로그인"></p>
	</form>
</c:if>

<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="inputData" class="model.MemberDTO" />
	<jsp:setProperty property="*" name="inputData"/>
	<c:set var="login" value="${memberDAO.login(inputData) }" scope="session" />
	<script>
		const flag = ${not empty login};	// true or false
		if(flag) {
			location.href = '${cpath}';
		}
		else {
			alert('로그인 실패 !!');
			history.go(-1);
		}
	</script>
</c:if>

</body>
</html>