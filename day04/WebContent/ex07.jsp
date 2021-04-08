<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>

<h3>ex07 - Cafe</h3>

<blockquote>
	<p>include ActionTag는 각각의 파일을 컴파일 한 후 실행한 결과를 합쳐서 보여준다</p>
	<p>따라서 같은 이름의 변수를 서로 다른 파일에 만들어도 충돌하지 않는다</p>
	<p>단, 변수나 함수를 공유할 수 없다는 차이가 있다</p>
</blockquote>
<%
	String test = "삼다수";
%>

<p>test : <%=test %></p>


</body>
</html>