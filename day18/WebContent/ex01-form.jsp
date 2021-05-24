<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01-form.jsp</title>
</head>
<body>

<h1>ex01-form.jsp : 파일업로드</h1>
<hr>
<!-- http://www.servlet.com/ -->
<!-- cos.jar 을 WEB-INF/lib 폴더에 넣기 -->
<!-- form 내부에 input type="file"이 있다면, enctype="multipart/form-data"를 지정하자 -->

<form action="ex01-result.jsp" method="POST" enctype="multipart/form-data">
	<p><input type="text" name="name" placeholder="그림이름"></p>
	<p><input type="file" name="uploadFile"></p>
	<p><input type="submit" value="전송"></p>
</form>



















</body>
</html>