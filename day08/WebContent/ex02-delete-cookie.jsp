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
	// 저장되어 있는 쿠키와 이름이 동일한 새로운 쿠키객체를 생성한다. 값은 아무거나 상관없다
	// 쿠키의 값에는 특정 문자나 기호가 들어갈 수 없다(넣으려면 웹인코딩 형식으로 가능)
	Cookie c = new Cookie("comment", null);
	
	c.setMaxAge(0);	// 쿠키의 유효시간을 0으로 만들어서 기존 쿠키를 덮어 씌운다

	response.addCookie(c);
	
	response.sendRedirect("ex02.jsp");	// 지정한 주소로 새로운 GET요청을 수행하도록 한다
%>

</body>
</html>