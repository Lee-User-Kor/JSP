<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h3>ex06 - Mail</h3>

<blockquote>
	<p>include 지시자는 각각의 jsp에서 자바코드를 가져와서 하나로 합친 이후에 컴파일 하여 실행한다</p>
	<p>서로 다른 두 jsp가 하나의 자바코드가 되기 때문에, 변수이름이 중복되면 안된다</p>
	<p>대신, A페이지의 변수를 B페이지에서 참조할 수 있다 (변수가 공유된다)</p>
</blockquote>

<p>test : <%=test %></p>

</body>
</html>