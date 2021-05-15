<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<c:set var="row" value="${replyDAO.delete(param.idx) }" />
<c:if test="${row != 0 }">
	<script>
		alert('삭제완료');
		location.href = '${cpath}/board/read.jsp?idx=${param.bnum}';
	</script>
</c:if>
<c:if test="${row == 0 }">
	<script>
		alert('삭제실패');
		location.href = '${cpath}/board/read.jsp?idx=${param.bnum}';
	</script>
</c:if>

</body>
</html>