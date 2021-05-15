<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<c:set var="dto" value="${boardDAO.selectOne(param.idx)}" />

<div class="modify">
<form method="POST">
	<input type="hidden" name="idx" value="${param.idx }">
	<div class="head1"> <!-- 상단  -->
		<div id="head1t">제목 :
            <select id="title" name="title" required>
               <option ${dto.title == '사이즈 교환 문의드립니다' ? 'selected' : ''}>사이즈 교환 문의드립니다</option>
               <option ${dto.title == '배송관련 문의드립니다' ? 'selected' : ''}>배송관련 문의드립니다</option>
               <option ${dto.title == '제품관련 문의드립니다' ? 'selected' : ''}>제품관련 문의드립니다</option>
               <option ${dto.title == '기타사항 문의드립니다' ? 'selected' : ''}>기타사항 문의드립니다</option>
            </select></div>
		<div id="head1vc">조회수 : ${dto.viewCount }</div>
	</div>
	<div class="head2">
		<div id="head2w">작성자 : ${dto.getWriter() }</div>
		<div id="head2wd">작성일 : ${dto.writeDate }<input type="hidden" name="writeDate" value="${boardDAO.nowDate() }"></div>
	</div>
	<div class="content"> <!-- 내용 div -->
	<c:if test="${dto.uploadFile != null}">
		<div class="content-img" style="background-image: url('${cpath}/uploadPath/${dto.uploadFile }')"></div>
	</c:if>
		<textarea id="content-text" name="content">${dto.content }</textarea>
		<div class="wrapmodi">
		<div><input type="file" name="uploadFile"></div>
	<div>
		<a href="${cpath }/board/community.jsp"><input type="button" value="목록으로"></a>
		<input type="submit" value="수정 완료">
	</div>
	</div>
	</div>
</form>
</div>

<c:if test="${pageContext.request.method == 'POST'}">
	<jsp:useBean id="modidto" class="board.BoardDTO"/>
	<jsp:setProperty property="*" name="modidto"/>
	<c:set var="row" value="${boardDAO.modify(modidto) }" />
	<c:if test="${row != 0 }">
		<script>
			alert('수정 완료');
			location.href = '${cpath}/board/community.jsp';
		</script>
	</c:if>
	<c:if test="${row == 0 }">
		<script>
			alert('수정 실패');
			location.href = '${cpath}/board/community.jsp';
		</script>
	</c:if>
</c:if>


</body>
</html>