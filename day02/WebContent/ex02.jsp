<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>request 내장 객체</h1>
<hr>
<h3>request : 클라이언트(웹 브라우저)가 서버에게 요청하는 메시지를 담는 객체</h3>

<%
	request.setCharacterEncoding("UTF-8");	// 요청 내용을 구성하는 글자를 UTF-8로 처리한다
	
	String localAddr = request.getLocalAddr();
	String localName = request.getLocalName();
	int localPort = request.getLocalPort();
	String charEncoding = request.getCharacterEncoding();
	int serverPort = request.getServerPort();
	String url = request.getRequestURL().toString();
	String uri = request.getRequestURI();
	String remoteAddr = request.getRemoteAddr();
	
%>

<ul>
	<li><strong>서버의 IP 주소</strong> : <%=localAddr %></li>
	<li><strong>서버의 호스트 이름</strong> : <%=localName %></li>
	<li><strong>서버의 서비스 포트번호</strong> : <%=localPort %></li>
	<li><strong>서버의 서비스 포트번호</strong> : <%=serverPort %></li>
	<li><strong>요청내용의 인코딩 방식</strong> : <%=charEncoding %></li>
	<li><strong>URL</strong> : <%=url %></li>
	<li><strong>URI</strong> : <%=uri %></li>
	<li><strong>서버에 접속한 사용자의 주소</strong> : <%=remoteAddr %></li>
</ul>

<h3>
	<%=request.getProtocol() %>			<%-- 어떤 프로토콜(규칙,약속)을 이용하여 요청을 전달하는가 --%>
	<%=request.getLocalAddr() %>		<%-- 어느 서버(IP,Name)에게 요청을 보내는가 --%>
	<%=request.getLocalPort() %>		<%-- 지정한 서버의 어느 포트로 접근하는가 --%>
	<%=request.getRequestURI() %>		<%-- 프로토콜 + 서버 + 포트 이후 어떤 자원을 요청하는가 --%>
	<%=request.getQueryString() %>		<%-- 자원을 요청하면서 추가로 전달하는 데이터는 무엇이 있는가 --%>
</h3>

</body>
</html>