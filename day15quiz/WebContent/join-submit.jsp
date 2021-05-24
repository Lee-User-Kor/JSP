<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="inputJoin" class="day15quiz.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="inputJoin"/>

<jsp:useBean id="dao" class="day15quiz.MemberDAO"></jsp:useBean>
<c:set var="row" value="${dao.join(inputJoin) }"></c:set>

<h2>Join Submit</h2>
<hr>
<div>
<c:if test="${row != 0 }">
	<p>회원 가입 성공</p>
	<p><a href="${cpath }"><button>메인페이지로</button></a></p>
</c:if>
<c:if test="${row == 0 }">
	<p>회원 가입 실패</p>
	<p><a href="${cpath }"><button>메인페이지로</button></a></p>
</c:if>
</div>




</body>
</html>