<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-form.jsp</title>
</head>
<body>
<%--
	로그인 정보 입력 -> 파라미터를 전달받음 -> 각 파라미터를 DB에 전달하여 조건에 맞는 값을 불러옴
	-> 계정이 있으면 계정 객체를 반환받아서 내장 객체 session에 저장
	-> 계정이 없으면 실패 메시지를 출력하고 이전페이지로 이동
	select * from member where id=? and pw=?
--%>
<h1>DB를 활용한 로그인 예제</h1>
<hr>

<form method="POST" action="ex02-submit.jsp">
	<p><input type="text" name="id" placeholder="ID"></p>
	<p><input type="password" name="pw" placeholder="Password"></p>
	<p><input type="submit" value="로그인"></p>
</form>






















</body>
</html>