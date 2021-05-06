<%@page import="day10.Member"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginsubmit.jsp</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	List<Member> list = Arrays.asList(new Member[] {
		new Member("test", "1234", "테스트"),
		new Member("admin", "1", "어드민"),
		new Member("dlwogh", "first", "이재호")
	});
	
%>
<jsp:useBean id="login" class="day10.Member" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="login"/>

<%
	String storeid = request.getParameter("storeid");
	Cookie c = new Cookie("id", login.getId());
	String keeplogin = request.getParameter("keeplogin");
		
	
	for(Member m : list) {
		if(login.getId().equals(m.getId()) && login.getPw().equals(m.getPw())) {
			session.setAttribute("user", m);
			if(storeid != null) {
				c.setMaxAge(600);
				response.addCookie(c);
			}else {
				c.setMaxAge(0);
				response.addCookie(c);
			}
			if(keeplogin != null) {
				Cookie jsessionid = new Cookie("JSESSIONID", session.getId());
				jsessionid.setMaxAge(600);
				response.addCookie(jsessionid);
			}
			response.sendRedirect("loginresult.jsp");
		}
	}
%>
	<script>
		alert('로그인 실패')
		location.href = 'login.jsp';
	</script>







</body>
</html>