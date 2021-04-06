<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!public String getToday() {
		String today = new SimpleDateFormat("yyyy년 MM월 dd일, hh시 mm분 ss초").format(new Date());
		return today;
	}%>
	<%
		String time = String.format("요청시간은 %s 입니다", getToday());

		String name = request.getParameter("name");
		String ageS = request.getParameter("age");
		String adult = "미성년자";
		int ageI = Integer.parseInt(ageS);
		if (ageI >= 20) {
			adult = "성인";
		}

		String data = "";
		if (name != null && ageS != null && !"".equals(name) && !"".equals(ageS)) {
			data = String.format("%s님의 나이는 %s살이며, [%s] 입니다.", name, ageS, adult);
		}

		String remoteAddr = request.getRemoteAddr();
	%>

	<h1>Quiz1-result</h1>
	<hr>
	<h3>
		<ul>
			<li><%=data%></li>
			<li><strong>요청자의 IP</strong> : <%=remoteAddr%></li>
			<li><%=time%></li>
		</ul>
	</h3>

</body>
</html>