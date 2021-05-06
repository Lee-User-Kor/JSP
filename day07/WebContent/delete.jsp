<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- begin of header -->
<%@ include file="header.jsp" %>
<!-- end of header -->

<c:if test="${list.remove(list[param.index]) }">
<%--
	list.remove() 메서드는 int index를 받거나, Object를 받는다
	boolean remove(Object o)
	E remove(int index)
	int가 아닌 다른 형태로 전달받을 수 있으니, 객체를 직접 전달해서 삭제하도록 하자 
 --%>
	<c:redirect url="list.jsp"></c:redirect>
</c:if>

</body>
</html>