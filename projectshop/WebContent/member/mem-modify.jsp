<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="mem-modi">
	<c:if test="${pageContext.request.method == 'GET'}">
		<form id="input" method="POST" onsubmit="modiForm()">
			<input type="hidden" name="idx" value="${login.idx }">
			<input type="hidden" name="id" value="${login.id }">
			<input type="hidden" name="beforepw" value="${login.pw }">
			<p><input type="password" name="pw" placeholder="Password"></p>
		     <p>${login.name }</p>
		     <p>
		        <input type="text" value="${login.postcode }" name="postcode" id="sample6_postcode" placeholder="우편번호">
		        <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
		     </p>
		     <p><input type="text" value="${login.post }" name="address" id="sample6_address" placeholder="주소"><br></p>
		     <p><input type="text" name="postDetail" id="sample6_detailAddress" placeholder="상세주소"></p>
		     <p><input type="text" name="postExtra" id="sample6_extraAddress" placeholder="참고항목"></p>
		     <p>
		         <select name="tel1" required>
		            <option ${login.tel1 == '010' ? 'selected' : '' }>010</option>
		            <option ${login.tel1 == '011' ? 'selected' : '' }>011</option>
		            <option ${login.tel1 == '016' ? 'selected' : '' }>016</option>
		            <option ${login.tel1 == '017' ? 'selected' : '' }>017</option>
		            <option ${login.tel1 == '018' ? 'selected' : '' }>018</option>
		            <option ${login.tel1 == '019' ? 'selected' : '' }>019</option>
		         </select>
		         <input id="tel" value="${login.tel2 }" type="text" name="tel2" required>
		         <input id="tel" value="${login.tel3 }" type="text" name="tel3" required>
		      </p>
		      <p><input type="submit" value="수정"></p>
		</form>
	</c:if>
	
	<c:if test="${pageContext.request.method == 'POST' }">
		<jsp:useBean id="modidata" class="member.MemberDTO" />
		<jsp:setProperty property="*" name="modidata"/>
		<c:set var="row" value="${memberDAO.modify(modidata,param.beforepw) }" />
		<c:if test="${row != 0 }">
			<% session.removeAttribute("login"); %>
			<c:set var="login" value="${memberDAO.login(modidata) }" scope="session" />
			<p>세션 삭제 후 로그인 세션에 저장 완료 : ${login.name },${login.id },${login.pw }</p>
			<c:redirect url="../index.jsp"/>
		</c:if>
	</c:if>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

// 	post생성
	const input = document.getElementById('input');
	const modiForm = function(event) {
		event.preventDefault();
		var address = document.getElementById( 'sample6_address' ).value;
		var postDetail = document.getElementById( 'sample6_detailAddress' ).value;
		var postExtra = document.getElementById( 'sample6_extraAddress' ).value;
		var post = address + postDetail + postExtra;
		
		const newPost = document.createElement('input');
		newPost.name='post';
		newPost.value=post;
		newPost.type="hidden";
		event.target.appendChild(newPost);
		event.target.submit();
	}
	if(input != null) {
		input.addEventListener('submit', modiForm);
	}

// 	우편번호 검색
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = '';
                var extraAddr = '';

                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }
                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

</body>
</html>