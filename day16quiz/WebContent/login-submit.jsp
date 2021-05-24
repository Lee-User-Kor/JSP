<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="inputLogin" class="day16quiz.MemberDTO" />
<jsp:setProperty property="*" name="inputLogin"/>

<c:set var="user" value="${dao.login(inputLogin) }" scope="session" />

<c:if test="${not empty user }">
	<script>
		alert('○○○ 로그인 성공 ○○○');
		location.href = 'index.jsp';
	</script>
</c:if>

<c:if test="${empty user }">
	<script>
		alert('※※※ 로그인 실패 ※※※');
		location.href = 'index.jsp';
	</script>
</c:if>

</body>
</html>