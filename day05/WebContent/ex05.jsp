<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05.jsp</title>
</head>
<body>

<h1>ex05.jsp - EL Tag 연산자</h1>
<hr>
<h3>제어문은 사용할 수 없으나, 연산자는 사용 가능하다</h3>

<ul>
	<li>\${10 + 1 } : ${10 + 1 }</li>
	<li>\${5 - 3 } : ${5 - 3 }</li>
	<li>\${2 * 3 } : ${2 * 3 }</li>
	<li>\${5 / 2 } : ${5 / 2 }</li>
	<li>\${10 % 3 } : ${10 % 3 }</li>
	<li>\${10 mod 3 } : ${10 mod 3 }</li>
	<li>\${10 > 3 } : ${10 > 3 }</li>
	<li>\${10 gt 3 } : ${10 gt 3 }</li>
	<li>\${10 lt 3 } : ${10 lt 3 }</li>
	<li>\${10 >= 3 } : ${10 >= 3 }</li>
	<li>\${10 ge 3 } : ${10 ge 3 }</li>
	<li>\${10 <= 3 } : ${10 <= 3 }</li>
	<li>\${10 le 3 } : ${10 le 3 }</li>
	<li>\${10 == 3 } : ${10 == 3 }</li>
	<li>\${10 eq 3 } : ${10 eq 3 }</li>
	<li>\${10 != 3 } : ${10 != 3 }</li>
	<li>\${10 ne 3 } : ${10 ne 3 }</li>
	<li>\${10 > 3 && 10 % 2 == 0 } : ${10 > 3 && 10 % 2 == 0 }</li>
	<li>\${10 gt 3 and 10 % 2 eq 0 } : ${10 gt 3 and 10 % 2 eq 0 }</li>
	<li>\${10 > 3 || 10 % 2 != 0 } : ${10 > 3 || 10 % 2 != 0 }</li>
	<li>\${10 gr 3 or 10 mod 2 ne 0 } : ${10 gt 3 or 10 mod 2 ne 0 }</li>
	<li>\${!(10 > 3) } : ${!(10 > 3) }</li>
	<li>\${not(10 > 3) } : ${not(10 > 3) }</li>
	<li>\${empty test } : ${empty test }</li>
	<li>\${10 % 2 == 0 ? '짝수' : '홀수' } : ${10 % 2 == 0 ? '짝수' : '홀수' }</li>
</ul>
<%
	String roomNumber = "1104";
	pageContext.setAttribute("roomNumber", roomNumber);
%>
<h2>\${roomNumber + 1 } : ${roomNumber + 1 }</h2>
<h2>\${roomNumber }\${1 } : ${roomNumber }${1 }</h2>















</body>
</html>