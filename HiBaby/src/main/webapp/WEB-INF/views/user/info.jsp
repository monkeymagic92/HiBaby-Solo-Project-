<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link rel="stylesheet" type="text/css" href="/res/css/animate.css">
<style>
	.formContainer {
		margin: 0 auto;
		margin-top: 30px;
		width: 500px;
	}
</style>
</head>
<body>
	<div class="formContainer">
		<form id="frm" action="/user/info" method="post" onsubmit="return chk()">
			<h5>닉네임 변경</h5>
			<hr>
			<input type="text" name="nick" placeholder="닉네임 변경" value="${loginUser.nick}">
			<input id="nickUnChk" name="nickUnChk" type="hidden" value="unChk">
			<button type="button" id="nickChk" class="btn btn-3" onclick="chkNick()">닉네임 중복체크</button><i id="nickClick" class="animate__rubberBand animate__animated fas fa-check" ></i>
			<br>
			<h5>이메일 변경</h5>
			<hr>
			<input type="email" name="email" placeholder="이메일 변경" value="${loginUser.email}">
			<input id="emailUnChk" name="emailUnChk" type="hidden" value="unChk">
			<button type="button" id="emailChkBtn" class="btn btn-3" onclick="chkEmail()">이메일 중복체크</button>&nbsp;<i id="emailClick" class="animate__rubberBand animate__animated fas fa-check"></i>
			<br>
			<h5>상태메세지 변경</h5>
			<hr>
			<textarea name="sm" placeholder="상태메세지 변경">${loginUser.sm}</textarea>
			<input type="hidden" name="i_user" value="${loginUser.i_user}">
			<button type="submit">회원정보 수정</button>
		</form>		
	</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>

function chk() {
	// 닉네임, 이메일 둘중 한개가 키보드 변경이 있었을경우에는 중복체크를 해야 넘어가게끔 조정하기
}

$('#emailClick').hide(); // 이메일 중복체크 v표
$('#nickClick').hide(); // 닉네임 중복체크 v표

$('#nick_input').keydown(function() {
	$('#nickClick').hide();
	frm.nickUnChk.value = 'unChk'
})
$('#email_txt').keydown(function() {
	$('#emailClick').hide();
	frm.emailUnChk.value = 'unChk'
})

// 로그인을 하지않고 들어왔을 경우 에러메세지
if(${loginMsg != null}) {
	alert('${loginMsg}')
	location.href="/user/login"
}

// 회원정보 수정 성공 / 실패 여부에 따른 메세지
if(${infoMsg != null}) {
	alert('${infoMsg}')
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
			$('#submitBtn').removeAttr('disabled');
			
			
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



</script>
</html>