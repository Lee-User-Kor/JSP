<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<form method="post">
<div>
	<a href="">아이디 : </a>
	<input type="text" placeholder="ID 입력" autofocus required autocomplete="off">
</div>
<div>
	<a href="">비밀번호 : </a>
	<input type="password" placeholder="PW 입력" required>
</div>
<div>
	<a href="">이름 : </a>
	<input type="text" placeholder="이름 입력" required autocomplete="off">
</div>
<div>
	<a href="">생년월일 : </a>
	<input type="text" placeholder="생년월일(yyyymmdd)" required autocomplete="off">
</div>
<div>
	<a href="">성별 : </a>
	<select>
		<option>성별</option>
		<option value="남성">남성</option>
		<option value="여성">여성</option>
	</select>
</div>
<div>
	<input type="submit" value="회원가입">
</div>
</form>


</body>
</html>