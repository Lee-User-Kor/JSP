<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="inputAdd" class="day15quiz.Book"></jsp:useBean>
<jsp:setProperty property="*" name="inputAdd"/>

<jsp:useBean id="dao" class="day15quiz.BookDAO"></jsp:useBean>
<c:set var="row" value="${dao.add(inputAdd) }"></c:set>

<c:if test="${row != 0 }">
	<script>
		alert('○○○ 도서 추가 완료 ○○○');
		location.href = 'book-list.jsp';
	</script>
</c:if>
<c:if test="${row == 0 }">
	<script>
		alert('※※※ 도서 추가 실패 ※※※');
		location.href = 'book-list.jsp';
	</script>
</c:if>


</body>
</html>