<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<c:set var="dto" value="${boardDAO.selectOne(param.idx)}" />


<c:if test="${dto.secretCheck == null }">
	<div class="modify-check">
		<h2>게시글 수정 접근 제한</h2>
		<form method='POST'>
			<p><input type="password" name="secretNum" placeholder="PW"></p>
			<p><input type="submit" value="입력"></p>
		</form>
	</div>
</c:if>
<c:if test="${dto.secretCheck != null }">
	<c:redirect url="modify.jsp?idx=${param.idx}"/>
</c:if>


<c:if test="${pageContext.request.method == 'POST' }">
	<c:if test="${dto.secretNum == param.secretNum }">
		<c:redirect url="modify.jsp?idx=${param.idx}"/>
	</c:if>
	<c:if test="${dto.secretNum != param.secretNum }">
		<script>
			alert('땡 ~ !!');
			location.href='${cpath}/board/read.jsp?idx=${param.idx}';
		</script>
	</c:if>
</c:if>



</body>
</html>