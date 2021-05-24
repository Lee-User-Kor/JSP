<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>

<c:if test="${param.delete == '지금삭제' }">
<jsp:useBean id="dao" class="day15quiz.BookDAO"></jsp:useBean>
<c:set var="row" value="${dao.delete(whatBook) }"></c:set>
	<c:if test="${row != 0 }">
		<% session.removeAttribute("whatBook"); %>
		<script>
			alert('○○○ 도서 삭제 완료 ○○○');
			location.href = 'book-list.jsp';
		</script>
	</c:if>
	<c:if test="${row != 0 }">
		<% session.removeAttribute("whatBook"); %>
		<script>
			alert('※※※ 도서 삭제 실패 ※※※');
			location.href = 'book-list.jsp';
		</script>
	</c:if>
</c:if>
<c:if test="${param.delete != '지금삭제' }">
	<% session.removeAttribute("whatBook"); %>
		<script>
			alert('※※※ 도서 삭제 실패 : 키워드 오류 ※※※');
			location.href = 'book-list.jsp';
		</script>
</c:if>

</body>
</html>