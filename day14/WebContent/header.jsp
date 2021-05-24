<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member</title>
<style>
	/* style은 자유롭게 */
	body {
		margin: 0;
		padding: 0;
	}
	header {
		background-color: black;
		color: white;
		width: 100%;
	}
	a {
		text-decoration: none;
		cursor: pointer;
		color: inherit;
	}
	nav > ul {
		border: 1px solid black;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	nav > ul > li {
		margin: 0;
		list-style: none;
		padding: 20px;
	}
	nav > ul > li:hover {
		background-color: lightgray;
		color: black;
	}
	h2 {
		text-align: center;
	}
	form > div > p {
		text-align: center;
		margin: 50px;
	}
	input[type="text"],
	input[type="password"],
	input[type="number"] {
		all: unset;
		border-bottom: 2px solid black;
		list-style: none;
	}
	input[type="submit"] {
		all: unset;
		background-color: black;
		color: white;
		width: 150px;
		height: 60px;
		font-weight: bold;
	}
	input[type="submit"]:hover {
		background-color: lightgray;
		color: black;
		cursor: pointer;	
	}
	div {
		text-align: center;
	}
	.info {
		text-align: right;
	}
	.info > p {
		padding-right: 20px;
	}
</style>
</head>
<body>
<header>
	<h1><a href="${cpath }">대문페이지</a></h1>
	<c:if test="${user.id != null }">
	<div class="info">
		<p>${user.id } (${user.name })님 반갑습니다.</p>
		<p><a href="logout.jsp"><button>로그아웃</button></a></p>
	</div>
	</c:if>
	<nav>
		<ul>
			<c:if test="${user.id == null }">
			<li><a href="${cpath }/join.jsp">회원가입</a></li>
			<li><a href="${cpath }/login.jsp">로그인</a></li>
			</c:if>
			<c:if test="${user.id != null }">
			<li><a href="">정보수정</a></li>
			<li><a href="">회원탈퇴</a></li>
			</c:if>
		</ul>
	</nav>
</header>