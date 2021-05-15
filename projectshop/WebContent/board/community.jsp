<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<c:if test="${empty param.type }">
	<c:set var="map" value="${boardDAO.boardList(param.page) }" />
	<c:set var="boardList" value="${map.boardList }"/>
	<c:set var="paging" value="${map.paging}" />
</c:if>
<c:if test="${not empty param.type }">
	<c:set var="map" value="${boardDAO.boardList(param.page, param.type, param.word)}" />
	<c:set var="boardList" value="${map.boardList}" />
	<c:set var="paging" value="${map.paging}" />
</c:if>


<div class="community">
	<h2>Q & A</h2>
	<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="boardDTO" items="${boardList }">
		<tr>
			<td id="idx">${boardDTO.idx }</td>
			<td><a href="${cpath }/board/read-check.jsp?idx=${boardDTO.idx}&page=${param.page}&type=${param.type}&word=${param.word}">${boardDTO.title }</a></td>
			<td id="writer">${boardDTO.writer } ${memberDAO.searchM(boardDTO.writer) == boardDTO.writer ? '♡' : '' }</td>
			<td id="writedate">${boardDTO.writeDate }</td>
			<td>${boardDTO.secretCheck != null ? '🔒' : ''  }</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>

	<div class="search"> <!-- 검색기능div -->
		<div>
			<form>
				<input type="hidden" name="page" value="${param.page }" >
				<select name="type">
					<option ${param.type == 'title' ? 'selected' : '' } value="title">제목으로 검색</option>
					<option ${param.type == 'writer' ? 'selected' : '' } value="writer">작성자로 검색</option>
					<option ${param.type == 'content' ? 'selected' : '' } value="content">내용으로 검색</option>
				</select>
				<input type="search" name="word" placeholder="검색어를 입력하세요">
				<input type="submit" value="검색">
			</form>
		</div>
		<div>
			<a href="${cpath }/board/write.jsp"><button>작성</button></a>
		</div>
	</div>
	<div class="paging"> <!-- 페이징div -->
		<c:if test="${paging.prev }">
			<a href="${cpath }/board/community.jsp?page=${paging.begin - 1}&type=${param.type}&word=${param.word}">
				[이전]
			</a>	
		</c:if>
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
			<a href="${cpath }/board/community.jsp?page=${i}&type=${param.type}&word=${param.word}">
				${i == param.page ? '<strong>' : ''}
					 [${i }]
				${i == param.page ? '<strong>' : ''}
			</a>
		</c:forEach>
		<c:if test="${paging.next }">
			<a href="${cpath }/board/community.jsp?page=${paging.end + 1}&type=${param.type}&word=${param.word}">
				[다음]
			</a>
		</c:if>
	</div>
</div>

</body>
</html>





