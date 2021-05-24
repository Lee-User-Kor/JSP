<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<jsp:useBean id="dao" class="day15quiz.BookDAO"></jsp:useBean>
<c:set var="list" value="${dao.list() }"></c:set>

<h2>Book List</h2>
<hr>
<table>
	<thead>
		<tr>
			<th>도서명</th>
			<th>저자</th>
			<th>출판사</th>
			<th>출판일자</th>
			<th>수량</th>
		<c:if test="${not empty user }">
			<th>수정</th>
			<th>삭제</th>
		</c:if>
		</tr>
	</thead>
	<tbody>
		
		<c:forEach var="infoBook" items="${list }">
			<tr>
				<td>${infoBook.name }</td>
				<td>${infoBook.writer }</td>
				<td>${infoBook.publisher }</td>
				<td>${infoBook.writtenDate }</td>
				<td>${infoBook.count } 권</td>
			<c:if test="${not empty user }">
				<td><a href="${cpath }/book-modify.jsp?name=${infoBook.name }&writer=${infoBook.writer }"><button>수정</button></a></td>
				<td><a href="${cpath }/book-delete.jsp?name=${infoBook.name }&writer=${infoBook.writer }"><button>삭제</button></a></td>
			</c:if>
			</tr>
		</c:forEach>
		
	</tbody>
	<c:if test="${not empty user }">
	<tfoot>
		<tr>
			<td><a href="${cpath }/book-add.jsp"><button>추가</button></a></td>
		</tr>
	</tfoot>
	</c:if>
</table>



</body>
</html>