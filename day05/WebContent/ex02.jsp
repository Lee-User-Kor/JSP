<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp</title>
</head>
<body>

<h1>ex02.jsp - EL Tag로 파라미터 전달받기</h1>
<hr>

<form method="post" action="">
	<input name="test" placeholder="간단한 문장을 입력하세요" autofocus>
</form>
<p>form 태그 내부에 input 요소가 하나만 있으면 엔터키가 submit의 역할을 수행할 수 있다</p>

<% request.setCharacterEncoding("utf-8"); %>
<h2>표현식 : <%=request.getParameter("test") %></h2>
<h2>EL Tag : ${param.test }</h2>








</body>
</html>