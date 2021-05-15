<%@ page import="member.*"%>
<%@ page import="board.*"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="boardDAO" value="<%=BoardDAO.getInstance() %>" />
<c:set var="memberDAO" value="<%=MemberDAO.getInstance() %>" />
<c:set var="replyDAO" value="<%=ReplyDAO.getInstance() %>" />
<%-- <%@ include file="footer.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>projectshop</title>
</head>
<style>

 body {
      margin: 0px;
      padding: 0px;
      display: flex;
      flex-flow: column;
      align-items: center;
   }
   a {
      text-decoration: none;
      color: black;
      cursor: pointer;
   }
   .center {
      display: flex;
      justify-content: center;
      align-items: center;
   }
   
/* 	html, body { */
/* 		height: 100%; */
/* 	} */
/* 	main { */
/* 		position: relative; */
/* 		height: 2000px; */
/* 		display: flex; */
/* 		flex-flow: column; */
/* 		align-items: center; */
		
/* 	} */

/* 	.content-img { */
/* 		width: 300px; */
/* 		height: 240px; */
/* 	} */
/* 	img { */
/* 		cursor: pointer; */
/* 	} */
/* 	a { */
/* 		 text-decoration: none; */
/* 		 color: inherit; */
/* 	} */
/* 	body { */
/* 		overflow-x: hidden; */
/* 		position: relative; */
/* 		margin: 0;		 */
/* 	} */
/* 	input[type='submit'] { */
/* 		background-color: #dadada; */
/* 	} */
/* 	헤더페이지 */
	 header {
      width: 100%;
      background-color: rgba(255, 255, 255, 0.6);
   }
   header > h2 {
   	text-align: center;
   	font-size: 40pt;
   }
   #logo {
      margin: 0px;
      margin-top: 30px;
   }
   header ul {
      margin: 0px;
      padding: 0px;
      list-style: none;
   }
   .header-top {
      display: flex;
      justify-content: space-between;
      margin-top: 20px;
      padding: 0 20px;
   }
   .nav {
      display: flex;
      margin: 0px;
   }
   .header-top img {
      width: 35px;
      height: 35px;
      cursor: pointer;
   }
   #src > li {
      margin-right: 8px;
   }
   #icon > li {
      margin-left: 8px;
   }
   #category {
      width: 100%;
      z-index: 1;
      top: 0px;
      position: sticky;
      background-color: rgba(255, 255, 255, 0.6);
   }
   #category > ul > li {
      list-style: none;
      margin: 10px 10px;
      display: flex;
      flex-flow: column;
      justify-content: center;
      align-items: center;
   	 
   }
   
   
/* 	인덱스페이지 */
	.product-list1, .product-list2 {
		display: flex;
		margin-bottom: 30px;
		width: 1588px;
		justify-content: space-between;
	}
	.index {
/* 		position: absolute; */
/* 		top: 20%; */
/* 		left: 50%; */
/* 		margin-left: -794px; */
		
	}
/* 	로그인페이지 */
	.login-form {
/* 		position: absolute; */
/* 		margin-top: 150px; */
		background-color: #ffcccb;
		width: 100%;
		height: 799px;
		padding-top: 20px;
	}
	.login-form > form > h2 {
		text-align: center;
	}
	.login-form > form > p > input[type='text'],
	.login-form > form > p > input[type='password'],
	.login-form > form > p > input[type='submit'] {
		width: 250px;
		height: 50px;
	}
	.login-form > form > p {
		text-align: center;
	}
/* 	조인페이지 */
	.join {
/* 		position: absolute; */
/* 		margin-top: 150px; */
		background-color: #ffcccb;
		width: 100%;
		height: 799px;
		padding-top: 20px;
	}
	.join > h2 {
		text-align: center;
	}
	.join > #input > p {
		text-align: center;
	}
	.join > #input > p > input[type='text'],
	.join > #input > p > input[type='password'],
	.join > #input > p > input[type='submit'] {
		width: 250px;
		height: 40px;
	}
	.join > #input > p > textarea {
		resize: none;
		width: 250px;
		height: 100px;
	}
	.join > #input > p > #sample6_postcode {
		width: 145px;
	} 
	.join > #input > p > input[type='button'] {
		height: 45px;
	}
	.join > #input > p > select {
		width: 80px;
		height: 40px;
	}
	.join > #input > p > #tel {
		width: 75px;
		height: 35px;
	}
