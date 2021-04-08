<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz1-form.jsp</title>
</head>
<body>

<h1>quiz1 - 로그인 비슷하게 구현하기</h1>
<hr>

<form action="quiz1-result.jsp" method="post">
	<p><input type="text" name="id" placeholder="ID" autofocus required autocomplete="off"></p>
	<p><input type="password" name="pw" placeholder="PW" required></p>
	<p><input type="submit" value="로그인"></p>
</form>

<%--
	1. 계정이 없거나, 비밀번호가 일치하지 않는 모든 경우에 대해서 '로그인 실패' 라는 메시지를 출력한다
	2. 일치하면 지정한 계정의 사용자 이름을 출력하면서 안녕하세요 라는 메시지를 출력한다
	3. 계정은 3개 이상 필요하다
	4. 자바 빈즈와 액션 태그를 활용한다
	5. 비밀번호가 주소창에 노출되지 않아야 한다
	6. 메서드 오버라이딩을 사용할 수 있다
 --%>

</body>
</html>