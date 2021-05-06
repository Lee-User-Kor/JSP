<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginresult.jsp</title>
</head>
<body>
<%
	
	if(session.getAttribute("user") == null) {
		response.sendRedirect("quiz1.jsp");
	}
%>

<p>${sessionScope.user.id } (${sessionScope.user.name })님, 안녕하세요!!</p>
<p><a href="logout.jsp"><input type="submit" value="로그아웃"></a></p>


</body>
</html>