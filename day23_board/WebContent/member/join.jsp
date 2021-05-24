<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h2>회원가입</h2>

<c:if test="${pageContext.request.method == 'GET' }">
	<form method="POST">
		<p><input name="userid" placeholder="ID" required autofocus></p>
		<p><input type="password" name="userpw" placeholder="Password" required></p>
		<p><input name="username" placeholder="Input your name" required></p>
		<p><input type="number" min="0" max="100" name="age" placeholder="Age" required></p>
		<p>
			<label><input type="radio" name="gender" value="남성" required>남성</label>
			<label><input type="radio" name="gender" value="여성" required>여성</label>
		</p>
		<p><input type="submit" value="가입신청"></p>
	</form>
</c:if>

<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="inputData" class="model.MemberDTO" />
	<jsp:setProperty property="*" name="inputData"/>
	<c:set var="row" value="${memberDAO.insert(inputData) }" />
	<script>
		const row = ${row};
		alert('회원 가입 ' + (row == 1 ? '성공 !!' : '실패'));
		location.href = '${cpath}' + (row == 1 ? '/member/login.jsp' : '/member/join.jsp');
	</script>
</c:if>

</body>
</html>