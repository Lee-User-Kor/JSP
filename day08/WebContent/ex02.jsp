<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp - cookie</title>
</head>
<body>
<%
	// 쿠키는 요청시에 request객체와 함께 전달된다
	Cookie[] cs = request.getCookies();
	if(cs == null) {
		%>
			<script>
				alert('첫번째 방문이시네요. 반갑습니다');			
			</script>
		<%
	}else {
		for(Cookie c : cs) {
			if(c.getName().equals("comment")) {
				String comment = c.getValue();
				String urlDecoded = URLDecoder.decode(comment, "UTF-8");
				pageContext.setAttribute("comment", urlDecoded);
			}
		}
	}
%>

<%--
	1) 사용자가 값을 서버에 전송 (parameter, 문자열)
	2) 서버는 값을 받아서 문자열 값을 쿠키로 만들어내고 response에 담아서 같이 보낸다
	3) 클라이언트는 전달받은 쿠키를 브라우저의 쿠키 저장소에 보관한다
	4) 같은 사이트에 재방문시, 클라이언트가 보관하던 쿠키를 request에 같이 묶어서 보낸다 (쿠폰 지참)
	5) 서버는 쿠키를 확인하고, 쿠키에 담긴 값을 활용하여 응답을 구성하여 보낸다
	6) 쿠키의 규약상, 사용할 수 없는 글자도 있어서 URLEncoding을 활용하는 경우가 많다
 --%>

<h1>사용자 입력 폼</h1>
<hr>
<form action="ex02-result.jsp">
	<input type="text" name="comment" value="${comment }" placeholder="메모를 입력하세요">
	<input type="submit" value="전송">
</form>
<h2>\${cookie.comment.value } : ${cookie.comment.value }</h2>
<button id="js-cookie-btn">javascript 쿠키 확인</button>
<a href="ex02-delete-cookie.jsp"><button>쿠키(comment) 삭제</button></a>

<script>
	document.getElementById('js-cookie-btn').onclick = function() {
		alert(document.cookie);
	}
</script>










</body>
</html>