/* 	커뮤니티페이지 */
	.community {
/* 		position: absolute; */
/* 		margin-top: 150px; */
		background-color: #ffcccb;
		width: 100%;
		height: 100%;
		padding-top: 20px;
	}
	.community > h2 {
		text-align: center;
	}
	.community > table {
		width: 60%;
		margin: auto;
		border-top: 1px solid black;
		border-bottom: 1px solid black;
 		border-collapse: collapse;
		margin-bottom: 20px;
	}
	.community > table > thead > tr > th,
	.community > table > tbody > tr > td {
		border-top: 1px solid black;
		border-bottom: 1px solid black;
		padding: 15px;
	}
	.community > table > tbody > tr > #idx,
	.community > table > tbody > tr > #writer,
	.community > table > tbody > tr > #writedate {
		text-align: center;
	}
	.community > .search {
		display: flex;
		justify-content: space-between;
		width: 60%;
		margin: auto;
		margin-bottom: 20px;
	}
	.community > .search > div > form > select,
	.community > .search > div > form > input,
	.community > .search > div > a > button {
		height: 30px;
	}
	.community > .paging {
		text-align: center;
		font-size: 15pt;
		margin-bottom: 30px;
	}
/* 	작성페이지 */
	.write {
/* 		position: absolute; */
/* 		margin-top: 150px; */
		background-color: #ffcccb;
		width: 100%;
		height: 900px;
		padding-top: 20px;
	}
	.write > h2 {
		text-align: center;
	}
	.write > form > div,
	.write > form > p {
		text-align: left;
		
	}
	.write > form > p > textarea {
		resize: none;
	}
	.write > form {
		width: 60%;
		margin: auto;
	}
	.write > form > div > p {
		border-top: 1px solid black;
		margin: 0;
		height: 30px;
		line-height: 30px;
	}
	.write > form > div > p > input {
		border: none;
		background-color: inherit;
		width: 60%;
		height: 30px;
		outline: none;
	}
	.write > form > p > #textarea {
		width: 100%;
		height: 500px;
		margin-top: 10px;
		background-color: inherit;
		outline: none;
	}
	.write > form > #ptext,
	.write > form > #pfile {
		border-top: 1px solid black;
		margin-top: 0;
		margin-bottom: 0;
	}
	.write > form > #pfile {
		height: 30px;
		line-height: 30px;
	}
	.write > form > .foot {
		border-top: 1px solid black;
		display: flex;
		justify-content: space-between;
	}
	.write > form > .foot > div > #pbtn > button {
		height: 40px;
	}
/* 	읽기페이지 */
	.read, .read-check {
/* 		position: absolute; */
/* 		margin-top: 150px; */
		background-color: #ffcccb;
		width: 100%;
		height: 100%;
		padding-top: 20px;
	}
	.read > div {
		width: 60%;
		margin: auto;
	}
	.read-check > .read-form {
		text-align: center;
	}
	.read-check > .read-form > form > p > input {
		width: 250px;
		height: 40px;
	}
	
	.read > .head1, .read > .head2 {
		display: flex;
		justify-content: space-between;
		border-top: 1px solid black;
		height: 30px;
		line-height: 30px;
	}
	.read > .head1 > #head1vc {
		width: 250px;
		border-left: 1px solid black;
		text-align: left;
	}
	.read > .head1 > #head1t {
		width: 600px;
	}
	.read > .head2 > #head2w {
		width: 600px;
	}
	.read > .head2 > #head2wd {
		width: 300px;
		border-left: 1px solid black;
		text-align: left;
	}
	.read > .content {
		border-top: 1px solid black;
		height: 500px;
		background-color: inherit;
		outline: none;
	}
	.read > .foot {
		border-top: 1px solid black;
		padding-top: 10px;
		display: flex;
		justify-content: space-between;
	}
	.read > .foot > div > a > button {
		width: 120px;
		height: 30px;
	}
	.read > .reply > form > textarea {
		resize: none;
		width: 90%;
		height: 45px;
	}
	.read > .reply-list > .reply-up {
		display: flex;
		justify-content: space-between;
		border-bottom: 1px solid black;
		margin-top: 5px;
		padding-bottom: 5px;
	}
	.read > .reply-list {
		border: 1px solid black;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	.read > .reply-list > div > p {
		margin: 0;
		padding-bottom: 20px;
		border-bottom: 1px solid black;
	}
	.read > .reply-list > div > a > button {
		margin: 5px 0;
	}
	#replyform {
		width: 60%;
		margin: auto;
	}
	#replyform > textarea {
		resize: none;
		width: 850px;
		height: 50px;
	}
/* 	수정체크페이지 */
	.modify-check {
/* 		position: absolute; */
/* 		margin-top: 150px; */
		background-color: #ffcccb;
		width: 100%;
		height: 800px;
		padding-top: 20px;
	}
	.modify-check > h2 {
		text-align: center;
	}
	.modify-check > form > p {
		text-align: center;
	}
	.modify-check > form > p > input {
		width: 250px;
		height: 40px;
	}
