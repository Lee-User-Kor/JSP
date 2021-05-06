<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");	

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String keepSession = request.getParameter("keepSession");
	
	HashMap<String, String> login = new HashMap<String, String>();
	login.put("id", id);
	login.put("pw", pw);
	
	session.setAttribute("login", login);
	
	// JSESSIONID 쿠키를 생성하고, 유효시간을 설정해서 응답에 같이 보내기
	
	if(keepSession != null) {			// 로그인 상태 유지 체크박스가 체크되어 있으면
		Cookie jsessionid = new Cookie("JSESSIONID", session.getId());
		jsessionid.setMaxAge(600);
		response.addCookie(jsessionid);
	}
	
	response.sendRedirect("ex02-result.jsp");
%>





















</body>
</html>