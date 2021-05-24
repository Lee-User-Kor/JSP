<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01-result.jsp</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	
	String savePath = "uploadFolder";
	int uploadFileSizeLimit = 1024 * 1024 * 10;	// byte -> KB -> MB * 10
	String encType = "UTF-8";
	
	String uploadFilePath = application.getRealPath(savePath);
	File folder = new File(uploadFilePath);
	if(folder.exists() == false) {
		folder.mkdir();
	}
	
	Runtime.getRuntime().exec("explorer " + uploadFilePath);	// 지정한 경로를 탐색기로 열기
	
	MultipartRequest mp = new MultipartRequest(
		request,								// 기본적으로 사용하는 요청 객체
		uploadFilePath,							// 업로드 파일의 경로
		uploadFileSizeLimit,					// 업로드 파일 크기 제한
		encType,								// 인코딩 타입
		new DefaultFileRenamePolicy()			// 이름이 중복되면 이름을 새로 지정하는 규칙(정책, 중복이면 뒤에 숫자붙음)
	);
	File uploadFile = mp.getFile("uploadFile");	// request.getParameter 처럼 input의 name을 문자열로 지정
	
	System.out.println(uploadFile);
	System.out.println(uploadFile.getAbsolutePath());
	System.out.println(uploadFile.getName());
	
	pageContext.setAttribute("savePath", savePath);
	pageContext.setAttribute("fileName", uploadFile.getName());
	pageContext.setAttribute("name", mp.getParameter("name"));
	
%>
<h2>${name }</h2>
<img src="${pageContext.request.contextPath }/${savePath }/${fileName }">


















</body>
</html>