<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<div class="write">
	<h2>Q & A</h2>
	<form method="POST" enctype="multipart/form-data">
		<div>
		<p>제목 :
            <select id="title" name="title" required>
               <option>사이즈 교환 문의드립니다</option>
               <option>배송관련 문의드립니다</option>
               <option>제품관련 문의드립니다</option>
               <option>기타사항 문의드립니다</option>
            </select></p>			
			<p>작성자 : ${not empty login ? login.id : '' }<input type="${not empty login ? 'hidden' : 'text' }" name="writer" value="${not empty login ? login.id : '' }" placeholder="작성자를 입력하세요" required></p>
		</div>
			<p id="ptext"><textarea id="textarea" name="content" placeholder="여기에 내용을 입력하세요" required></textarea></p>
			<p id="pfile">첨부파일 <input id="uploadfile" type="file" name="uploadFile"></p>
		<div class="foot">
			<div>
				<p id="pcheck"><label><input type="checkbox" name="secretcheck">비밀글</label></p>
				<p><input type="password" name="secretnum" placeholder="게시글 암호를 만들어주세요" required></p>
			</div>
			<div>
				<p id="pbtn"><button>작성완료</button></p>
			</div>
		</div>
	</form>
</div>

<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="fileUtil" class="board.FileUtil"/>
	<c:set var="dto" value="${fileUtil.getBoardDTO(pageContext.request) }" />
	<c:set var="row" value="${boardDAO.insert(dto) }" />
	<script>
		const row = ${row};
		alert(row == 1 ? '글 작성 완료 !!' : '작성 실패 !!');
		location.href = '${cpath}/board/community.jsp';
	</script>
</c:if>

</body>
</html>