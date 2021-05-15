<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<c:set var="dto" value="${boardDAO.selectOne(param.idx)}" />

<c:if test="${dto.secretCheck != null }">
	<div class="read-check">
		<div class="read-form">
		<h2>게시글 암호 입력</h2>
		<form method='POST'>
			<p><input type="password" name="secretNum" placeholder="PW"></p>
			<p><input type="submit" value="입력"></p>
		</form>
		</div>
	</div>
</c:if>
<c:if test="${dto.secretCheck == null }">
	<c:redirect url="read.jsp?idx=${param.idx}&page=${param.page}&type=${param.type}&word=${param.word}"/>
</c:if>


<c:if test="${pageContext.request.method == 'POST' }">
	<c:if test="${dto.secretNum == param.secretNum }">
		<c:redirect url="read.jsp?idx=${param.idx}&page=${param.page}&type=${param.type}&word=${param.word}"/>
	</c:if>
	<c:if test="${dto.secretNum != param.secretNum }">
		<script>
			alert('아쉽지만 땡 ~ !!');
			location.href='${cpath}/board/community.jsp?page=${param.page}';
		</script>
	</c:if>
</c:if>



</body>
</html>