<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<c:if test="${not empty param.idx }">
	<c:set var="row" value="${boardDAO.delete(param.idx) }" />
	<c:redirect url="/board/community.jsp" />
</c:if>

<c:if test="${empty param.idx }">
	<script>
		alert('잘못된 접근입니다');
		location.href = '${cpath}';
	</script>
</c:if>


</body>
</html>