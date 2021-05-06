<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="day06.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06.jsp - c:forEach</title>
</head>
<body>
<%
	Member[] arr = {
		new Member("이지은", 29),
		new Member("홍진호", 38),
		new Member("강지언", 27),
		new Member("배국한", 29),
		new Member("이영화", 22)
	};
	ArrayList<Member> list = new ArrayList<Member>(Arrays.asList(arr));
	
	pageContext.setAttribute("arr", arr);
	pageContext.setAttribute("list", list);
%>


<h1>c:forEach</h1>
<hr>
<%--
	for(Member member : arr) {
		out.print("<li>" + member.getName() + " : " + member.getAge() + "</li>");
	}
 --%>
<h3>배열의 요소를 화면에 반복문으로 출력하기</h3>
<ul>
	<c:forEach var="member" items="${arr }">
		<li>${member.name } : ${member.age }</li>
	</c:forEach>
</ul>

<h3>리스트의 요소를 화면에 반복문으로 출력하기</h3>
<table border="1" cellpadding="10" cellspacing="0">
	<thead>
		<tr>
			<th>st.index</th>
			<th>st.count</th>
			<th>st.first</th>
			<th>st.last</th>
			<th>이름</th>
			<th>나이</th>
			<th>성인여부</th>
		</tr>
	</thead>
	<tbody>
<%-- 		<tr><th>${list }</th></tr> --%>
		<c:forEach var="member" items="${list }" varStatus="st">
		<tr style="background-color: ${st.index % 2 == 0 ? 'skyblue' : 'salmon' };
					color: ${st.last ? 'yellow' : 'inherit' }">
			<td>${st.index }</td>
			<td>${st.count }</td>
			<td>${st.first }</td>		<%-- st.index == 0 --%>				<%-- 첫번째 값에서만 true --%>
			<td>${st.last }</td>		<%-- st.last == list.size - 1 --%>	<%-- 마지막 값에서만 true --%>
			<td>${member.name }</td>
			<td>${member.age }</td>
			<td>${member.age >= 33 ? '성인' : '미성년자' }</td>
		</tr>
		</c:forEach>
	</tbody>
</table>

<div>
<p>
<c:forEach var="m" items="${list }" varStatus="st">
	${m.name }
	<c:if test="${st.last == false }">
		,
	</c:if>
	<c:if test="${st.last == true }">
		</p>
	</c:if>
</c:forEach>
</div>

<h3>횟수에 의한 반복</h3>

<ul>
	<%-- end값을 포함하는 범위로 반복을 수행한다 --%>
	<c:forEach var="i" begin="1" end="10" step="1">
		<li style="color: ${i % 2 == 0 ? 'green' : 'red' };">
			${i } : ${i % 2 == 0 ? '짝수' : '홀수' }
		</li>
	</c:forEach>
</ul>

<%--
	for(int i=0; i <= 5; i++) {
		out.print("<li>" + i + "</li>");
	}
 --%>







</body>
</html>