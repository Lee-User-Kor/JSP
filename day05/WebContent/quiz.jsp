<%@page import="day05.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz.jsp</title>
</head>
<body>
<%
	Member[] twice = {
			new Member("나연", 27),
			new Member("사나", 26),
			new Member("다현", 24),
			new Member("정연", 26),
			new Member("지효", 25),
			new Member("채영", 23),
			new Member("모모", 26),
			new Member("미나", 25),
			new Member("쯔위", 23)
	};

	request.setAttribute("twice", twice);
	request.getRequestDispatcher("quiz-result.jsp").forward(request, response);
%>



</body>
</html>