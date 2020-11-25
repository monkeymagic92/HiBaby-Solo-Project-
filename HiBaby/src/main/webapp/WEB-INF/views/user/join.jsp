<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="/res/css/animate.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
	#idChkResult {
		color: red;
	}
		
	.animate__flash animate__animated fas fa-check {
		 transition: 0.9s;
	}
</style>
</head>
<body>
	<form id="frm" class="box" action="/user/join" method="post" onsubmit="return chk()">
		<h1>회원가입</h1>
		
		<input type="text" name="email" placeholder="이메일 입력" id="email_txt">
        <button type="button" id="emailChk" class="btn btn-3" onclick="chkEmail()">이메일 중복체크</button>
        <input id="emailUnChk" name="emailUnChk" type="hidden" value="unChk">
        <i id="emailClick" class="animate__rubberBand animate__animated fas fa-check"></i>
		
		<input type="text" name="user_id" id="id_input" placeholder="아이디">
        <button type="button" id="idChk" class="btn btn-3" onclick="chkId()">아이디 중복체크</button>
        <input type="hidden" id="idUnChk" name="idUnChk" value="unChk">
        <i id="idClick" class="animate__rubberBand animate__animated fas fa-check" ></i>
        
        <input type="text" name="nick" id="nick_input" placeholder="닉네임">
        <button type="button" id="nickChk"class="btn btn-3"  onclick="chkNick()">닉네임 중복체크</button>
        <i id="nickClick" class="animate__rubberBand animate__animated fas fa-check" ></i>
        <input id="nickUnChk" name="nickUnChk" type="hidden" value="unChk">
        
        <input type="password" name="user_pw" placeholder="비밀번호">
		<input type="password" name="user_rpw" placeholder="비밀번호 확인">
		
		<input type="submit" id="submitBtn" value="가입">
    </form>        
</body>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
<script>
window.onload = function() {
	frm.email.focus()
}

if (${joinErrMsg != null}) {
	alert('${joinErrMsg}');
}

$('#idClick').hide();
$('#emailClick').hide();
$('#nickClick').hide();


$('#emailChk').click(function() {
	frm.emailUnChk.value = 'chk'
})
$('#idChk').click(function() {
	frm.idUnChk.value = 'chk'
})
$('#nickChk').click(function() {
	frm.nickUnChk.value = 'chk'
})
$('#nick_input').keydown(function() {
	$('#nickClick').hide();
	frm.nickUnChk.value = 'unChk'
})
$('#email_txt').keydown(function() {
	$('#emailClick').hide();
	frm.emailUnChk.value = 'unChk'
})
$('#id_input').keydown(function() {
	$('#idClick').hide();
	frm.idUnChk.value = 'unChk'
})

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
	
	// 이메일 정규화 
	if (frm.email.value.length > 0) {
		const email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
		if(!email.test(frm.email.value)) {
			alert('올바른 이메일을 입력해 주세요');
			frm.email.focus();
			return false
		}
	}
	
		
	if (frm.nick.value.length > 2 
			&& frm.idUnChk.value != 'unChk' 
			&& frm.emailUnChk.value != 'unChk'
			&& frm.nickUnChk.value != 'unChk'
			) {
		
		alert('회원가입이 되었습니다');
		location.href='/user/login';	
	}
	
	if(frm.emailUnChk.value == 'unChk') {
		alert('이메일 중복확인을 클릭해주세요');
		return false;
	}
	
	if(frm.idUnChk.value == 'unChk') {
		alert('아이디 중복확인을 클릭해주세요')
		return false;
	}
	
	if(frm.nickUnChk.value == 'unChk') {
		alert('닉네임 중복확인을 클릭해주세요')
		return false;
	}	
}

//이메일 중복확인
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
			
			$('#emailClick').show();			
			frm.email.focus()			
			
		} else if(res.data == '2') { //이메일 중복됨
			alert('사용할수 없는 이메일 입니다')
			$('#emailClick').hide();
			frm.email.value = ''
			frm.email.focus()
	
			
		} else {
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
			frm.user_pw.focus();
			
		} else if(res.data == '3') { //아이디 중복됨	
			$('#idClick').hide();
	
			alert('사용할수 없는 아이디 입니다.');
			frm.user_id.value = '';
			frm.user_id.focus();
			
		} else if(res.data == '4') { // 아이디 입력안했을시
			alert('아이디를 입력해 주세요');
			frm.user_id.focus()
		}
	})
}
// 닉네임 중복확인
function chkNick() {
	const nick = frm.nick.value
	axios.post('/user/ajaxNickChk', {
		
			nick
			
	}).then(function(res) {
		console.log(res)
		if(res.data == '1') { // 닉네임 없음 (사용가능)
										
						
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
			
			$('#nickClick').show();	
			
			
		} else if(res.data == '2') { // 닉네임 중복됨	
			$('#nickClick').hide();
	
			alert('사용할수 없는 닉네임 입니다.');
			frm.nick.value = '';
			frm.nick.focus();
			
		} else {
			alert('닉네임을 다시 확인해 주세요');
			frm.nick.value = '';
			frm.nick.focus();
		}
	})
}

</script>
</html>