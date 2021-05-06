<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>
<%
// 	session.setAttribute("test", "test");

	Cookie[] cs = request.getCookies();
	for(int i = 0; cs != null && i < cs.length; i++){
		switch(cs[i].getName()) {
		case "JSESSIONID" :
			cs[i].setMaxAge(600);
			response.addCookie(cs[i]);
			break;
		}
	}
%>

<h1>세션 쿠키</h1>
<hr>
<h2>session.getId() : <%=session.getId() %></h2> 
<h2>\${cookie.JSESSIONID.value } : ${cookie.JSESSIONID.value }</h2>
<h2>\${sessionScope.test } : ${sessionScope.test }</h2>







</body>
</html>