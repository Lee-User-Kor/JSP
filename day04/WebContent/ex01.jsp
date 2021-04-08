<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>

<h1>ex01.jsp - 내장 객체의 종류</h1>
<hr>
<ul>
	<li>★request : parameter, attribute, header, addr, hostname, port, dispatcher</li>
	<li>★response : getWriter, sendError, sendRedirect</li>
	<li>out : print, println ...</li>
	<li>page : JSP 자신, this</li>
	<li>config : JSP 초기 파라미터를 저장하는 객체</li>
	<li>★session : 각 클라이언트와 서버가 통신하는 개별 단위 객체 (로그인 정보 저장)</li>
	<li>★application : JSP 서블릿 컨텍스트, 서버 당 동시에 하나만 있다 (저장소로 사용할 수도 있다)</li>
	<li>★pageContext : JSP에서 다른 내장객체에 접근할 수 있는 메서드를 제공</li>
	<li>exception : page 지시자에서 isErrorPage=true 로 설정된 경우 사용 가능</li>
</ul>

<h3>객체를 저장할 수 있는 내장객체 - pageContext, request, session, application</h3>

<h3>attr-name : <%=request.getAttribute("name") %></h3>
<h3>param-name : <%=request.getParameter("name") %></h3>

<fieldset>
	<legend>parameter vs attribute</legend>
	<ul>
		<li>parameter는 문자열이고, attribute는 객체이다</li>
		<li>parameter는 사용자 입력값이고, attribute는 개발자가 넣은 객체이다</li>
		<li>parameter는 setter가 없고, attribute는 getter/setter가 모두 있다</li>		
		<li>자바는 객체 지향 언어이므로, 입력은 parameter로 받지만, 처리는 attribute로 하는것이 보통이다</li>		
	</ul>
</fieldset>

<%
	HashMap<String, Object> map = new HashMap<String, Object>();
	map.put("name", "이지은");
	map.put("age", 29);
	pageContext.setAttribute("map", map);
%>
<%
	Object obj = pageContext.getAttribute("map");
	HashMap<String, Object> map2 = (HashMap<String, Object>) obj;
	String name = (String)map2.get("name");
	int age = (Integer)map2.get("age");
%>

<%=name %>님은 <%=age %>살입니다<br>

${map.name }님은 ${map.age }살입니다<br>


</body>
</html>
