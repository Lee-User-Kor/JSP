<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<jsp:useBean id="dao" class="day15quiz.MemberDAO"></jsp:useBean>
<c:set var="list" value="${dao.getMemberList() }"></c:set>

<h2>Member List</h2>
<hr>
<table>
	<thead>			
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>나이</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="mInfo" items="${list }">
		<tr>
			<td>${mInfo.id }</td>
			<td>${mInfo.pw }</td>
			<td>${mInfo.name }</td>
			<td>${mInfo.age }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>







</body>
</html>