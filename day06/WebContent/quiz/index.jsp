<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz/index.jsp</title>
</head>
<body>
<%--
	quiz/index.jsp - ID와 비밀번호를 입력받는 로그인 폼(POST, action="login.jsp")을 작성하세요
	
	quiz/login.jsp - Account.java 클래스를 이용하여 파라미터를 받으세요.
					  로그인 여부에 따라 success.jsp / failure.jsp 로 이동시키세요 (redirect)
					  로그인 성공 시, 계정 정보를 담은 객체를 session 에 setAttribute 하세요
					  필요한 계정 정보를 List<Account> 형식으로 만들어서, application 객체에 넣어두세요
					 (스크립틀릿으로 모두 처리가능)
					  
	quiz/success.jsp - 계정의 모든 속성 정보를 출력하세요 (session 객체에서 값 꺼내서 출력하기)
	
	quiz/failure.jsp - <script>alert('로그인 실패 !!'); location.replace('index.jsp'); </script>
	
	Account.java - id, pw, name, age 필드를 작성하고, getter / setter 를 가지도록 하세요
	
 --%>

<form method="POST" action="login.jsp">
	<p>
		<strong>ID</strong> : <input type="text" name="id" placeholder="ID를 입력하세요" autofocus required autocomplete="none">
	</p>
	<p>
		<strong>PW</strong> : <input type="password" name="pw" placeholder="PW를 입력하세요" required>
	</p>
	<p>
		<input type="submit" value="로그인">
	</p>
</form>












</body>
</html>