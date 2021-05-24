<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h2>글 쓰기</h2>

<div>
	<form method="POST" enctype="multipart/form-data">
	<!-- hidden으로 넘겨주는 값 -->
	<input type="hidden" name="ipaddr" value="${pageContext.request.remoteAddr }">
	<div class="sb">
		<div>
			<p><input type="text" name="title" placeholder="제목을 입력하세요" required autofocus></p>
			<p><input type="text" name="writer" value="${login.username }" readonly required></p>
		</div>
	</div>
	<div class="content">
		<textarea name="content" placeholder="여기에 내용을 입력하세요" required></textarea>
		<p><input type="file" name="uploadFile"></p>
	</div>
	<div class="sb">
		<div>
			<a href="${cpath }/board/list.jsp"><input type="button" value="작성취소"></a>
		</div>
		<div>
			<button>작성완료</button>
		</div>
	</div>
	</form>
</div>

<c:if test="${pageContext.request.method=='POST' }">
	<jsp:useBean id="fileUtil" class="board.FileUtil" />
	<c:set var="dto" value="${fileUtil.getBoardDTO(pageContext.request) }" />
	<c:set var="row" value="${boardDAO.insert(dto) }" />
	<script>
		const row = ${row};
		alert(row == 1 ? '글 작성 완료 !!' : '작성 실패 !!');
		location.href = '${cpath}/board/list.jsp?page=1';
	</script>
</c:if>






</body>
</html>