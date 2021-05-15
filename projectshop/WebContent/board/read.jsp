<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<c:set var="row" value="${boardDAO.viewCount(param.idx) }" />
<c:set var="dto" value="${boardDAO.selectOne(param.idx)}" />


<div class="read">
	<div class="head1"> <!-- 상단  -->
		<div id="head1t">제목 : ${dto.getTitle() }</div>
		<div id="head1vc">조회수 : ${dto.viewCount }</div>
	</div>
	<div class="head2">
		<div id="head2w">작성자 : ${dto.getWriter() }</div>
		<div id="head2wd">작성일 : ${dto.writeDate }</div>
	</div>
	<div class="content"> <!-- 내용 div -->
		<c:if test="${dto.uploadFile != null}">
			<div class="content-img" style="background-image: url('${cpath}/uploadPath/${dto.uploadFile }')"></div>
		</c:if>
		<pre>${dto.content }</pre>
	</div>
	<div class="foot">
		<div>
			<a href="${cpath }/board/community.jsp"><button>목록으로</button></a>
		</div>
		<div>
			<a href="${cpath }/board/modify-check.jsp?idx=${dto.idx}"><button>수정</button></a>
			<a href="${cpath }/board/delete-check.jsp?idx=${dto.idx}"><button>삭제</button></a>
		</div>
	</div>
	<div class="reply"> <!-- 댓글 div -->
			<form method="POST">
				<input type="hidden" name="bnum" value="${param.idx }">
				<p><input type="text" name="writer" value="${login.name }" readonly required placeholder="로그인이 필요한 서비스"></p>
				<textarea name="content" placeholder="바르고 고운말을 사용합시다" ${empty login ? 'disabled' : '' } required></textarea>
				<input type="submit" value="댓글 작성">
			</form>
	</div>

	<c:if test="${pageContext.request.method == 'POST' }">
		<jsp:useBean id="replydto" class="board.ReplyDTO" />
		<jsp:setProperty property="*" name="replydto"/>
		<c:set var="row" value="${replyDAO.insert(replydto) }" />
			
		
	</c:if>
		
	<c:forEach var="dto" items="${replyDAO.replyList(param.idx) }">
		<c:if test="${dto.idx == param.replyidx }">
			<form id="replyform" method="POST" action="${cpath }/board/reply-modify.jsp">
				<input type="hidden" name="idx" value="${dto.idx }" >
				<input type="hidden" name="bnum" value="${dto.bnum }">
				<p>작성자 : ${dto.writer }</p>
				<textarea name="content">${dto.content }</textarea>
				<input type="submit" value="수정">
			</form>
		</c:if>
	<c:if test="${dto.idx != param.replyidx }">
		<div class="reply-list">
			<div class="reply-up">
				<div>작성자 : ${dto.writer }</div>
				<div>날짜 : ${dto.writeDate }</div>
			</div>
			<div>
				<p>${dto.content}</p>
				<c:if test="${dto.writer == login.name }">
					<a href="${cpath }/board/read.jsp?idx=${dto.bnum}&replyidx=${dto.idx}"><button>수정</button></a>
					<a href="${cpath }/board/reply-delete.jsp?bnum=${dto.bnum}&idx=${dto.idx}"><button>삭제</button></a>
				</c:if>
			</div>
		</div>
	</c:if>
	</c:forEach>


</div>






</body>
</html>