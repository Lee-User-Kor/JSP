<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="day06.Account"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz/login.jsp</title>
</head>
<body>
<%
	Account[] arr = {
			new Account("dlwogh","first","이재호", 30),
			new Account("dlwodud","last","이재영", 24),
			new Account("dlrjsgml","father","이건희", 56)
	};
	ArrayList<Account> list = new ArrayList<Account>(Arrays.asList(arr));
	application.setAttribute("list", list);
%>
<%-- <c:set var="list" value="${list }" scope="application"></c:set> --%>
<jsp:useBean id="login" class="day06.Account"></jsp:useBean>
<jsp:setProperty property="*" name="login"/>

<%-- <%
	for(Account info : list) {
		if(login.equals(info)) {
			session.setAttribute("userInfo", info);
			response.sendRedirect("success.jsp");
			return;
		}
	}
	response.sendRedirect("failure.jsp");
%> --%>

<c:forEach var="info" items="${list }">
	<c:if test="${login.equals(info)}">
		<c:set var="userInfo" value="${info }" scope="session" ></c:set>
		<c:redirect url="success.jsp"></c:redirect>
	</c:if>
</c:forEach>
<c:redirect url="failure.jsp"></c:redirect>

</body>
</html>