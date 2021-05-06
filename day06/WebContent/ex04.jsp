<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04.jsp - JSTL Core</title>
</head>
<body>

<h1>JSTL Core</h1>
<hr>
<h3>c:set - attribute를 추가한다. scope를 지정하지 않으면 기본값으로 pageContext에 추가한다</h3>

<c:set var="member1" value="이지은" scope="page"></c:set>
<c:set var="member2" scope="request">홍진호</c:set>
<c:set var="member3" scope="session">배성재</c:set>
<c:set var="member4" scope="application">고은아</c:set>

<p>\${pageScope.member1 } : ${pageScope.member1 }</p>
<p>\${requestScope.member2 } : ${requestScope.member2 }</p>
<p>\${sessionScope.member3 } : ${sessionScope.member3 }</p>
<p>\${applicationScope.member4 } : ${applicationScope.member4 }</p>

<c:set var="num1">1104</c:set>
<p>\${num1 + 3 } : ${num1 + 3 }</p>
<p>${member1 }${member2 }</p>

<jsp:useBean id="member5" class="day06.Member" scope="session"></jsp:useBean>
<c:set target="${member5 }" property="name" value="김희철"></c:set>
<c:set target="${member5 }" property="age" value="38"></c:set>
<%--
	<jsp:setProperty name="member5" property="*" />
 --%>
<%--
	Member member5 = new Member();
	member5.setName("김희철");
	member5.setAge(38);
	session.setAttribute("member5", member5);
 --%>
<p>\${member5.name } : ${member5.name }</p>
<p>\${member5.age } : ${member5.age }</p>

<h3>c:remove - 지정한 scope의 attribute를 제거한다. 단, 객체의 속성만 제거할 수는 없다</h3>
<c:remove var="member1" scope="page"></c:remove>
<c:remove var="member2" scope="request"></c:remove>
<c:remove var="member3" scope="session"></c:remove>
<c:remove var="member4" scope="application"></c:remove>
<c:remove var="member5" /> <%-- scope를 지정하지 않으면, 모든 영역의 attribute를 제거한다 --%>

<p>\${member1 } : ${member1 }</p>
<p>\${member2 } : ${member2 }</p>
<p>\${member3 } : ${member3 }</p>
<p>\${member4 } : ${member4 }</p>
<p>\${member5 } : ${member5 }</p>

</body>
</html>