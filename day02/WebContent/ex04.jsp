<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04.jsp</title>
</head>
<body>
<%
	// response, 클라이언트에게 보낼 응답 메시지를 표현하는 객체
	response.setCharacterEncoding("UTF-8");
	
	String charEncoding = response.getCharacterEncoding();
	String contentType = response.getContentType();
	
	HashMap<Integer, String> map = new HashMap<Integer, String>();
	map.put(200, "정상");
	map.put(302, "변경된 주소");
	map.put(400, "변경된 주소");		// 400번대의 상태 메시지는 클라이언트에서 문제가 발생한 경우
	map.put(401, "인증되지 않음");
	map.put(403, "권한이 없음");
	map.put(404, "페이지를 찾을 수 없음(요청받은 URI를 처리할 수 없음)");
	map.put(405, "요청을 처리할 수 없는 형식(Method)");
	map.put(500, "서버 오류");			// 500번대의 상태 메시지는 서버에서 문제가 발생한 경우
	
	int sc = 500;					// HTTP Status Code
	
	response.sendError(sc, map.get(sc));
// 	int test = Integer.parseInt("하하하. 난 숫자가 되지 않을거다 !!");

%>
<h2>charEncoding : <%=charEncoding %></h2>
<h2>contentType : <%=contentType %></h2>

</body>
</html>