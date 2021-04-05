<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>
</head>
<body>
<%!	// declaration, 선언부 : 클래스의 멤버 필드 혹은 멤버 메서드를 작성하는 것과 같다
	// 멤버 필드는 객체가 생성된 이후부터 소멸(웹 서버가 재시작하면)하기 전까지 유지된다
	// Web Application Server는 첫번째 요청을 받았을 때 객체가 없으면 객체를 생성하고
	// 이후 요청을 받았을 때 객체가 존재하면 새로 생성하지 않고 기존 객체를 활용한다(소스 코드 변화가 없을 경우에만)
	// 소스코드에 변화가 있다면 새로 컴파일 하여 새로운 객체가 생성되므로, 멤버 필드의 값도 소멸할 수 있다
	int n1 = 0;
%>

<%
	// scriptlet : 메인함수와 같은 역할을 하는 부분, 즉 메서드다. 메서드에서 선언된 변수는 지역변수
	// 지역변수는 메서드가 종료되면 소멸한다
	int n2 = 1;
	
	n1++;
	n2++;
	String str = new String("Hello, world !!");
%>

<h1>변수의 범위</h1>
<hr>
<h3>n1 : <%=n1 %></h3>
<h3>n2 : <%=n2 %></h3>

</body>
</html>