<%@page import="day18.ImageDTO"%>
<%@page import="day18.ImageDAO"%>
<%@page import="java.util.UUID"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-result.jsp</title>
</head>
<body>

<%!
	final String uploadPath = "uploadFolder";
	final int uploadFileSizeLimit = 10 * 1024 * 1024;
	final String encType = "UTF-8";
%>
<%
	request.setCharacterEncoding("UTF-8");

	String uploadFilePath = application.getRealPath(uploadPath);
	
	MultipartRequest mpRequest = new MultipartRequest(
			request,
			uploadFilePath,
			uploadFileSizeLimit,
			encType,
			new DefaultFileRenamePolicy()
			);
	String fileName = mpRequest.getFilesystemName("uploadFile");
	if(fileName == null) {
		System.out.println("파일업로드 실패");
	}else {
		File f1 = mpRequest.getFile("uploadFile");
		String extName = fileName.substring(fileName.lastIndexOf("."));
		String f2Name = UUID.randomUUID().toString().replaceAll("-", "") + extName;
		File f2 = new File(uploadFilePath, f2Name);
		f1.renameTo(f2);
// 		Runtime.getRuntime().exec("explorer " + uploadFilePath);

		System.out.println("ori : " + fileName);
		System.out.println("sto : " + f2Name);
		
		ImageDAO dao = ImageDAO.getInstance();
		ImageDTO dto = new ImageDTO();
		dto.setOriginalFileName(fileName);
		dto.setStoredFileName(f2Name);
		int row = dao.insert(dto);
		pageContext.setAttribute("row", row);
	}
%>
<script>
	const row = ${row};
	alert(row == 1 ? '업로드 성공' : '업로드 실패');
	location.href = 'ex02-form.jsp';
</script>















</body>
</html>