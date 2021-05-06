<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp - JSTL Core Tag</title>
</head>
<style>
	.red { color: red;}
</style>
<body>

<h1>JSTL Core Tag</h1>
<hr>
<ul>
	<li><strong class="red">c:set</strong> : 변수(attribute)를 선언하거나, 값을 설정한다</li>
	<li><strong>c:remove</strong> : 변수의 값을 제거한다</li>
	<li><strong class="red">c:if</strong> : 조건을 만족하면 코드를 수행한다</li>
	<li><strong>c:choose</strong> : 여러 조건에 따라 다른 처리를 수행한다</li>
	<li><strong class="red">c:forEach</strong> : 반복처리를 위해 사용, 횟수에 의한 반복, 컬렉션에 의한 반복 가능</li>
	<li><strong>c:forTokens</strong> : 구분자로 분리된 각각의 문자열 토큰을 처리한다</li>
	<li><strong>c:Import</strong> : url을 지정하여 외부 자원을 가져온다</li>
	<li><strong class="red">c:redirect</strong> : response.sendRedirect() 와 동일한 기능</li>
	<li><strong>c:url</strong> : 문자열을 url형식으로 출력한다</li>
	<li><strong>c:out</strong> : 데이터를 출력하는 태그, 표현식이나 표현언어(EL)로 처리 가능</li>
	<li><strong>c:catch</strong> : 예외 처리에 사용한다</li>
</ul>
<%--
	프로젝트폴더/WebContent/WEB-INF/lib/jstl.jar
	프로젝트폴더/WebContent/WEB-INF/lib/standard.jar
	
	[확인하기]
	프로젝트폴더/Java Resources/Libraries/Web App Libraries 에서 라이브러리 포함 여부 확인
 --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
	page	directive - 인코딩, import
	include	directive - 다른 JSP를 현재 문서에 포함시키고, 컴파일하는 지시자
	taglib	directive - 외부 태그를 사용하기 위한 선언문
 --%>


<c:set var="test" value="itbank" scope="page"></c:set>
<%-- pageContext.setAttribute("test", "itbank"); --%>

<h2>test: ${test }</h2>




</body>
</html>