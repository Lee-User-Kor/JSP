<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<jsp:useBean id="inputDelete" class="day15quiz.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="inputDelete"/>

<jsp:useBean id="dao" class="day15quiz.MemberDAO"></jsp:useBean>
<c:set var="row" value="${dao.delete(inputDelete) }"></c:set>

<c:if test="${row != 0 }">
	<% session.invalidate(); %>
	<script>
		alert('정상적으로 탈퇴되었습니다.');
		location.href = '${cpath }';
	</script>
</c:if>
<c:if test="${row == 0 }">

</c:if>





</body>
</html>