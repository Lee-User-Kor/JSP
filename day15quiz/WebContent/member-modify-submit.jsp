<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="inputModify" class="day15quiz.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="inputModify"/>

<jsp:useBean id="dao" class="day15quiz.MemberDAO"></jsp:useBean>
<c:set var="row" value="${dao.modify(inputModify) }"></c:set>

<c:if test="${row != 0 }">
	<% session.invalidate(); %>
	<script>
		alert('회원정보 수정 완료. 다시 로그인해주세요.');
		location.href = '${cpath }';
	</script>
</c:if>
<c:if test="${row == 0 }">
	<h2>Modify Result Page</h2>
	<hr>
	<div>
		<p>회원 정보 수정 실패 : 잘못된 접근입니다.</p>
		<p><a href="${cpath }/member-modify.jsp"><button>이전으로</button></a></p>
	</div>
</c:if>

</body>
</html>