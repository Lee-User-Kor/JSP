<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-result.jsp</title>
</head>
<body>

<%
	if(session.getAttribute("login") == null) {		// 로그인 된 상태가 아니라면
		response.sendRedirect("ex02.jsp");			// 로그인 폼으로 돌아가라
	}
%>

<h1>로그인 결과</h1>
<hr>

<h2>${sessionScope.login.name } (${sessionScope.login.id }) 님, 안녕하세요 !!</h2>
<a href="ex02-logout.jsp"><button>로그아웃</button></a>

</body>
</html>