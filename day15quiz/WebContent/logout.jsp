<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%
	Cookie[] cookies = request.getCookies();

	if(cookies != null) {
		for(Cookie c : cookies) {
			c.setMaxAge(0);
			response.addCookie(c);
		}
	}

	session.invalidate();
	response.sendRedirect("index.jsp");
%>




</body>
</html>