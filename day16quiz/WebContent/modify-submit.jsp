<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="inputModify" class="day16quiz.MemberDTO"/>
<jsp:setProperty property="*" name="inputModify"/>

<c:set var="row" value="${dao.modify(inputModify) }"/>

<c:if test="${row != 0 }">
<% session.invalidate(); %>
	<script>
		alert('○○○ 회원정보 수정 완료 ○○○ 다시 로그인해주세요.')
		location.href = 'index.jsp';
	</script>
</c:if>

<c:if test="${row != 0 }">
	<script>
		alert('※※※ 회원정보 수정 실패 ※※※ 잘못된 접근입니다.')
		location.href = 'modify.jsp';
	</script>
</c:if>




</body>
</html>