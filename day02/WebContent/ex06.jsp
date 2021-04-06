<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06.jsp</title>
</head>
<body>
<%
	String param = request.getParameter("name");
	// 단일 파라미터 변수의 값을 가져올 때 사용한다, 값이 여러개이면 가장 처음에 전달된 값을 반환한다
	
	String[] values = request.getParameterValues("name");
	// 지정한 name과 일치하는 여러 파라미터 값을 문자열 배열 형식으로 반환한다
	
	Enumeration<String> names = request.getParameterNames();
	// 요청에 담긴 모든 파라미터의 이름을 열거자 형식으로 반환한다
	
	Map<String, String[]> map = request.getParameterMap();
	// 요청에 담긴 모든 파라미터를 가져오며, 하나의 이름에 여러개 값이 있을 수도 있어서 값은 배열로 처리한다
%>





</body>
</html>