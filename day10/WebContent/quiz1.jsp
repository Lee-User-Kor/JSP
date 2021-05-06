<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz1.jsp</title>
</head>
<body>
<%--
	로그인 메뉴를 구현하세요
	로그인 폼에는 id, pw, id 저장, 로그인 상태 유지 옵션이 있어야 합니다
	로그인 정보는 자바빈즈 클래스로 처리합니다
	계정 클래스는 id, pw, name 속성을 포함합니다
	쿠키, 세션, 리다이렉트 등의 기술을 사용합니다
	스크립틀릿 혹은 JSTL로 처리할 수 있습니다
	간단한 로고를 만들고, 로고를 클릭하면 로그인 폼으로 이동할 수 있어야 합니다
	이미 로그인 되어 있으면 결과페이지로 이동시켜야하고
	로그인 안된 상태에서는 결과페이지에서 로그인폼으로 이동시켜야합니다
 --%>
 
<h1>quiz1.jsp - 로그인 구현</h1>
<hr>
<%
	if(session.getAttribute("user") != null) {
		response.sendRedirect("loginresult.jsp");
	}
%>
<form method="POST" action="loginsubmit.jsp">
	<p><input type="text" name="id" placeholder="ID" value="${cookie.id.value }" autofocus required></p>
	<p><input type="password" name="pw" placeholder="Password"></p>
	<p><label><input type="checkbox" name="storeid" ${not empty cookie.id ? 'checked' : '' }>ID 저장</label></p>
	<p><label><input type="checkbox" name="keeplogin">로그인 상태 유지</label>
	<p><input type="submit" value="로그인"></p>
</form>
 
 
 
 
 
 
</body>
</html>