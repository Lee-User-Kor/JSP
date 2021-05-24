<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h2>글 수정</h2>
<c:set var="dto" value="${boardDAO.selectOne(param.idx) }" />

<div>
	<form method="POST" enctype="multipart/form-data">
	<!-- hidden으로 넘겨주는 값 -->
	<input type="hidden" name="idx" value="${param.idx }">
	<input type="hidden" name="ipaddr" value="${pageContext.request.remoteAddr }">
	<div class="sb">
		<div>
			<p><input type="text" name="title" value="${dto.title }"
					  placeholder="제목을 입력하세요" required autofocus></p>
			<p><input type="text" name="writer" value="${dto.writer }"
					  placeholder="작성자 이름을 입력하세요" required readonly></p>
		</div>
	</div>
	<div class="content">
		<textarea name="content" placeholder="여기에 내용을 입력하세요" required>${dto.content }</textarea>
		<p><input type="file" name="uploadFile"></p>
		<p><sub>현재 파일 : ${dto.uploadFile == 'default.jpg' ? '없음' : dto.uploadFile }</sub></p>
	</div>
	<div class="sb">
		<div>
			<a href="${cpath }/board/read.jsp?idx=${param.idx}"><input type="button" value="수정취소"></a>
		</div>
		<div>
			<button>수정완료</button><%--submit 역할의 button --%>
		</div>
	</div>
	</form>
</div>

<c:if test="${pageContext.request.method=='POST' }">
	<jsp:useBean id="fileUtil" class="board.FileUtil" />
	<c:set var="dto" value="${fileUtil.getBoardDTO(pageContext.request) }" />
	<jsp:setProperty property="idx" name="dto" value="${param.idx }"/>
	<c:set var="row" value="${boardDAO.modify(dto) }" />
	<script>
		const row = ${row};
		alert(row == 1 ? '글 수정 완료 !!' : '수정 실패 !!');
		location.href = '${cpath}/board/list.jsp?page=1';
	</script>
</c:if>





</body>
</html>