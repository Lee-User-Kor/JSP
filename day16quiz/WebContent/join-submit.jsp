<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="inputJoin" class="day16quiz.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="inputJoin"/>

<c:set var="row" value="${dao.join(inputJoin) }"></c:set>

<c:if test="${row != 0 }">
	<script>
		alert('○○○ 회원가입 성공 ○○○');
		location.href = 'index.jsp';
	</script>
</c:if>

<c:if test="${row == 0 }">
	<script>
		alert('※※※ 회원가입 실패 ※※※');
		location.href = 'index.jsp';
	</script>
</c:if>

</body>
</html>