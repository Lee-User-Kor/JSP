<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ page import="member.Member" %>

<%!
	Member[] members= {
			new Member("dlwogh", "first", "이재호"),
			new Member("dlwodud", "last", "이재영"),
			new Member("dlrjsgml", "father", "이건희")
	};
	
	public void forward(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		RequestDispatcher rd = request.getRequestDispatcher("login-success.jsp");
		rd.forward(request, response);
	}
%>
<jsp:useBean id="login" class="member.Member"></jsp:useBean>
<jsp:setProperty property="*" name="login"/>
<%
	String msg = "로그인 실패";
	for(Member m : members) {
		if(m.equals(login)) {
			msg = "로그인 성공";
			request.setAttribute("name", m.getName());
			request.getRequestDispatcher("login-success.jsp").forward(request, response);
			break;
		}
	}
	if("로그인 실패".equals(msg)) {
		response.sendRedirect("login-failed.jsp");
	}
%>


</body>
</html>