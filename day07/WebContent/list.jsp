<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- begin of header -->
<%@ include file="header.jsp" %>
<!-- end of header -->

<main>
	<table id="book-list">
		<thead>
			<tr>
				<th>도서명</th>
				<th>저자</th>
				<th>출판사</th>
				<th>날짜</th>
				<th>수량</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<%-- application 내장 객체에 저장되어 있는 list를 반복문으로 처리하여, 내부의 모든 Book 요소의 속성을 출력하기 --%>
			<c:forEach var="book" items="${applicationScope.list }" varStatus="st">
				<tr>
					<td>${book.name }</td>
					<td>${book.author }</td>
					<td>${book.publisher }</td>
					<td>${book.date }</td>
					<td>${book.count }</td>
					<td><a href="modify.jsp?name=${book.name }"><button class="pointer">수정</button></a></td>
					<td><button class="pointer deleteBtn"
								data-name="${book.name }"
								data-index="${st.index }">삭제</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</main>

<script type="text/javascript">
	const deleteBtns = document.querySelectorAll('.deleteBtn');
	// 문서 내의 클래스 이름이 deleteBtn인 모든 요소를 불러온다
	
	deleteBtns.forEach((btn) => {		// 불러온 버튼 각각에 대하여
		btn.onclick = (event) => {		// 버튼을 클릭하면 이벤트가 발생하게 하고
			const bookName = event.target.dataset.name;		// 이벤트가 발생하면 버튼에 설정된 책 이름과
			const bookIndex = event.target.dataset.index;	// 책이 위치하는 리스트상의 인덱스를 가져와서
			const answer = confirm('[' + bookName + ']' + ' 도서를 정말 삭제하시겠습니까?');	// 사용자에게 물어본다
			if(answer) {	// 만약 사용자가 [확인] 을 누르면 
				location.replace('delete.jsp?index=' + bookIndex);	// 지정한 페이지로 이동하면서 index값을 같이 전달한다
			}
		};
	});
</script>






<!-- begin of footer -->
<footer>
<%@ include file="footer.jsp" %>
</footer>
<!-- end of footer -->