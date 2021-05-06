<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz1.jsp</title>
</head>
<body>

<h1>Member 테이블 내용 모두 불러오기</h1>
<hr>
<jsp:useBean id="dao" class="day13.MemberDAO"></jsp:useBean>
<c:set var="list" value="${dao.memberList }"></c:set>

<table border="3" cellpadding="10" cellspacing="0" align="center" width="500px">
	<tr>
		<th>ID</th>
		<th>PW</th>
		<th>NAME</th>
		<th>AGE</th>
	</tr>
	<c:forEach var="member" items="${list }">
		<tr>
			<td>${member.id }</td>
			<td>${member.pw }</td>
			<td>${member.name }</td>
			<td>${member.age }</td>
		</tr>
	</c:forEach>
</table>



</body>
</html>