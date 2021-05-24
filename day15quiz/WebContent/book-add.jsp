<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>Book Add Page</h2>
<hr>
<form method="post" action="book-add-submit.jsp">
	<p><input type="text" name="name" placeholder="Book Name" required></p>
	<p><input type="text" name="writer" placeholder="Writer" required></p>
	<p><input type="text" name="publisher" placeholder="Publisher" required></p>
	<p><input type="date" name="writtenDate" required></p>
	<p><input type="number" name="count" placeholder="Count" min="0" max="9999" required></p>
	<p><input type="submit" value="ADD"></p>
</form>


</body>
</html>