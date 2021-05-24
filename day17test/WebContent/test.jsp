<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>

<h1>ex01.jsp - DataSource Test</h1>
<hr>

<jsp:useBean id="dao" class="day17test.Test2DAO" />
<%--
	더 이상 dao를 페이지마다 매번 새로 생성할 필요가 없다 (DataSource, ConnectionPool)
	header.jsp 와 같은 공통 영역에 dao를 생성해두면 된다
	
	-> DAO dao = new DAO() 처럼 생성자를 이용하여 객체를 호출하면 매번 새로운 객체가 생성된다
	-> DAO는 기능 중심의 객체이므로, 여러 객체를 생성해도 의미가 없다
	-> 따라서, 객체를 요청했을 때 메모리에 이미 생성된 객체가 있으면 기존의 객체를 반환하는 형식으로 바꾸어 줄 수 있다
	
	-> singleton 패턴 : 메모리 상에 객체가 하나만 존재할 수 있도록 고안하는 방식
 --%>

<fieldset>
	<h2>${dao.test() }</h2>
</fieldset>

<fieldset>
	<h2>${dao.test() }</h2>
</fieldset>

<fieldset>
	<h2>${dao.test() }</h2>
</fieldset>

</body>
</html>