<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<style>

</style>
<body>
	<form id="frm" class="box" action="/user/join" method="post" onsubmit="return chk()">
		<h1>회원가입</h1>		
		<div id="idChkResult" class="msg"></div>
		<input type="text" name="user_id" placeholder="아이디">
		<button type="button" class="btn btn-3" onclick="chkId()">아이디 중복체크</button>
		<input type="password" name="user_pw" placeholder="비밀번호">
		<input type="password" name="user_rpw" placeholder="비밀번호 확인">
		<input type="text" name="nm" placeholder="이름">
		<input type="text" name="nick" placeholder="닉네임">
		<input type="text" name="email" placeholder="이메일">
		<input type="hidden" name="uNum" value="${uNumCode }">
		<input type="submit" value="가입">
    </form>        
</body>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
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
			alert('아이디 똑바로');
			frm.user_id.focus();
			return false;
		}
	}    
	
	// 비밀번호 정규식 : 숫자, 특문 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력
	if (frm.user_pw.value.length > 0 || frm.user_pw.value.length == 0) {
		const pass = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/
		
		if(!pass.test(frm.user_pw.value)) {
			alert("비밀번호는 숫자,특수문자,영문을 포함한 8자리 이상 입력해주세요");
			frm.user_pw.value = "";
			frm.user_pw.focus();
			return false;
		}
	}			
	
	if (frm.user_pw.value != frm.user_rpw.value) {
		alert("두 비밀번호를 확인해주세요");
		frm.user_rpw.value = "";
		frm.user_rpw.focus();
		return false;
	} 
	
	if (frm.nm.value.length == 0 || frm.nm.value.length < 1) {
		alert("올바른 이름을 입력해 주세요");
		frm.nm.focus();
		return false;
	}
	
	// 한글 정규화			
	if (frm.nm.value.length > 0) {
		const korean = /[^가-힣]/;
		
		if(korean.test(frm.nm.value)) {
			alert("올바른  이름을 입력해 주세요");
			frm.nm.focus();
			return false;
		}
	} 
	
	if (frm.nick.value.length == 0 || frm.nick.value.length < 2) {
		alert("닉네임은 2글자 이상입니다");
		frm.nick.focus();
		return false;
	} 
	
	if (frm.nick.value.length > 13) {
		alert("닉네임이 너무 깁니다");
		frm.nick.focus();
		return false;
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

// 아이디 중복체크 (ajax 통신)
function chkId() {
	const user_id = frm.user_id.value
	axios.post('/user/ajaxIdChk', {
		
			user_id  	
			
	}).then(function(res) {
		console.log(res)
		
		if(res.data == '2') { //아이디 사용'가능'
			if(frm.user_id.value.length == 0) {
				idChkResult.innerText = '아이디를 입력해주세요';
			}
		
			idChkResult.innerText ='사용가능한 아이디에요!';
			frm.user_pw.focus()
			
		} else if(res.data == '3') { //아이디 사용'불가능'
			idChkResult.innerText = '이미 사용중인 아이디에요!';
			frm.user_id.value = ''
			frm.user_id.focus()
		} 
	})
}
	
</script>
</html>