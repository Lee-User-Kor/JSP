<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>

<h1>EL Tag</h1>
<hr>
<ul>
	<li>JSP의 Expression(표현식)은 자바 객체의 값을 출력하는 데 사용하는 문법</li>
	<li>자바는 객체 지향언어이고, JSP는 웹 형식이므로, 여러페이지간의 객체를 전달하는 형태가 많이 사용된다</li>
	<li>attribute 형식으로 객체를 주고 받을 때 마다, 자료형 변환을 하는건 번거로운 작업이다</li>
	<li>이런 단점을 해소하기 위해 등장한 문법이 Expression Language, EL Tag</li>
	<li>
		<ol>
			<li>내장 객체의 attribute에 손쉽게 접근 가능하다</li>
			<li>파라미터나 쿠키 등의 요소에도 접근하기 쉽다</li>
			<li>값이 null이면 출력하지 않는다</li>
			<li>EL Tag는 JSP의 기본 스펙이므로, JSP 구동 가능한 환경이면 어디서나 사용이 가능하다</li>
			<li>EL Tag의 최소 스펙은 Java 1.5, Tomcat 6, Servlet 2.5 이상</li>
			<li>\${ 객체.속성 }</li>
		</ol>	
	</li>
</ul>





</body>
</html>