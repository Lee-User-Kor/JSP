<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%	request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="joinData" class="day14.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="joinData"/>
<jsp:useBean id="dao" class="day14.MemberDAO"></jsp:useBean>

<h2>Join Result</h2>
<hr>
<div>
	<p>${dao.join(joinData) }</p>
	<p><a href="${cpath }"><button>돌아가기</button></a></p>
</div>







</body>
</html>