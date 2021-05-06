<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04.jsp</title>
</head>
<body>

<h1>Human 리스트 불러오기 (DAO 활용)</h1>
<hr>
<%-- useBean은 지정한 클래스를 이용하여 기본생성자로 객체를 생성한다 --%>
<jsp:useBean id="dao" class="day12.HumanDAO"></jsp:useBean>
<c:set var="list" value="${dao.humanList }"></c:set>
<%-- EL Tag로 속성을 불러오는 형식을 취하면, 실제로는 getter가 호출되고, 실제 속성 유무는 상관없다 --%>

<ul>
	<c:forEach var="human" items="${list }">
		<li>${human.name } : ${human.age }살</li>
	</c:forEach>
</ul>
















</body>
</html>