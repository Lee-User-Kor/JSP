<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
<style>
	main {
		border: 3px solid red;
		padding: 20px;
		margin: 20px;
		width: 90%;
	}
</style>
</head>
<body>

<h1>JSTL</h1>
<hr>
<div>
	<form>
		<select name="select">
			<c:forEach var="i" begin="1" end="6" step="1">
				<c:set var="fileName" value="ex0${i }.jsp"></c:set>
				<option ${param.select == fileName ? 'selected' : '' }>
					${fileName }
				</option>
			</c:forEach>
		</select>
		<input type="submit" value="보기">
	</form>
</div>


<main>
	<c:if test="${not empty param.select }">
		<jsp:include page="${param.select }"></jsp:include>
	</c:if>
</main>













</body>
</html>