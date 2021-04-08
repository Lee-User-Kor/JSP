<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="day03.Member2" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz1-result</title>
</head>
<body>
<%!
	Member2[] members = {
		new Member2("itbank", "it", "아이티뱅크"),
		new Member2("danbi", "mine", "나단비"),
		new Member2("iu930516", "iu", "이지은")
	};
%>
<jsp:useBean id="login" class="day03.Member2"></jsp:useBean>
<jsp:setProperty property="*" name="login"/>
<%
	String msg = "로그인 실패";
	for(Member2 m : members) {
		if(m.equals(login)) {
			msg = m.getName() + "님, 안녕하세요 !!";
			break;
		}
	}
	if("로그인 실패".equals(msg)) {
		response.sendRedirect("quiz1-form.jsp");	
	}
%>

<h3><%=msg %></h3>

<%-- quiz1-form.jsp 에서 전달하는 파라미터를 액션 태그 형식으로 받아서 객체를 생성하세요 --%>
<%-- 선언부에 작성된 Member2 객체들과 하나씩 비교해서, id와 pw가 일치하면 로그인 성공입니다 --%>
<%-- 객체와 객체간의 일치여부를 판단할 때, 메서드 오버라이딩을 활용해보세요 --%>
<%-- 스크립틀릿에서는 if와 else를 이용하여 경우를 나누어서 처리하세요 --%>
<%-- 로그인 실패 시, 메시지를 출력하는 대신 리다이렉트를 이용하여 이전 페이지로 이동시켜도 됩니다 --%>

<%--
	내장객체 request, response
	파라미터를 처리하는 방법
	자바 빈즈의 정의
	액션 태그
	JSP에서 별도의 클래스 파일을 이용하여 객체를 생성하고 활용할 수 있다
	메서드 오버라이딩을 통해서 나만의 방식을 구현할 수 있다
 --%>

</body>
</html>