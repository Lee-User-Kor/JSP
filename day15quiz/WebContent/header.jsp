<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="day15quiz.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day15quiz.jsp</title>
</head>
<style>
</style>
<body>

<header>
	<div>
		<h1><a href="${cpath }">도서 관리 프로그램</a></h1>
	</div>
	<div>
		<c:if test="${user != null }">
			${user.id } (${user.name })
			<a href="logout.jsp"><button>로그아웃</button></a>
		</c:if>
	</div>
	<nav>
		<ul>
		<c:if test="${user == null }">
			<li><a href="${cpath }/join.jsp">회원가입</a></li>
			<li><a href="${cpath }/login.jsp">로그인</a></li>
			<li><a href="${cpath }/book-list.jsp">도서 목록</a></li>
		</c:if>
		<c:if test="${user != null }">
			<li><a href="${cpath }/book-list.jsp">도서 목록</a></li>
<%-- 			<li><a href="${cpath }/book-modify.jsp">도서 정보 수정</a></li> --%>
			<li><a href="${cpath }/member-modify.jsp">회원 정보 수정</a></li>
			<li><a href="${cpath }/member-delete.jsp">회원 탈퇴</a></li>
		</c:if>
		</ul>
	</nav>
</header>
