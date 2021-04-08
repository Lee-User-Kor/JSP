<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp</title>
</head>
<body>
<!-- 
	QueryString 형식
	
	문서이름?변수1=값1&변수2=값2&변수3=값3&암구호=화랑%20담배...
	20(16) = 32(10), ASCII Code 32의 문자는 ' '
 -->
<form method="post">
<%--
	GET : 주소창을 통해서 쿼리스트링 형식으로 파라미터를 전달한다. 빠르다.
	POST : 1) 파라미터를 노출시키고 싶지 않거나, 2) 문자열이 아닌 데이터를 전송하고자 할 때
			POST를 사용한다고 해서, 페이지의 보안성이 증가하는 것은 아니다.
 --%>
	<p><input type="text" name="id" placeholder="ID"></p>
	<p><input type="password" name="pw" placeholder="Password"></p>
	<p><input type="submit" value="로그인"></p>	
</form>

<hr>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(id != null && pw != null) {
		%>
		<h2>id : <%=id %></h2>
		<h2>pw : <%=pw %></h2>
		<%
	}	// end of if
%>




</body>
</html>