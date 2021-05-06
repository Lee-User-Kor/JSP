<%@page import="java.io.ObjectInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.ObjectOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="day11.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<style>
        .vo {
                border: 3px solid black;
                border-radius: 25px;
                padding: 10px;
                margin: 10px 0;
        }
        .top {
                display: flex;
                justify-content: space-between;
        }
        .writer, .date {
                font-size: 16pt;
                font-weight: bold;
        }
        .content {
                border: 2px solid #dadada;
                padding: 5px;
                margin: 10px;
        }
</style>
<body>

<%--
	GET에서는 목록을 출력하는 페이지, 목록은 파일에서 객체의 리스트를 불러와서 출력한다
	상단에 고정으로 데이터를 추가할 수 있는 form을 만들어둔다.
	
	POST에서는 추가된 데이터를 리스트에 저장하고, 리스트를 파일에 반영하고 현재 페이지의 GET으로 리다이렉트한다
	
	[짧은 글 작성하는 페이지] 작성자(type="text"), 날짜(자동생성), 내용(textarea)
 --%>

<%
	ArrayList<VO> dataList = null;
	String path = "D:\\오후취업반 이재호\\3.UI구현(JSP)\\workspace-jsp\\day11";
	
	File f = new File(path, "test.txt");		// java.io.File
	FileInputStream fis = new FileInputStream(f);
	ObjectInputStream ois = new ObjectInputStream(fis);
	
	
	if(pageContext.getAttribute("dataList") == null) {
// 		dataList = new ArrayList<VO>(Arrays.asList(new VO[] {
// 				new VO("작성자1", "2000-01-01", "테스트중입니다1"),
// 				new VO("작성자2", "2000-02-01", "테스트중입니다2"),
// 				new VO("작성자3", "2000-03-01", "테스트중입니다3")
// 		}));
		Object ob = ois.readObject();	// 파일의 내용을 객체로 불러오기
		dataList = (ArrayList<VO>) ob;
		
		pageContext.setAttribute("dataList", dataList);
	}
%>

<h1>ex01.jsp - 파일에서 객체 불러와서 화면에 출력하기</h1>
<hr>
<c:if test="${pageContext.request.method == 'GET' }">
	<div>
		<form method="post">
			<div><input type="text" name="writer" placeholder="작성자"></div>
			<div><textarea name="content" placeholder="내용을 입력하세요"></textarea></div>
			<div><input type="submit" value="작성"></div>
		</form>
	</div>
	<c:forEach var="vo" items="${dataList }">
		<div class="vo">
			<div class="top">
				<div class="writer">${vo.writer }</div>
				<div class="date">${vo.date }</div>
			</div>
			<div class="content">
				${vo.content }
			</div>
		</div>
	</c:forEach>
</c:if>
<c:if test="${pageContext.request.method == 'POST' }">
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="day11.VO" />
<jsp:setProperty property="*" name="user"/>
<%
	String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());	// 날짜 생성
	user.setDate(date);	// 날짜 추가
	dataList = (ArrayList<VO>)pageContext.getAttribute("dataList");
	dataList.add(user);	// 리스트에 추가
// 	session.setAttribute("dataList", dataList);	// 리스트를 내장 객체에 반영(JSTL로 출력할거니깐)

	// 파일 생성 테스트
// 	String path = "D:\\오후취업반 이재호\\3.UI구현(JSP)\\workspace-jsp\\day11";
	
// 	File f = new File(path, "test.txt");		// java.io.File
	FileOutputStream fos = new FileOutputStream(f);
	ObjectOutputStream oos = new ObjectOutputStream(fos);
	
	if(f.exists() == false) {
		f.createNewFile();
		System.out.println("파일 생성 코드");
	}
	oos.writeObject(dataList);
	oos.flush();
	oos.close();
	
	response.sendRedirect("ex01.jsp");	// 출력하는 페이지(현재 페이지의 GET)로 이동
	
%>
</c:if>













</body>
</html>