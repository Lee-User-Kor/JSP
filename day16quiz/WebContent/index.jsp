<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%--
	기존 member 테이블을 제거하고
	새로 구성하세요
	
	idx 		number			primary key
	userid		varchar2(20)	unique not null
	userpw		varchar2(500)	not null
	username	varchar2(50)	not null
	age			number			check between 0 and 100
	gender		varchar2(10)	check gender in ('남성', '여성')
	registDate	date			default sysdate
	
	싱글톤 + 커넥션 풀 형태의 DAO를 구성하고, 회원에 관련된 CRUD를 구현한 페이지
	java.util.Date
 --%>
<c:set var="list" value="${dao.getList() }"></c:set>
 
 <h3>Member List</h3>
 <hr>
 <table>
 	<thead>
 		<tr>
 			<th>IDX</th>
 			<th>USERID</th>
 			<th>USERPW</th>
 			<th>USERNAME</th>
 			<th>AGE</th>
 			<th>GENDER</th>
 			<th>REGISTDATE</th>
 		</tr>
 	</thead>
 	<tbody>
 		<c:forEach var="userList" items="${list }">
 			<tr>
 				<td>${userList.idx }</td>
 				<td>${userList.userId }</td>
 				<td>${userList.userPw }</td>
 				<td>${userList.userName }</td>
 				<td>${userList.age }</td>
 				<td>${userList.gender }</td>
 				<td>${userList.registDate }</td>
 			</tr>
 		</c:forEach>
 	</tbody>
 </table>
 
 
 
 
</body>
</html>