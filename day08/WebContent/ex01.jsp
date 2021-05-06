<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>

<%--
	Cookie : 문자열 데이터를 클라이언트의 컴퓨터에 저장하는 방식
	Client - Cookie / Server - Session
	세션이 값을 서버에 저장한다면, 쿠키는 클라이언트에 저장합니다
	ID 자동저장, 쇼핑몰의 장바구니, 예약내역 등에 활용할 수 있습니다
	
	단, 클라이언트에 저장되는 데이터는 보안상 민감한 데이터를 저장하지 않습니다
	
	자주 이용하는 카페에 가면 스탬프를 찍을 수 있는 쿠폰을 만들어서 준다
	쿠폰은 카페에서 보관히지 않고, 고객이 가지고 다녀야 한다
	웹에서의 쿠키도 위에서 말한 쿠폰과 비슷한 형태로 관리된다
	첫 방문에는 쿠키가 없지만										request.getCookies() == null
	서버에서 쿠키값을 만들어서 클라이언트에게 넘겨주고						response.addCookie(쿠키객체);
	클라이언트는 쿠키를 받아서 보관하다가
	다음번에 같은 서버에 방문할 때, 이전에 받았던 쿠키를 지참하여 요청을 전달하게 되고	Cookies[] cs = request.getCookies();
	서버는 쿠키에 담긴 값을 확인하여 클라이언트마다 다른 처리를 수행할 수 있게 된다		for(Cookie c : cs) {
																if(c.getName().equals("쿠키이름")) {
																	String 쿠키값 = c.getValue();
																}
															}
 --%>











</body>
</html>