<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- form 태그의 action 속성을 별도로 지정하지 않으면, 현재 페이지가 요청을 받아서 처리한다 -->
<form>
	<p><input type="text" name="name" placeholder="이름"></p>
	<p><input type="text" name="age" placeholder="나이"></p>
	<p><input type="submit" value="전송"></p>
</form>

<%
	// 사용자가 값을 입력했다면 값을 받아서 출력하면 되지만
	// 값을 입력하지 않은 상태라면?
	String name = request.getParameter("name");		// 지정한 이름의 파라미터가 없으면 null을 반환
	String age = request.getParameter("age");		// 사용자 입력값은 대부분 문자열로 넘어온다
	String data = "";
	if(name != null && age != null && !"".equals(name) && !"".equals(age)) {	
		data = String.format("%s님의 나이는 %s살 입니다", name, age);
	}
%>
<%-- <h2><%=name %>님의 나이는 <%=age %>살 입니다</h2> --%>
<h2><%=data %></h2>


</body>
</html>