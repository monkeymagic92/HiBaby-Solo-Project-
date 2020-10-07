<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
	<form id="frm" class="box" action="/user/findPw" method="post" onsubmit="return chk()">
		<h1>비밀번호 찾기</h1>		
		<input type="text" name="user_id" value="${user_id }" placeholder="아이디를 입력해 주세요">
		<input type="text" name="email" value="${email }" placeholder="가입한 이메일을 입력해 주세요">
		<input type="hidden" name="originalEmail" value="${originalEmail }"> <!-- get에서 아예 값을 찍어서 보내주기 -->
		<input type="hidden" name="cerCode" value="${cerCode }">
		<input type="submit" value="확인">
    </form>  
</body>
<script>
window.onload = function() {
	frm.user_id.focus()
}

function chk() {
	if (frm.user_id.value.length < 6) {
		alert("ID는 5글자 이상 입력해주세요");		
		frm.user_id.focus();
		return false;
	} 
	
	if (frm.user_id.value.length > 19) {
		alert("ID가 너무 깁니다");
		frm.user_id.focus();
		return false;
	}
	
	// 아이디 정규화 (영어, 숫자만 가능)
	if(frm.user_id.value.length > 0) {
		const regExpId = /^[0-9a-z]+$/;
		if(!regExpId.test(frm.user_id.value)) {
			alert('ID는 영어, 숫자만 가능합니다');
			frm.user_id.focus();
			return false;
		}
	}    
	
	if (frm.email.value.length == 0) {
		alert("올바른 이메일을 입력해주세요");
		frm.email.focus();
		return false;
	} 
	
	if (frm.email.value.length < 14 ) {
		alert("올바른 이메일을 입력해주세요");
		frm.email.focus();
		return false;
	}
	
	// 이메일 정규화 (추후 select 로 업데이트 하기)(daum, naver, google 등등)
	if (frm.email.value.length > 0) {
		const email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
		if(!email.test(frm.email.value)) {
			alert('올바른 이메일을 입력해 주세요');
			frm.email.focus();
			return false
		}
	}
	
}

</script>
</html>