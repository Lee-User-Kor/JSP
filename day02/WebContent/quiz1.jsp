<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz1.jsp</title>
</head>
<body>

<h1>Quiz1 - 이름과 나이를 전달하기</h1>
<hr>
<form action="quiz1-result.jsp">
	<p><input type="text" name="name" placeholder="이름" autofocus required autocomplete="off" size="6"></p>
	<p><input type="number" name="age" placeholder="나이" required min="0" max="100"></p>
	<p><input type="submit" value="확인"></p>
</form>
<%-- 이름, 나이, 성인/미성년자 여부, 요청자의 IP, 요청받은 시점의 현재 시간을 화면에 출력하기 --%>

</body>
</html>