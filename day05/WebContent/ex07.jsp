<%@page import="java.util.Map"%>
<%@page import="java.util.Arrays"%>
<%@page import="day05.Test"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex07.jsp</title>
</head>
<body>

<h1>ex07.jsp - getter / setter</h1>
<hr>
<h3>EL Tag가 속성에 접근할 때는 getter를 통해서 접근한다</h3>
<%
	new ArrayList(Arrays.asList(new Integer[] {50})).get(0);			// get(index)
	new HashMap().get("key");											// get(key)
	new Test().getNum();												// get***()
	
	Test test3 = new Test();
	test3.setNum(1524);
	request.setAttribute("test3", test3);
	
	Map<String, Integer> map = new HashMap<String, Integer>();
	map.put("num", 7777);
	session.setAttribute("map", map);
%>
${not empty test2 ? test2.num : 'test2 is empty' }

<h2>\${test2.num }</h2>
<ol>
	<li>자주 사용되는 컬렉션이면 get("num")</li>
	<li>객체가 getter를 가지고 있으면, getNum()</li>
	<li>\${test3.num } : ${test3.num }</li>
	<li>\${map.num } : ${map.num }</li>
	<li><%=test3.getNum() %></li>
	<li><%=map.get("num") %></li>
	<li>\${test3.myMethod() } : ${test3.myMethod() }</li>
</ol>













</body>
</html>