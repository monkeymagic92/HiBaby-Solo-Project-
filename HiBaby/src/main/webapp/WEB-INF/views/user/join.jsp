<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<link rel="stylesheet" type="text/css" href="/res/css/animate/animate.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style>
	#idChkResult {
		color: red;
	}
	
	.animate__flash animate__animated fas fa-check {
		 transition: 0.9s;
	}
</style>
<!-- 
	회원가입기능 문제점
	
	1. 모든정보를 다 입력하고 인증절차를 거쳐야만 submit 버튼을 활성화시킴
	
	문제점 보안 할시
	1.	회원가입창에 들어가기전 모달창을 띄워 모든정보를 입력후 아디,이멜쳌을 해야 가입버튼이 활성화된다라는 팝업띄우기
	
	2.	애초에 귀찮지만 모든내용을 다 아작스 처리해서 바로바로 실시간으로 알려주기
	
	3.	다시 코드 수정하기
	    
 -->
<body>
	<form id="frm" class="box" action="/user/join" method="post" onsubmit="return chk()">
		<h1>회원가입</h1>		
		<div id="idChkResult" class="msg"></div>
		<input type="text" id="username_input" name="user_id" placeholder="아이디" required>
		
		<button type="button" id="idChkBtn" class="btn btn-3" onclick="chkId()">아이디 중복체크</button>&nbsp;<i id="idClick" class="animate__rubberBand animate__animated fas fa-check" ></i>
				
		<input type="password" name="user_pw" placeholder="비밀번호">
		<input type="password" name="user_rpw" placeholder="비밀번호 확인">
		<input type="text" name="nm" placeholder="이름">
		<input type="text" name="nick" placeholder="닉네임">
		<input type="text" id="email_input" name="email" placeholder="이메일" required>
		
		<button type="button" id="emailChkBtn" class="btn btn-3" onclick="chkEmail()">이메일 인증하기</button>&nbsp;<i id="emailClick" class="animate__rubberBand animate__animated fas fa-check"></i>
			
		<input type="hidden" name="uNum" value="${uNumCode }">
		<input type="hidden" name="idChkclick">
		<input type="hidden" name="emailChkclick">
		<div id="mouseoverTest">
		<input type="submit" id="submitBtn" disabled="disabled" value="가입">
		</div>
    </form>        
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
window.onload = function() {
	frm.user_id.focus()
}
if (${joinErrMsg != null}) {
	alert('${joinErrMsg}');
}

$('#idClick').hide();
$('#emailClick').hide();

// 아이디, 이메일인증 버튼을 클릭해야지만 submit이 되도록
$('#username_input').keyup(function() {
	$('#submitBtn').attr("disabled", "disabled")
})

$('#email_input').keyup(function() {
	$('#submitBtn').attr("disabled", "disabled")
})

/*
$('#mouseoverTest').mouseover(function() {
	alert('이메일 인증후 가입을 누르세요');
})
*/
function chk() {
	if(${chkEmailCode != null}) {
		alert('이메일을 인증해 주세요')
		frm.email.focus()
		return false;
	}
	
			
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
			alert('아이디는 영문자, 숫자만 가능합니다');
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
	
	if (frm.nm.value.length == 0 || frm.nm.value.length < 2) {
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
	
	if (frm.nm.value.length > 2) {
		alert('회원가입이 되었습니다');
		location.href='/user/login';	
	}
}

// 이메일 중복확인
function chkEmail() {
	const email = frm.email.value
	axios.post('/user/ajaxEmailChk', {
		
			email
			
	}).then(function(res) {
		console.log(res)
		if(res.data == '1') {
			
			if (frm.email.value.length < 14 ) {
				alert("올바른 이메일을 입력해주세요");
				frm.email.focus();
				return false;
			}
			
			if (frm.email.value.length > 0) {
				const email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
				if(!email.test(frm.email.value)) {
					alert('올바른 이메일을 입력해 주세요');
					frm.email.focus();
					return false
				}
			}
			
			alert('이메일로 인증코드가 발송되었습니다 메일함을 확인해 주세요');
			window.open('http://www.naver.com', '_blank');			
			
			$('#emailClick').show();
			$('#submitBtn').removeAttr('disabled')
			
			frm.email.focus()			
			
		} else if(res.data == '2') { //이메일 중복됨
			alert('이미 등록되어있는 이메일 입니다')
			$('#emailClick').hide();
			frm.email.value = ''
			frm.email.focus()
			$('#submitBtn').attr("disabled","disabled");
			
		} else if(res.data == '3'){
			alert('이메일을 입력해 주세요')
			frm.email.focus()
			
		} else if(res.date == '4') {
			alert('이메일을 다시 확인하여 주세요')
			frm.email.focus()
			return false;
		}
	})
}

// 아이디 중복확인
function chkId() {
	const user_id = frm.user_id.value
	axios.post('/user/ajaxIdChk', {
		
			user_id  	
			
	}).then(function(res) {
		console.log(res)
		if(res.data == '2') { //아이디 없음
			
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
			
			if(frm.user_id.value.length > 0) {
				const regExpId = /^[0-9a-z]+$/;
				if(!regExpId.test(frm.user_id.value)) {
					alert('아이디는 영문자, 숫자만 가능합니다');
					frm.user_id.focus();
					return false;
				}
			}
		
			$('#idClick').show();
			$('#submitBtn').removeAttr('disabled');			
			idChkResult.innerText = '사용할 수 있는 아이디입니다.';
			frm.user_pw.focus();
			
		} else if(res.data == '3') { //아이디 중복됨	
			$('#idClick').hide();
			$('#submitBtn').attr("disabled","disabled");
			idChkResult.innerText = '이미 사용중입니다.';
			frm.user_id.value = '';
			frm.user_id.focus();
			
		} else if(res.data == '4') { // 아이디 입력안했을시
			alert('아이디를 입력해 주세요');
			frm.user_id.focus()
		}
	})
}


</script>
</html>