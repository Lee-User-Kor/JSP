<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>
<style>
	header {
		width: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	nav {
		width: 100%;
		display: flex;
		justify-content: center;
		align-items: center;	
	}
	nav > ul {
		display: flex;
		justify-content: center;
		align-items: center;
		list-style: none;
		padding-left: 0;
	}
	nav > ul > li {
		padding-right: 20px;
		text-align: center;
	}
	a {
		color: inherit;
		text-decoration: none;
	}
</style>
</head>
<body>

<header>
	<h1><a href="<%=request.getContextPath() %>">ITBANK</a></h1>
</header>

<%
	String test = "itbank";
%>


<nav>
	<ul>
		<li><a href="ex06.jsp">메일</a></li>
		<li><a href="ex07.jsp">카페</a></li>
		<li><a href="">블로그</a></li>
		<li><a href="">지식iN</a></li>
		<li><a href="">쇼핑</a></li>
	</ul>
</nav>
<hr>

