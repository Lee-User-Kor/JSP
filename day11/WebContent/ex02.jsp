<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date, java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp</title>
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
        .write-form {
                width: 100%;
                display: flex;
                justify-content: center;
        }
        .write-form input[type="text"]{
                all: unset;
                border-bottom: 2px solid black;
                margin: 10px;
                padding: 10px;
        }
        .write-form textarea {
                all: unset;
                resize: none;
                width: 400px;
                height: 150px;
                padding: 10px;
                border: 2px solid #dadada;
        }
</style>
</head>
<body>
<%--
                ex01.jsp 의 내용을 똑같이 구현합니다
                
                단, 파일 입출력에 관련된 내용은 ListFileUtil.java 클래스를 만들어서 처리하고
                
                VO 클래스가 정렬이 가능하도록 처리하여 (정렬 관련된 인터페이스)
                
                test2.txt 파일의 내용을 기반으로 처리할 수 있도록 만들어보세요
 --%>
<%        request.setCharacterEncoding("UTF-8");        %>
<h1>ex02.jsp - 파일에서 객체 불러와서 화면에 출력하기 (2)</h1>
<hr>

<jsp:useBean id="fileUtil" class="day11.ListFileUtil" />
<c:set var="dataList" value="${fileUtil.dataList }" />

<c:if test="${pageContext.request.method == 'GET' }">
        <div class="write-form">
                <form method="POST">
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
                                <pre>${vo.content }</pre>
                        </div>
                </div>
        </c:forEach>
</c:if>

<c:if test="${pageContext.request.method == 'POST' }">
        <jsp:useBean id="user" class="day11.VO" />
        <jsp:setProperty property="*" name="user" />
        ${fileUtil.addData(user) }
        <c:redirect url="ex02.jsp" />
</c:if>
 
 
</body>
</html>