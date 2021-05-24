<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="inputDelete" class="day16quiz.MemberDTO"/>
<jsp:setProperty property="*" name="inputDelete"/>

<c:set var="row" value="${dao.delete(inputDelete) }"/>

<c:if test="${row != 0 }">
<% session.invalidate(); %>
	<script>
		alert('○○○ 회원정보 삭제 완료 ○○○')
		location.href = 'index.jsp';
	</script>
</c:if>
<c:if test="${row == 0 }">
	<script>
		alert('※※※ 회원정보 삭제 실패 ※※※')
		location.href = 'delete.jsp';
	</script>
</c:if>


</body>
</html>