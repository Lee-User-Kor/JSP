<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="day07t.Book, java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	if(application.getAttribute("list") == null) {		// application에 list가 없으면
		Book[] arr = new Book[] { new Book("수학의 정석", "홍성대", "성지출판(주)", "1966-01-01", 5000),
				new Book("달러구트 꿈 백화점", "이미애", "팩토리나인", "2020-07-08", 500),
				new Book("공정하다는 착각", "마이클 샌델", "와이즈베리", "2020-12-01", 1000),
				new Book("주린이도 술술 읽는 친절한 주식책", "최정희, 이슬기", "메이트북스", "2020-09-01", 345),
				new Book("스토리텔링 바이블", "대니얼 조슈아 루빈", "블랙피쉬", "2020-12-06", 500),
				new Book("어떻게 말해줘야 할까", "오은영", "김영사", "2020-10-08", 700),
				new Book("마음챙김의 시", "류시화", "수오서재", "2020-09-15", 123)
		};
		ArrayList<Book> list = new ArrayList<Book>(Arrays.asList(arr));
		application.setAttribute("list", list);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day07 - 연습</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<header>
		<h1>
			<a href="${pageContext.request.contextPath }">도서 관리 프로그램</a>
		</h1>
		<nav>
			<ul>
				<li><a href="list.jsp">목록</a></li>
				<li><a href="add.jsp">추가</a></li>
				<%-- 
					추가할 데이터를 입력받는 페이지
					입력받은 데이터를 리스트에 추가하는 페이지
				 --%>
			</ul>
		</nav>
	</header>