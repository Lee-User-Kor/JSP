<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<jsp:useBean id="term" class="member.Terms" />


<div class="join">

<c:if test="${pageContext.request.method == 'GET' }" >
	   <h2>회원 가입</h2>
	   <form id="input" method="POST" onsubmit="joinForm()">
	      <p><input type="text" name="id" placeholder="ID" required></p>
	      <p><input type="password" name="pw" placeholder="PW" required></p>
	      <p><input type="text" name="name" placeholder="NAME" required></p>
	      <p>
	         <input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호">
	         <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
	      </p>
	      <p><input type="text" name="address" id="sample6_address" placeholder="주소"><br></p>
	      <p><input type="text" name="postDetail" id="sample6_detailAddress" placeholder="상세주소"></p>
	      <p><input type="text" name="postExtra"id="sample6_extraAddress" placeholder="참고항목"></p>
	      <p>
	         <select name="tel1" required>
	            <option>010</option>
	            <option>011</option>
	            <option>016</option>
	            <option>017</option>
	            <option>018</option>
	            <option>019</option>
	         </select>
	         <input id="tel" type="text" name="tel2" required>
	         <input id="tel" type="text" name="tel3" required>
	      </p>
	      <p><textarea>${term.getTerms(pageContext.request)}</textarea></p>
	      <p>
	         <label><input type="checkbox" required>약관 동의</label>
	      </p>
	      <p><input type="submit" value="가입"></p>
		</form>
</c:if>	
		
<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="inputData" class="member.MemberDTO" />
	<jsp:setProperty property="*" name="inputData"/>
	<c:set var="row" value="${memberDAO.insert(inputData)}" />
	<script>
	const row = ${row};
	alert('가입' + (row == 1 ? '을 환영합니다 :-)' : ' 실패'));
	location.href = '${cpath}' + (row == 1 ? '' : '/member/join.jsp');
	</script>
</c:if>		
		
</div>



<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

// 	post생성
	const input = document.getElementById('input');
	const joinForm = function(event) {
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
		input.addEventListener('submit', joinForm);
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

<%@ include file="../footer.jsp" %>