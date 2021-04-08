<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp</title>
</head>
<body>

<%
	// pageContext : 다른 내장 객체를 불러올 수 있으며, 개발자가 지정한 객체를 저장해 둘 수 있다
	HttpServletRequest req = (HttpServletRequest) pageContext.getRequest();
	HttpSession sess = req.getSession();
	ServletContext sc = sess.getServletContext();


	out.println("req == request : " + (req == request) + "<br><br>");
	out.println("sess == session : " + (sess == session) + "<br><br>");
	out.println("sc == application : " + (sc == application) + "<br><br>");
	
	// pageContext, request, session, application은 Object를 저장해두었다가 꺼내쓸수 있는 내장객체
	// 범위(scope)는 순서대로 pageContext가 제일 작고, application이 제일 크다
	
	pageContext.setAttribute("name", new String("이지은"));
	// 현재 페이지 내에서 유효하다. 다른 페이지로 이동하면 저장해둔 객체는 사라진다(pageContext가 바뀐다)
	
	request.setAttribute("age", new Integer(29));
	// 현재 요청이 유지되는 한 유효하다. 일반적으로 요청이 바뀌면 페이지도 바뀌지만
	// forward 형식으로 페이지를 변경한 경우에는 request가 유지된다
	
	session.setAttribute("address", "부산광역시 해운대구 우2동 센텀드림월드");
	// 세션을 강제로 종료시키거나(로그아웃), 클라이언트가 브라우저를 완전 종료하기 전까지 유효하다
	// 서로 다른 페이지에서도 같은 객체에 접근 가능하기 때문에, 활용도가 제법 높다
	
	application.setAttribute("list", Arrays.asList(new String[]{ "KG", "ITBANK" }));
	// 서버가 종료되거나, 재시작하기전까지는 유효하다
	
	// setAttribute(String name, Object ob)
	// ob객체를 지정한 name으로 저장한다. (name을 이용하여 객체를 불러올 수 있다)
	// getAttribute(String name) - Object를 반환, 자바의 모든 객체를 처리한다 (down-casting)
	// getParameter(String name) - String을 반환, 문자열 데이터를 처리한다
	
%>

<ul>
	<li><%=pageContext.getAttribute("name") %></li>
	<li><%=req.getAttribute("age") %></li>
	<li><%=sess.getAttribute("address") %></li>
	<li><%=sc.getAttribute("list") %></li>
</ul>

<a href="ex03.jsp"><button>ex03으로 이동</button></a>



</body>
</html>