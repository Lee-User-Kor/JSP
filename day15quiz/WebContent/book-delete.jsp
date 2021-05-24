<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<jsp:useBean id="inputList" class="day15quiz.Book"></jsp:useBean>
<jsp:setProperty property="name" value="${param.name }" name="inputList"/>
<jsp:setProperty property="writer" value="${param.writer }" name="inputList"/>

<jsp:useBean id="dao" class="day15quiz.BookDAO"></jsp:useBean>
<c:set var="whatBook" value="${dao.find(inputList) }" scope="session"></c:set>


<c:if test="${pageContext.request.method == 'GET' }">
<h2>${whatBook.name } Delete Page</h2>
<hr>
<form method="post" action="book-delete-submit.jsp">
	<p>정말로 삭제하시려면 아래에 "지금삭제" 라고 적어주세요.</p>
	<p><input type="text" name="delete" placeholder="'지금삭제'라고 적어주세요."></p>
	<p><input type="submit" value="DELETE"></p>
</form>
</c:if>




</body>
</html>