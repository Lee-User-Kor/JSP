<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04.jsp - EL Scope</title>
</head>
<body>

<h1>ex04.jsp - EL Scope</h1>
<hr>

<%-- 
	pageContext -> request -> session -> application
	
	pageContext에서 먼저 찾고, 없으면 request에서 찾는다
	request에서 찾고 없으면, session에서 찾는다
	session에서 찾고 없으면, application에서 찾는다
	application에서 찾고 없으면, 값이 null이므로 출력하지 않는다
 --%>
<%
	pageContext.setAttribute("test", "test1");
	request.setAttribute("test", "test2");
	session.setAttribute("test", "test3");
	application.setAttribute("test", "test4");
	
	session.setAttribute("itbank", "itbank");
// 	session에 저장하면, 다른 Scope에 접근해서 출력할 때, 출력할 수 없다
// 	scope를 지정하면, 지정한 영역에서만 attribute를 찾는다
%>
<h2>\${test } : ${test }</h2>
<h2>\${pageScope.test } : ${pageScope.test }</h2>
<h2>\${requestScope.test } : ${requestScope.test }</h2>
<h2>\${sessionScope.test } : ${sessionScope.test }</h2>
<h2>\${applicationScope.test } : ${applicationScope.test }</h2>
<br>
<h2>\${sessionScope.itbank } : ${sessionScope.itbank }</h2>
<h2>\${request.itbank } : ${request.itbank }</h2>
<br>
<h2>\${cookie.JSESSIONID.value } : ${cookie.JSESSIONID.value }</h2>
<h2>\${param.name } : ${param.name }</h2>
<h2>\${param.age } : ${param.age }</h2>
<hr>
<h2>\${pageContext.request.contextPath } : ${pageContext.request.contextPath }</h2>
<h2>\${pageContext.requset. } : ${pageContext.request.queryString }</h2>
<%=((HttpServletRequest)pageContext.getRequest()).getContextPath() %>
<%
	String name = "이지은";
	String convert = URLEncoder.encode(name, "UTF-8");	// UTF-8 => URLEncoding
	String decoded = URLDecoder.decode(name, "UTF-8");	// URLEncoding => UTF-8
	System.out.println(convert);
	System.out.println(decoded);
%>







</body>
</html>