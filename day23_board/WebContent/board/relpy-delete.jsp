<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<c:set var="row" value="${boardDAO.deleteReply(param.idx, replyuser.idx) }"/>

<c:if test="${row != 0 }">
<c:redirect url="read.jsp?idx=${param.idx}&page=${param.page}&type=${param.type}&word=${param.word}"/>
</c:if>

<c:if test="${row == 0 }">
	<script>
		alert('삭제 실패 !! 잘못된 접근입니다!!');
		location.href = 'read.jsp?idx=${param.idx}&page=${param.page}&type=${param.type}&word=${param.word}';
	</script>
</c:if>

</body>
</html>