<%@page import="day09.Member"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-submit.jsp</title>
</head>
<body>

<%!
	List<Member> list = Arrays.asList(new Member[] {
		new Member("test", "1234", "테스트"),
		new Member("admin", "1", "관리자"),
		new Member("iu930516", "iu", "이지은")
	});
%>
<%
	String paramId = request.getParameter("id");
	String paramPw = request.getParameter("pw");
	
	Member user = new Member();
	user.setId(paramId);
	user.setPw(paramPw);
	
	for(Member m : list) {
		if(m.getId().equals(user.getId())) {
			if(m.getPw().equals(user.getPw())) {
				session.setAttribute("login", m);
				session.setMaxInactiveInterval(10);		// 세션의 유효시간 15초
			}
		}
	}
	
	long elapsedTime = session.getLastAccessedTime() - session.getCreationTime();
	elapsedTime /= 1000;
%>
<h2>session.getId() : <%=session.getId() %></h2>
<h2>session.getCreationTime() : <%=session.getCreationTime() %></h2>
<h2>session.getLastAccessedTime() : <%=session.getLastAccessedTime()%></h2>
<h2>elapsedTime : <%=elapsedTime %></h2>
<h2>\${sessionScope.login.id } : ${sessionScope.login.id }</h2>
<h2>\${sessionScope.login.pw } : ${sessionScope.login.pw }</h2>
<h2>\${sessionScope.login.name } : ${sessionScope.login.name }</h2>
<h2>session.getMaxInactiveInterval() : <%=session.getMaxInactiveInterval() %></h2>

<%
	if(session.getAttribute("login") != null) {
		%>
		<a href="ex02-result.jsp"><button>다음으로</button></a>
		<%
	}
%>







</body>
</html>