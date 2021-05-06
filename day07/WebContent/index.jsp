<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- begin of header -->
<%@ include file="header.jsp" %>
<!-- end of header -->

<c:set var="indexImg" value="http://221.164.9.222/img/iu.jpg"></c:set>

<ol>
	<li>프로그램에서 다루어야 할 데이터의 자료형을 클래스로 정의하자</li>
	<li>다수의 데이터를 처리하는데 적합한 자료구조(컬렉션)을 정해서 생성하자</li>
	<li>Create(생성), Read(읽기), Update(수정), Delete(삭제) 에 해당하는 기능을 작성하자</li>
	<li>기본 화면을 만들어두고, 각 메뉴를 실행할 수 있는 링크를 만들어두자</li>
	<li>링크를 클릭하면 실행되는 JSP 페이지를 하나씩 만들어가면서 프로젝트를 완성하자</li>
	<li>form을 이용하여 전달하는 사용자 입력값을 처리하는 방식을 연습하자</li>
	<li>내장 객체, EL, JSTL, Action Tag 사용법을 연습하자</li>
</ol>

<main>
	<img src="${indexImg }" width="500px">
</main>



<!-- begin of footer -->
<footer>
<%@ include file="footer.jsp" %>
</footer>
<!-- end of footer -->

</body>
</html>