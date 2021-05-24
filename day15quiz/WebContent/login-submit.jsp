<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="inputLogin" class="day15quiz.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="inputLogin"/>

<jsp:useBean id="dao" class="day15quiz.MemberDAO"></jsp:useBean>
<c:set var="user" value="${dao.login(inputLogin) }" scope="session"></c:set>


<c:if test="${user != null }">
<%
	String id = request.getParameter("id");
	String storeid = request.getParameter("storeid");

	if(storeid != null) {
		Cookie c1 = new Cookie("id", id);
		Cookie c2 = new Cookie("storeid", storeid);
		
		c1.setMaxAge(60 * 10);
		c2.setMaxAge(60 * 10);
		
		response.addCookie(c1);
		response.addCookie(c2);
	}
%>
	<script>
		alert('○○○ 로그인 성공 ○○○');
		location.href = '${cpath }'; 
	</script>
</c:if>
<c:if test="${user == null }">
	<script>
		alert('※※※ 로그인 실패 ※※※');
		location.href = '${cpath }'; 
	</script>	
</c:if>



</body>
</html>