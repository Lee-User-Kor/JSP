<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<form>
	<div class="loginFailDiv">
		<h2>로그인 실패 !!</h2>
	</div>
	<div>
		<input type="submit" name="return" value="로그인 페이지로 이동">
	</div>	
</form>
<%
	if(request.getParameter("return") != null
		&& request.getParameter("return").equals("로그인 페이지로 이동")) {
		response.sendRedirect("login.jsp");
	}
%>

</body>
</html>