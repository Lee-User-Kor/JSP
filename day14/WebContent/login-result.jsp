<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<jsp:useBean id="loginData" class="day14.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="loginData"/>
<jsp:useBean id="dao" class="day14.MemberDAO"></jsp:useBean>

<%-- <% session.setAttribute("user", dao.login(loginData)); %> --%>
<c:set var="user" value="${dao.login(loginData) }" scope="session"></c:set>

<c:if test="${user != null }">
	<c:redirect url="index.jsp"></c:redirect>
</c:if>

<c:if test="${user == null }">
	<h2>Join Result</h2>
	<hr>
	<div>
		<p>로그인 실패</p>
		<p><a href="${cpath }"><button>돌아가기</button></a></p>
	</div>
</c:if>



</body>
</html>