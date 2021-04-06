<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex07-result.jsp</title>
</head>
<body>

<h1>여러 파라미터 처리하기</h1>
<hr>
<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String[] lang = request.getParameterValues("lang");
	String lastSchool = request.getParameter("lastSchool");
	
	boolean goBack = name == null && age == null && gender == null && lang == null;
	boolean goBack2 = ("".equals(name) && "".equals(age) && gender == null);
	// type="text" 혹은 "password" 혹은 "number" 와 같이 글상자(필드) 형태로 입력을 받는 경우는
	// "" 빈문자열이 값으로 전달될 수 있으며, 이는 null이 아니다	[ "" != null ]
	
	if(goBack || goBack2) {
		response.sendRedirect("ex07.jsp");
		return;		// return 은 메서드를 종료하는 예약어
	}
	
	out.print("<fieldset>");
	out.print("name : " + name);
	out.print("<br> age : " + age);
	out.print("<br> gender : " + gender);
	out.print("<br> lang : ");
	for(int i = 0; lang != null && i < lang.length; i++){
		out.print(lang[i] + " ");
	}
	out.print("<br> lastSchool : " + lastSchool);
	out.print("</fieldset>");
	
%>

<%
	Map<String, String[]> map = request.getParameterMap();
	// key와 value의 조합
	
	Set<String> keySet = map.keySet();
	// 중복을 허용하지 않는 집합, index가 존재하지 않는다
	
	out.print("<fieldset>");
	for(String key : keySet) {
		String[] values = map.get(key);
		out.print(key + " : ");
		for(String value : values) {
			out.print(value + " ");
		}
		out.print("<br>");
	}
	out.print("</fieldset>");
%>

<%
	Map<String, String[]> map2 = request.getParameterMap();
	Enumeration<String> names = request.getParameterNames();
	
	out.print("<fieldset>");
	while(names.hasMoreElements()) {
		String key = names.nextElement();
		String[] values = request.getParameterValues(key);
		out.print(key + " : ");
		for(String value : values) {
			out.print(value + " ");
		}
		out.print("<br>");
	}
	out.print("</fieldset>");
	
%>




</body>
</html>