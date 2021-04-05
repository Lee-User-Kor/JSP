<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp - 두 수의 덧셈</title>
</head>
<body>

<h1>두 수의 덧셈</h1>
<hr>
<form action="ex02-result.jsp"> <!-- 값을 전달받아서 action을 취하는 페이지를 적어준다 -->
								<!-- 브라우저 주소창에 주소를 입력한다 : 요청 발생, 요청은 서버에 전송 -->
								<!-- 링크를 클릭하여 브라우저 주소창이 변경된다 : 요청 발생 -->
								<!-- form태그를 submit(제출)하여 입력값을 포함하는 새로운 요청이 발생 -->
	<input type="number" name="n1" min="0" max="100">
	+
	<input type="number" name="n2" min="0" max="100">
	=
	<input type="submit">
</form>

</body>
</html>