<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="inputModify" class="day15quiz.Book"></jsp:useBean>
<jsp:setProperty property="*" name="inputModify"/>

<jsp:useBean id="dao" class="day15quiz.BookDAO"></jsp:useBean>
<c:set var="row" value="${dao.modify(inputModify, whatBook) }"></c:set>

<c:if test="${row != 0 }">
	<% session.removeAttribute("whatBook"); %>
	<script>
		alert('○○○ 도서 정보 수정 완료 ○○○');
		location.href = 'book-list.jsp';
	</script>
</c:if>
<c:if test="${row != 0 }">
	<% session.removeAttribute("whatBook"); %>
	<script>
		alert('※※※ 도서 정보 수정 실패 ※※※');
		location.href = 'book-list.jsp';
	</script>
</c:if>

</body>
</html>