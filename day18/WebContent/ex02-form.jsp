<%@page import="day18.ImageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-form.jsp</title>
</head>
<style>
	.box {
		border: 2px solid black;
		padding: 5px;
		margin: 5px;
	}
	.wrap {
		display: flex;
		flex-flow: wrap;
		width: 100%;
	}
</style>
<body>

<h1>ex02-form.jsp</h1>
<hr>

<form method="POST" enctype="multipart/form-data" action="ex02-result.jsp">
	<p><input type="file" name="uploadFile" required></p>
	<p><input type="submit" value="등록"></p>
</form>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<div class="wrap">
	<c:set var="dao" value="<%=ImageDAO.getInstance() %>"/>
	<c:set var="list" value="${dao.selectList() }" />
	<c:forEach var="img" items="${list }">
		<div class="box">
			<div style="background-image: url('${cpath}/uploadFolder/${img.storedFileName }');
						background-size: 200px;
						background-position: center center;
						background-repeat: no-repeat;
						width: 200px;
						height: 200px"></div>
			<div><h3>${img.originalFileName }</h3></div>
		</div>
	</c:forEach>
</div>

</body>
</html>