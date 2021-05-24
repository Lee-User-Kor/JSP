<%@page import="day16quiz.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day16quiz</title>
</head>
<style>
</style>
<body>

<c:set var="dao" value="<%=MemberDAO.getInstance() %>"></c:set>

<header>
	<h1><a href="${pageContext.request.contextPath }">Day 16 QUIZ - 싱글톤 활용</a></h1>
	<div>
		<c:if test="${not empty user }">
			${user.userId } (${user.userName })
			<a href="logout.jsp"><button>로그아웃</button></a>
		</c:if>
	</div>
	<nav>
		<ul>
			<c:if test="${empty user }">
			<li><a href="join.jsp">회원 가입</a></li>
			<li><a href="login.jsp">로그인</a></li>
			</c:if>
			<c:if test="${not empty user }">
			<li><a href="modify.jsp">회원 정보 수정</a></li>
			<li><a href="delete.jsp">회원 탈퇴</a></li>
			</c:if>
		</ul>
	</nav>
</header>

