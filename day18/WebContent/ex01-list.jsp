<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01-list.jsp</title>
</head>
<body>

<%
	final String uploadPath = "uploadFolder";
	final String absoPath = application.getRealPath(uploadPath);
	
	File folder = new File(absoPath);
	if(folder.exists() && folder.isDirectory()) {
		String[] fileList = folder.list();
		pageContext.setAttribute("list", fileList);
		pageContext.setAttribute("uploadPath", uploadPath);
	}
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }"></c:set>
<c:forEach var="name" items="${list }">
	<c:set var="filewebPath" value="${cpath }/${uploadPath }/${name }"/>
	<h3>${filewebPath }</h3>
	<div>
		<a href="${filewebPath }">
		<img src="${cpath }/${uploadPath }/${name }" height="200px">
		</a>
	</div>
</c:forEach>











</body>
</html>