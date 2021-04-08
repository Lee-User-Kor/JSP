<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>
</head>
<body>

<h1>ex03.jsp</h1>
<hr>

<h3>request.contextPath() : <%=request.getContextPath() %></h3>
<ul>
	<li><%=pageContext.getAttribute("name") %></li>
	<li><%=request.getAttribute("age") %></li>
	<li><%=session.getAttribute("address") %></li>
	<li><%=application.getAttribute("list") %></li>
</ul>

<ul>
	<li><%=application.getServerInfo() %></li>
	<li><%=application.getMajorVersion() %>.<%=application.getMinorVersion() %></li>
	<li><%=application.getResource(".") %></li>
</ul>


<a href="ex02.jsp"><button>ex02.jsp로 이동</button></a>








</body>
</html>