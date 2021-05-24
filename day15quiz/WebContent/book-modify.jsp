<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<jsp:useBean id="inputList" class="day15quiz.Book"></jsp:useBean>
<jsp:setProperty property="name" value="${param.name }" name="inputList"/>
<jsp:setProperty property="writer" value="${param.writer }" name="inputList"/>

<jsp:useBean id="dao" class="day15quiz.BookDAO"></jsp:useBean>
<c:set var="whatBook" value="${dao.find(inputList) }" scope="session"></c:set>


<c:if test="${pageContext.request.method == 'GET' }">
<h2>${whatBook.name } Modify Page</h2>
<hr>
<form method="post" action="book-modify-submit.jsp">
	<p><input type="text" name="name" value="${whatBook.name }" required></p>
	<p><input type="text" name="writer" value="${whatBook.writer }" required></p>
	<p><input type="text" name="publisher" value="${whatBook.publisher }" required></p>
	<p><input type="date" name="writtenDate" value="${whatBook.writtenDate }" required></p>
	<p><input type="number" name="count" value="${whatBook.count }" min="0" max="9999" required></p>
	<p><input type="submit" value="MODIFY"></p>
</form>
</c:if>




</body>
</html>