<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- begin of header -->
<%@ include file="header.jsp" %>
<!-- end of header -->

<main>
	<c:if test="${pageContext.request.method == 'GET' }">
		<%-- 넘어온 책 이름과 일치하는 책을 찾는 코드 --%>		
		<c:forEach var="book" items="${list }">
			<c:if test="${book.name == param.name }">
				<c:set var="target" value="${book }" />
			</c:if>
		</c:forEach>
		<%-- 찾은 책이 없으면 --%>
		<c:if test="${empty target }">
			<h3>잘못된 접근입니다</h3>
		</c:if>
		<%-- 이름이 일치하는 책을 찾았으면 --%>
		<c:if test="${not empty target }">
			<form method="POST" class="my-form">
				<p><input type="text" name="name" value="${target.name }" placeholder="도서이름" autofocus required></p>
				<p><input type="text" name="author" value="${target.author }" placeholder="저자" required></p>
				<p><input type="text" name="publisher" value="${target.publisher }" placeholder="출판사" required></p>
				<p><input type="date" name="date" value="${target.date }" placeholder="출판일자"></p>
				<p><input type="number" name="count" value="${target.count }" placeholder="보유수량"></p>
				<input type="hidden" name="index" value="${list.indexOf(target) }">
				<%-- target이 list에서 위치하는 index를 찾아서 숨긴형태로 같이 넘겨준다 --%>
				<p><input type="submit" value="수정"></p>
			</form>
		</c:if>
	</c:if>
	<c:if test="${pageContext.request.method == 'POST' }">
		<%
			request.setCharacterEncoding("UTF-8");
		%>
		<jsp:useBean id="user" class="day07t.Book"></jsp:useBean>
		<jsp:setProperty property="*" name="user"/>
		<%-- list.set(index, element) 메서드는 객체를 반환한다 --%>
		<c:if test="${not empty list.set(param.index, user) }">
			<c:redirect url="list.jsp"></c:redirect>
		</c:if>
	</c:if>
	
</main>






<!-- begin of footer -->
<footer>
<%@ include file="footer.jsp" %>
</footer>
<!-- end of footer -->