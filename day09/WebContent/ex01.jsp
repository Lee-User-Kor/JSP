<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>
<%
	session.setAttribute("name", "value");	// 지정한 객체를 attribute에 등록한다
	session.getAttribute("name");			// 지정한 이름의 attribute를 가져온다
	session.removeAttribute("name");		// 지정한 이름의 attribute를 제거한다
	session.setMaxInactiveInterval(600);	// 세션의 유효시간을 초(second) 단위로 설정한다
											// 쿠키와 달리 0으로 설정하면 무한대가 된다
											
	session.invalidate();					// 현재 세션을 무효화시킨다
	session.getLastAccessedTime();			// 세션에 마지막으로 접근한 시간을 반환한다
	session.getCreationTime();				// 세션이 생성된 시간을 반환한다
	session.getId();						// 세션의 고유 id값을 반환한다
%>

<h1>JSP Session</h1>
<hr>
<%--
	쿠키가 특정 데이터를 클라이언트에 문자열 형태로 저장하는 수단이라면
	세션은 특정 데이터를 서버에 자바 객체 형식으로 저장하는 수단이다
	세션은 JSP 내장 객체로 취급되며, 서로다른 클라이언트마다 별도의 세션을 사용하게 된다
	
	클라이언트는 자신만의 세션을 가지지만
	서버입장에서는 여러 클라이언트의 수 만큼(혹은 그 이상) 세션을 가지기 때문에
	세션을 구분하기 위한 id값을 부여하여 관리하게 된다
	
	세션도 쿠키와 비슷하게 유효 시간을 가지는데, JSP에서는 사용자가 요청을 서버에 전달할 때마다
	세션의 유효시간을 자동으로 갱신하는 형식이다
	
	서버에 지정하는 값이므로, 쿠키보다 안전하기 때문에 보안성이 필요한 데이터를 저장하는데 사용할 수 있다
 --%>











</body>
</html>