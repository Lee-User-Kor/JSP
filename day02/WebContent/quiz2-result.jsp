<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
// 	Map<String, String[]> map = request.getParameterMap();
	
// 	Set<String> keySet = map.keySet();
	
// 	out.print("<fieldset>");
// 	for(String key : keySet) {
// 		String[] values = map.get(key);
// 		out.print(key + " : ");
// 		for(String value : values) {
// 			out.print(value + " ");
// 		}
// 		out.print("<br>");
// 	}
// 	out.print("</fieldset>");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String correctPw = request.getParameter("correctPw");
	if(!correctPw.equals(pw)) {
		response.sendRedirect("quiz2.jsp");
	}
	String locate = request.getParameter("locate");
	String gender = request.getParameter("gender");
	String name = request.getParameter("name");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String date = request.getParameter("date");
	String birth = String.format("%s년 %s월 %s일", year, month, date);
	String phoneNum = request.getParameter("phoneNum");
	String email = request.getParameter("email");
	if(email == null || "".equals(email)) {
		email = id + "@naver.com";
	}
	String now = new SimpleDateFormat("yyyy년 MM월 dd일 | hh시 mm분 ss초").format(new Date());
	boolean check1 = id == null && pw == null && correctPw == null && name == null
			&& year == null && date == null && phoneNum == null;
	boolean check2 = "".equals(id) || "".equals(pw) || "".equals(correctPw) || "".equals(name)
			|| "".equals(year) || "".equals(date) || "".equals(phoneNum);
	if(check1 || check2){
		response.sendRedirect("quiz2.jsp");
	}
%>

<h1>Quiz2-result</h1>
<hr>
<h2><%=id %>님, 회원가입을 축하드립니다!!</h2>
<hr>
<p><%=id %>님의 회원정보<fieldset>
	<ul>
		<li>국적 : <%=locate %></li>
		<li>성별 : <%=gender %></li>
		<li>이름 : <%=name %></li>
		<li>생년월일 : <%=birth %></li>
		<li>전화번호 : <%=phoneNum %></li>
		<li>E-mail : <%=email %></li>
		<li>가입일자 : <%=now %></li>
	</ul>
	</fieldset>
</p>
</body>
</html>