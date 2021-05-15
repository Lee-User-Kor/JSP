<%@page import="org.apache.tomcat.util.descriptor.web.LoginConfig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>


<c:if test="${pageContext.request.method == 'GET' }">
<div class="login-form">
	<form method="POST">
		<h2>로그인</h2>
		<p><input type="text" name="id" placeholder="ID" 
			value="${cookie.id.value}"></p>
		<p><input type="password" name="pw" placeholder="PW"></p>
		<p><label><input type="checkbox" name="storeid"
					${cookie.id.value != null ? 'checked' : '' }>ID저장</label></p>
		<p><input type="submit" value="로그인"></p>
	</form>
</div>
</c:if>

<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="inputData" class="member.MemberDTO"/>
	<jsp:setProperty property="*" name="inputData"/>
	
	<c:set var="login" value="${memberDAO.login(inputData) }" scope="session" />
	<c:if test="${empty login }">
		<script>
			alert('로그인 실패');
			location.href = '${cpath}/member/login.jsp';
		</script>
	</c:if>
	
	<c:if test="${not empty login }">
		<c:if test="${param.storeid != null }">
			<%
				Cookie c = new Cookie("id", request.getParameter("id"));
				
				c.setMaxAge(60 * 10);
				
				response.addCookie(c);
			%>
		</c:if>
		<c:if test="${param.storeid == null }">
			<%
				Cookie c = new Cookie("id", request.getParameter("id"));
				
				c.setMaxAge(0);
				
				response.addCookie(c);	
			%>
		</c:if>		
		
		<script>
			alert('로그인 성공');
			location.href = '${cpath}';
		</script>
	</c:if>





</c:if>


<%@ include file="../footer.jsp" %>