/* 	수정체크페이지 */
	.modify {
/* 		position: absolute; */
/* 		margin-top: 150px; */
		background-color: #ffcccb;
		width: 100%;
		height: 900px;
		padding-top: 20px;
	}
	.modify > form {
		width: 60%;
		margin: auto;
	}
	.modify > form >.head1, .modify > form > .head2 {
		display: flex;
		justify-content: space-between;
		border-top: 1px solid black;
		height: 30px;
		line-height: 30px;
	}
	.modify > form > .head1 > #head1vc {
		width: 250px;
		border-left: 1px solid black;
		text-align: left;
	}
	.modify > form > .head1 > #head1t {
		width: 600px;
	}
	.modify > form > .head2 > #head2w {
		width: 600px;
	}
	.modify > form > .head2 > #head2wd {
		width: 300px;
		border-left: 1px solid black;
		text-align: left;
	}
	.modify > form > .content {
		border-top: 1px solid black;
		height: 500px;
	}
	.modify > form > .content > #content-text {
		outline: none;
		resize: none;
		background-color: inherit;
		width: 100%;
		height: 200px;
	}
	.wrapmodi {
		display: flex;
		justify-content: space-between;
	}
	
	.delete-check {
		position: absolute;
		margin-top: 150px;
		background-color: #ffcccb;
		width: 100%;
		height: 1000px;
		padding-top: 20px;
	
	}
 
	
	#title {
		background-color: inherit;
		border: none;
	}
	.mem-modi {
/* 		position: absolute; */
/* 		margin-top: 150px; */
		background-color: #ffcccb;
		width: 100%;
		height: 800px;
		padding-top: 20px;
	}
	.mem-modi > #input {
		text-align: center;
	}
	.mem-modi > #input > p > input[type='text'],
	.mem-modi > #input > p > input[type='password'],
	.mem-modi > #input > p > input[type='submit'] {
		width: 250px;
		height: 40px;
	}
	.mem-modi > #input > p > #sample6_postcode {
		width: 145px;
	} 
	.mem-modi > #input > p > input[type='button'] {
		height: 45px;
	}
	.mem-modi > #input > p > select {
		width: 80px;
		height: 40px;
	}
	.mem-modi > #input > p > #tel {
		width: 75px;
		height: 35px;
	}
/* 	div#footer { */

/* 	 	background-color: gray; */
/* 	    width: 100%; */
/* 	    height: 25%; */
/* 	    display: flex; */
/* 		justify-content: space-between; */
/* 		align-items: center; */
	 
/* 	} */
	  /* footer */
   #footer {
      background-color: rgba(0, 0, 0, 0.2);
      width: 100%;
      height: 250px;
      display: flex;
      justify-content: space-between;
      padding: 0px 20px;
   }
   #footer p {
      margin: 0px;
   }
   #footer h5 {
      margin: 0px;
      font-size: 20px;
   border-bottom: 2px solid black;
   }
   #footer > div {
      margin: 0px 100px;
      padding: 70px 0px;
   }
	.login-info {
		margin-left: 20px;
	}




</style>
<body>

<header>

      <h2 id="logo"><a href="${cpath }/index.jsp">La vie en Rose</a></h2>
   <div class="header-top">
      <div>
         <ul class="nav" id="src">
            <li><a href="${cpath }/member/${empty login ? 'login.jsp' : 'logout.jsp' }">${empty login ? '로그인' : '로그아웃' }</a></li>
            <li><a href="${cpath }${empty login ? '/member/join.jsp' : '/member/mem-modify.jsp' }">${empty login ? '회원가입' : '마이페이지' }</a></li>
            <li><a href="${cpath }/board/community.jsp?page=1">커뮤니티</a></li>
         </ul>
      </div>
      <div>
         <ul class="nav" id="icon">
            <li><img src="${cpath }/image/KakaoTalk_20210510_162759987_01.png"></li>
            <li><img src="${cpath }/image/KakaoTalk_20210510_162759987_02.png"></li>
            <li><img src="${cpath }/image/KakaoTalk_20210510_162759987.png"></li>
         </ul>
      </div>
   </div>
   <div class="login-info">
      <c:if test="${not empty login }">
      ${login.name } 공주님, 어서오십시오♥
      </c:if>
   </div>
</header>
<div class="center" id="category">
   <ul class="nav">
      <li><a href="">BEST ITEM</a></li>
      <li><a href="">TOP</a></li>
      <li><a href="">BOTTOM</a></li>
      <li><a href="">DRESS</a></li>
      <li><a href="">OUTER</a></li>
      <li><a href="">SET</a></li>
      <li><a href="">SALE</a></li>
   </ul>
</div>





