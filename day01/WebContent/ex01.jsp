<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	// declaration, 선언부. 변수나 함수를 선언 및 정의할 수 있다
	// 클래스의 멤버 필드나 멤버 메서드를 작성하는 공간이므로, 정의만 할 수 있고 호출할 수 없다
	// 단순 대입(X), 초기화는 가능
	int num1;
	int num2 = 10;
	private String name = "이지은";	// 접근제한자가 적용 가능하다는 말은 지역변수가 아니라 멤버필드라는 말이다
	
	public int add(int n1, int n2) {	// 메서드 정의 가능
		return n1 + n2;
	}
	
//	num1 = 15;	// 단순 대입 불가
//	add(10,20);	// 메서드 호출 불가
%>

<%
	// 스크립틀릿, 메인함수에 대응되는 코드를 작성한다.
	// 여기서 작성하는 변수는 지역변수의 특성을 가진다
	int num1 = add(15, 25);
	int num2 = add(3, 20);
	
	System.out.println("num1 : " + num1);	// 웹 파일에 출력하지 않고, 서버 콘솔창에 출력한다
	out.println("num2 : " + num2);			// 자바 코드의 값을 HTML형식 파일에 출력한다
	
	if (num1 % 2 == 0) {
		out.println("<br>num1은 짝수이다 !!\n\n\n\n\n\n\n\n\n\n");		
		// println이라고 해서 다음줄에 출력되지 않는다
		// HTML에서 줄바꿈은 \n이 아니라, <br>이 처리하기 때문
		// 출력결과는 줄바꿈이 적용되지 않지만, 브라우저의 소소코드에서는 줄바꿈이 적용된다
	}
	
	String title = "jsp 기본 문법~!!";
%>
1 + 2 = <%=add(1, 2) %>
<!-- <h1>jsp 기본 문법</h1> -->
<h1><%=title %></h1>
<hr>

<!-- HTML 주석, 브라우저 소스보기로 확인 가능 -->
<%-- JSP 주석, 브라우저 소스보기로 확인불가, JSP 문법 요소를 주석처리하려면 이걸 사용해야 한다 --%>

<table border="1" cellpadding="10" cellspacing="0">
	<tr>
		<th>문법</th>
		<th>설명</th>
	</tr>
	<tr>
		<td><strong>&lt;%@ %></strong></td>
		<td>directive, 지시자, 페이지 전반에 걸친 설정을 작성한다. import도 포함한다</td>
	</tr>
	<tr>
		<td><strong>&lt;%! %></strong></td>
		<td>declaration, 선언부, 멤버 필드를 선언하거나 멤버 메서드를 작성한다</td>
	</tr>
	<tr>
		<td><strong>&lt;% %></strong></td>
		<td>scriptlet, 스크립틀릿, 메인에 대응되는 자바 코드를 작성하는 영역이다</td>
	</tr>
	<tr>
		<td><strong>&lt;%= %></strong></td>
		<td>expression, 표현식, 값을 HTML에 출력한다. out.print()와 동일한 역할이다</td>
	</tr>
</table>

</body>
</html>