<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02 - result.jsp</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	String comment = request.getParameter("comment");
	if(comment == null) {
		response.sendRedirect("ex02.jsp");
	}else {	// 입력값이 존재하면
		String urlEncoding = URLEncoder.encode(comment, "UTF-8");
		Cookie c = new Cookie("comment", urlEncoding);
		// new Cookie(String name, String value) 
		
		c.setMaxAge(60 * 60 * 24 * 7);
		// 쿠키가 유지되는 시간을 설정한다 (second 단위 정수)
		
		response.addCookie(c);	// 서버가 클라이언트에게 보내는 메시지
		// 클라이언트는 comment라는 이름으로 사용자가 입력한 문자열을 전달받게 된다
	}
%>
<h2>입력값 : ${param.comment }</h2>
<a href="ex02.jsp"><button>입력 페이지로</button></a>
<h2>주소창에 복사해서 넣으세요 : [ javascript:alert(document.cookie) ]</h2>




</body>
</html>