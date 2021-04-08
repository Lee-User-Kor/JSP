<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04.jsp</title>
</head>
<body>
<%!
	// 요청을 유지하면서, 서버 내의 다른 페이지로 이동하는 기술
	public void forward(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// 아래 두줄을 스크립틀릿에서 그대로 작성해도 사용 가능
		RequestDispatcher rd = request.getRequestDispatcher("ex01.jsp");
		rd.forward(request, response);
	}
	// 클라이언트가 ex04.jsp를 요청한다
	// 서버는 ex04를 요청받았지만 ex01.jsp의 내용을 보여주고 싶다
	// ex01.jsp를 실행하고 나온 응답 결과를 가져다가
	// 전달받은 response객체의 getWriter() 혹은 out 객체를 이용하여 화면에 코드를 찍어준다
%>
<%
	request.setAttribute("name", "아이유");	

// 	request.getRequestDispatcher("ex03.jsp").forward(request, response);

// 	forward(request, response);				// 주소는 변경되지 않고, 페이지 내용만 다른 페이지로 바뀐다

// 	response.sendRedirect("ex01.jsp");		// 주소가 변경되어서, 페이지 내용이 바뀐다

%>
<jsp:forward page="ex01.jsp">
	<jsp:param value="IU" name="name"/>
</jsp:forward>




</body>
</html>