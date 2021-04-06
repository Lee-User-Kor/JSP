<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>
</head>
<body>
<%
	PrintWriter pw = response.getWriter();
	// PrintWriter : 문자열을 내보내는 스트림을 처리할 수 있는 객체
	// response : 클라이언트에게 보낼 응답을 객체화 한 형태

	pw.println("<h1>ex03.jsp</h1>");
	pw.println("<hr>");
	pw.println("<p>안녕하세요</p>");
	pw.println("pw : " + pw.toString() + "<br>");
	pw.println("out : " + out.toString() + "<br>");
	
	out.println("<p>out 내장 객체 : response에 문자열을 기록할 수 있도록 하는 JSP 내장 객체</p>");
	out.println("<p>1) Hello, world !!</p>");
	out.println("<div style=\"border: 1px solid black; width: 100px; height: 100px;\"></div>");
	out.println("<input type=\"text\" name=\"name\" placeholder=\"이름\">");
	
%>
<p>2) Hello, world !!</p>
<div style="border: 1px solid red; width: 100px; height: 100px"></div>
<input type="text" name="age" placeholder="나이">
</body>
</html>