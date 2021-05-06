<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz2</title>
</head>
<body>

<h1>quiz2.jsp - ID 자동 저장</h1>
<hr>


<%-- <%
// 	Cookie[] cs = request.getCookies();
// 	if(cs != null) {
// 		for(Cookie c : cs) {
// 			switch(c.getName()) {
// 			case "id":
// 				String id = c.getValue();
// 				String urlDecoded = URLDecoder.decode(id, "UTF-8");
// 				pageContext.setAttribute("id", urlDecoded);
				
// 			case "storeid":
// 				String storeid = c.getValue();
// 				pageContext.setAttribute("storeid", storeid);
// 				break;
// 			}
// 		}
// 	}
%> --%>

<c:if test="${pageContext.request.method == 'POST' }">
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String cbox = request.getParameter("storeid");
	
	if(id != null && pw != null && pw != "") {
		if(cbox != null) {
			String urlEncoding = URLEncoder.encode(id, "UTF-8");
			Cookie c1 = new Cookie("id", urlEncoding);
			Cookie c2 = new Cookie("storeid", cbox);
			
			c1.setMaxAge(60 * 60 * 24);
			c2.setMaxAge(60 * 60 * 24);
			
			response.addCookie(c1);
			response.addCookie(c2);
		}else {
			Cookie c1 = new Cookie("id", null);
			Cookie c2 = new Cookie("storeid", null);
			
			c1.setMaxAge(0);
			c2.setMaxAge(0);

			response.addCookie(c1);
			response.addCookie(c2);
		}
	}else {
		Cookie c1 = new Cookie("id", null);
		Cookie c2 = new Cookie("storeid", null);
		
		c1.setMaxAge(0);
		c2.setMaxAge(0);

		response.addCookie(c1);
		response.addCookie(c2);
	}
%>
<c:redirect url="quiz2.jsp"></c:redirect>
</c:if>

<form method="POST">
	<p><input type="text" name="id" value="${cookie.id.value }" placeholder="ID"></p>
	<p><input type="password" name="pw" placeholder="Password"></p>
	<p><input type="checkbox" ${cookie.storeid.value == 'on' ? 'checked' : '' } name="storeid" id="storeid" ><label for="storeid">ID 저장하기</label></p>
	<p><input type="submit" value="로그인"></p>
</form>
<%--
	1) 아이디와 비밀번호를 입력하면 현재 페이지(혹은 다른 페이지)에서 파라미터를 받는다
	2) 특별히 출력할 것은 없다
	3) 만약, 체크박스에 체크하고 입력하면 마지막으로 입력한 ID가 input에 입력되어 있다
	
	- checkbox가 전달하는 value는 지정하지 않으면 "on" 이다 (체크되지 않으면 null)
	- checkbox에는 checked 속성을 이용하여 처음부터 체크된 상태로 만들 수 있다
	- type="text" 에는 value속성에 값을 넣으면 미리 입력된 값을 만들 수 있다
 --%>



</body>
</html>