<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- begin of header -->
<%@ include file="header.jsp" %>
<!-- end of header -->

<main>
	${pageContext.request.method }
	<c:if test="${pageContext.request.method == 'GET'}">
		<form method="POST" class="my-form">
			<p><input type="text" name="name" placeholder="도서이름" autofocus required></p>
			<p><input type="text" name="author" placeholder="저자" required></p>
			<p><input type="text" name="publisher" placeholder="출판사" required></p>
			<p><input type="date" name="date" placeholder="출판일자"
				value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>"></p>
			<p><input type="submit" value="등록"></p>
		</form>
	</c:if>
	<c:if test="${pageContext.request.method == 'POST'}">
		<%
			request.setCharacterEncoding("UTF-8");
		%>
		<jsp:useBean id="book" class="day07t.Book"></jsp:useBean>
		<jsp:setProperty property="*" name="book"/>
		<c:if test="${list.add(book) }">
			<c:redirect url="list.jsp"></c:redirect>
		</c:if>
	</c:if>
	
</main>







<footer>
<%@ include file="footer.jsp" %>
</footer>
<!-- end of footer -->