<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz.jsp</title>
</head>
<body>
<%-- JSP 주석, 브라우저에서 확인할 수 없다
	1) java.util.Date, java.text.SimpleDateFormat 을 import 하세요 (directive)
	2) 현재 날짜 객체를 생성하여 yyyy-MM-dd hh:mm:ss 형식의 문자열로 반환하는 함수
		public String getToday() 함수를 정의하세요 (declaration)
	3) String.format() 함수를 이용하여 "지금은 %s 입니다" 형식으로 문자열을 준비하세요 (scriptlet)
	4) <h2> 태그 내부에 준비된 문자열 값을 출력하세요 (expression)
 --%>

<%!
	public String getToday() {
		String today = new SimpleDateFormat("yyyy년 MM월 dd일, hh시 mm분 ss초").format(new Date());
		return today;
	}
%>
<%
	String str = String.format("지금은 %s 입니다", getToday());
%>


<h2><%=str %></h2>

</body>
</html>