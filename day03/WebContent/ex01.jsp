<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>
<%
// 	String myId = "itbank";		// 상황에 따라서 값은 달라질 수 있다
%>
	<h1>자바 클래스를 이용하여 파라미터를 처리하기</h1>
	<hr>
	<form action="ex01-result.jsp">
		<p>
			<input type="text" name="id" placeholder="ID">
		</p>
		<p>
			<input type="password" name="pw" placeholder="Password">
		</p>
		<p>
			<input type="text" name="name" placeholder="Input Your Name">
		</p>
		<p>
			<input type="number" name="age" min="0" max="100" placeholder="Age">
		</p>
		<p>
			<label><input type="radio" name="gender" value="men">남성</label>
			<label><input type="radio" name="gender" value="women">여성</label>
		</p>
		<p>
			<input type="submit" value="전송">
		</p>
	</form>

</body>
</html>