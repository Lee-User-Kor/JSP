<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<jsp:useBean id="dto" class="board.ReplyDTO" />
<jsp:setProperty property="*" name="dto"/>
<c:set var="row" value="${replyDAO.modify(dto) }" />

<c:if test="${row != 0 }" >
	<script>
		alert('댓글 수정 완료');
		location.href = '${cpath}/board/read.jsp?idx=${dto.bnum}';
	</script>
</c:if>

<c:if test="${row == 0 }" >
	<script>
		alert('댓글 수정 실패');
		location.href = '${cpath}/board/read.jsp?idx=${dto.bnum}';
	</script>
</c:if>


</body>
</html>