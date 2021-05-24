<%@page import="day18.FileUpload"%>
<%@page import="day18.ImageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<%-- FileUpload 클래스를 활용하여 이미지를 업로드할 수 있고, 목록을 출력하는 페이지를 만드세요 --%>

<h1>ex03.jsp</h1>
<hr>
<c:if test="${pageContext.request.method == 'GET' }">
<form method="POST" enctype="multipart/form-data">
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
</c:if>

<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="fileUpload" class="day18.FileUpload"/>
	<c:set var="dto" value="${fileUpload.getImageDTO(pageContext.request) }"/>
	<c:set var="dao" value="<%=ImageDAO.getInstance() %>"/>
	<c:set var="row" value="${dao.insert(dto) }" />
	<script>
		const row = ${row};
		alert(row == 1 ? '성공' : '실패');
		location.href = 'ex03.jsp';
	</script>
</c:if>



</body>
</html>