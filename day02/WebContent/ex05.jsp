<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05.jsp</title>
</head>
<body>

<h1>response.sendRedirect(url)</h1>
<hr>

<form>	<!-- action을 지정하지 않았으므로, 현재 페이지에서 파라미터를 전달받아서 처리한다 -->
	<label><input type="radio" name="target" value="https://www.naver.com">네이버</label>
	<label><input type="radio" name="target" value="https://www.google.com">Google</label>
	<label><input type="radio" name="target" value="https://www.youtube.com">YouTUBE</label>
	<label><input type="radio" name="target" value="ex01.jsp">ex01</label>
	<input type="submit" value="이동">
</form>
<%
	String target = request.getParameter("target");
// 	response.sendRedirect("ex05.jsp");
	// 자신에게 리다이렉트를 걸면
	// ex05에 갔더니 ex05로 가라고 하더라. 그래서 갔더니..... (무한반복)
	
	if (target != null) {
		response.sendRedirect(target);
// 		response.sendRedirect("http://mgr.kgitbank.com");

		// submit 이후 처음 요청은 ex05에게 전달되지만
		// 서버가 클라이언트에게 target으로 이동하라는 응답을 전달하여
		// 클라이언트는 전달받은 주소로 새롭게 요청을 발송하고
		// 새로운 요청에 대해 돌아온 응답을 화면에 표시한다

		// 리다이렉트는 클라이언트가 다음번에 요청할 주소를 서버가 직접 지정할 수 있다
		// 범위의 제한이 없으며, 자신의 문서 뿐 아니라 다른 페이지나 다른 사이트에도 요청하도록 할 수 있다
		// 특정 조건에 따라, 다른 페이지로 강제로 이동시키는 경우 사용한다
		// 클라이언트의 주소창 내용이 변경된다 !!
	}
%>

</body>
</html>