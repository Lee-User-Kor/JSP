<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz1.jsp</title>
<style>
	header > div {
		display: flex;
		justify-content: flex-end;
	}
	main > pre{
		font-size: 20px;
	}
</style>
</head>
<%
	Cookie[] cs = request.getCookies();
	if(cs == null) {
		%>
			<script>
				alert('첫번째 방문이시네요. 반갑습니다');			
			</script>
		<%
	}else {
		for(Cookie c : cs) {
			if(c.getName().equals("fcolor")) {
				String fcolor = c.getValue();
				String urlDecoded = URLDecoder.decode(fcolor, "UTF-8");
				pageContext.setAttribute("fcolor", urlDecoded);
			}else if(c.getName().equals("bcolor")) {
				String bcolor = c.getValue();
				String urlDecoded = URLDecoder.decode(bcolor, "UTF-8");
				pageContext.setAttribute("bcolor", urlDecoded);
			}else if(c.getName().equals("theme")) {
				String theme = c.getValue();
				String urlDecoded = URLDecoder.decode(theme, "UTF-8");
				pageContext.setAttribute("theme", urlDecoded);
			}
		}
	}
%>
<body style="background-color: ${bcolor }; color: ${fcolor }; ">
<%--
	테마를 선택하고 버튼을 누르면 테마가 변경되고
	쿠키에 의해서 값이 저장되므로, 브라우저 종료 후 재 방문해도 테마가 유지되어야 한다
	form에서 POST 방식으로 요청하니깐 쿠키처리를 마친 후 현재 페이지로 리다이렉트 처리하자(GET)
	쿠키에 저장하는 값은 색상을 저장하거나, 테마 이름을 저장할 수 있다
	문자열 저장 시, URLEncoding을 활용하여 저장하도록 하자
	마지막으로 선택한 테마가 우측 상단에 선택된 상태로 유지되어야 한다
	<option selected>
 --%>

<header>
	<h1>quiz1.jsp - 색상 테마 쿠키에 저장하기</h1>
	<div>
		<form method="POST">
			<select name="theme">		<!-- 글자		/	배경 -->
				<option ${theme == 'Basic' ? 'selected' : '' }>Basic</option>	<!-- black / white -->
				<option ${theme == 'Dark' ? 'selected' : '' }>Dark</option>	<!-- white / grey -->
				<option ${theme == 'Blue' ? 'selected' : '' }>Blue</option>	<!-- blue / skyblue -->
				<option ${theme == 'Salmon' ? 'selected' : '' }>Salmon</option>	<!-- red / salmon -->
			</select>
			<input type="submit" value="테마 변경">
		</form>
		<button id="js-cookie-btn">javascript 쿠키 확인</button>

		<script>
			document.getElementById('js-cookie-btn').onclick = function() {
				alert(document.cookie);
			}
		</script>
	</div>
</header>
<hr>
<main>
<h2>Shape of you</h2>
<pre>
	The club isn't the best place to find a lover
	So the bar is where I go
	Me and my friends at the table doing shots
	Drinking fast and then we talk slow
	Come over and start up a conversation with just me
	And trust me I'll give it a chance now
	Take my hand, stop, put Van the Man on the jukebox
	And then we start to dance, and now I'm singing like
</pre>
<ul>
	<li>쿠키는 브라우저에 저장되므로, 서버의 상태와 무관하게 값을 불러와서 활용할 수 있다</li>
	<li>서로 다른 페이지에서도 쿠키를 참조할 수 있다</li>
	<li>쿠키는 즉시 적용되지 않고, 클라이언트가 다음 요청을 전송했을 때 사용할 수 있다</li>
</ul>
</main>

<c:if test="${pageContext.request.method == 'POST' }">
	<%
		request.setCharacterEncoding("UTF-8");
		String theme = request.getParameter("theme");
		if(theme == null) {
			response.sendRedirect("quiz1.jsp");
		}else if(theme.equals("Dark")) {
			String urlEncoding1 = URLEncoder.encode("white", "UTF-8");
			String urlEncoding2 = URLEncoder.encode("grey", "UTF-8");
			String urlEncoding3 = URLEncoder.encode(theme, "UTF-8");
			Cookie c1 = new Cookie("fcolor", urlEncoding1);
			Cookie c2 = new Cookie("bcolor", urlEncoding2);
			Cookie c3 = new Cookie("theme", urlEncoding3);
			
			c1.setMaxAge(60 * 60 * 24 * 7);
			c2.setMaxAge(60 * 60 * 24 * 7);
			c3.setMaxAge(60 * 60 * 24 * 7);
			
			response.addCookie(c1);
			response.addCookie(c2);
			response.addCookie(c3);
		}else if(theme.equals("Blue")) {
			String urlEncoding1 = URLEncoder.encode("blue", "UTF-8");
			String urlEncoding2 = URLEncoder.encode("skyblue", "UTF-8");
			String urlEncoding3 = URLEncoder.encode(theme, "UTF-8");
			Cookie c1 = new Cookie("fcolor", urlEncoding1);
			Cookie c2 = new Cookie("bcolor", urlEncoding2);
			Cookie c3 = new Cookie("theme", urlEncoding3);
			
			c1.setMaxAge(60 * 60 * 24 * 7);
			c2.setMaxAge(60 * 60 * 24 * 7);
			c3.setMaxAge(60 * 60 * 24 * 7);
			
			response.addCookie(c1);
			response.addCookie(c2);
			response.addCookie(c3);
		}else if(theme.equals("Salmon")) {
			String urlEncoding1 = URLEncoder.encode("red", "UTF-8");
			String urlEncoding2 = URLEncoder.encode("salmon", "UTF-8");
			String urlEncoding3 = URLEncoder.encode(theme, "UTF-8");
			Cookie c1 = new Cookie("fcolor", urlEncoding1);
			Cookie c2 = new Cookie("bcolor", urlEncoding2);
			Cookie c3 = new Cookie("theme", urlEncoding3);
			
			c1.setMaxAge(60 * 60 * 24 * 7);
			c2.setMaxAge(60 * 60 * 24 * 7);
			c3.setMaxAge(60 * 60 * 24 * 7);
			
			response.addCookie(c1);
			response.addCookie(c2);
			response.addCookie(c3);
		}else if(theme.equals("Basic")) {
			String urlEncoding1 = URLEncoder.encode("black", "UTF-8");
			String urlEncoding2 = URLEncoder.encode("white", "UTF-8");
			String urlEncoding3 = URLEncoder.encode(theme, "UTF-8");
			Cookie c1 = new Cookie("fcolor", urlEncoding1);
			Cookie c2 = new Cookie("bcolor", urlEncoding2);
			Cookie c3 = new Cookie("theme", urlEncoding3);
			
			c1.setMaxAge(60 * 60 * 24 * 7);
			c2.setMaxAge(60 * 60 * 24 * 7);
			c3.setMaxAge(60 * 60 * 24 * 7);
			
			response.addCookie(c1);
			response.addCookie(c2);
			response.addCookie(c3);
		}
	%>
	<c:redirect url="quiz1.jsp"></c:redirect>
</c:if>



</body>
</html>