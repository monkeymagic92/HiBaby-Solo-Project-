<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 변경</title>
<link rel="stylesheet" type="text/css" href="/res/css/animate.css">
<link rel="stylesheet" href="/res/css/info.css">
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
        <form id="pwFrm" action="/user/infoChangePw" method="post">
            <h2>비밀번호 변경</h2>
            <hr>
            <input id="pwChange" type="password" name="user_pw" placeholder="현재 비밀번호 입력">
            <input type="hidden" name="i_user" value="${loginUser.i_user}">
            <input id="pwBtn" type="submit" value="비밀번호 변경">
        </form>
        <form id="frm" action="/user/info" method="post" onsubmit="return chk()">
            <h2 id="gubun">닉네임 변경</h2>
            <hr>
            <input type="text" name="nick" id="nick_input" placeholder="닉네임" value="${loginUser.nick}">
            <button type="button" id="nickChk"class="btn btn-3"  onclick="chkNick()">중복체크</button>
            <i id="nickClick" class="animate__rubberBand animate__animated fas fa-check" ></i>
            <input id="nickUnChk" name="nickUnChk" type="hidden" value="chk">
            <br><br>
            
            <h2>이메일 변경</h2>
            <hr>
            <input type="text" name="email" placeholder="이메일 입력" id="email_txt" value="${loginUser.email}">
            <button type="button" id="emailChk" class="btn btn-3" onclick="chkEmail()">중복체크</button>
            <input id="emailUnChk" name="emailUnChk" type="hidden" value="chk">
            <i id="emailClick" class="animate__rubberBand animate__animated fas fa-check"></i>
            <br><br>
            
            <h2>상태메세지 변경</h2>
            <hr>
            <textarea id="text_txt" name="sm" placeholder="상태메세지 변경">${loginUser.sm}</textarea>
            <input type="hidden" name="i_user" value="${loginUser.i_user}">
            <br>
            <input id="infoBtn" type="submit" value="회원정보 수정">
        </form>
        <br><br> 
    </div>
	
	<div id="pwModal" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <h4>비밀번호 변경</h4>
            
            <!-- Modal body -->
            <div class="modal-body">
                <form id="changePwFrm" action="/user/pwChange" method="post" onsubmit="return pwChk()">
                    <input id="pw" type="password" name="user_pw" placeholder="비밀번호 입력"><br>
                    <input id="rpw" type="password" name="user_rpw" placeholder="비밀번호 재입력"><br>
                    <input type="hidden" name="i_user" value="${loginUser.i_user}">
                    <button id="submitBtn" type="submit">비밀번호 변경</button>
                </form>
            </div>
            
            <!-- Modal bottom -->
            <button id="exitBtn" type="button" class="pop_bt" onclick="hideModal()">종료</button>
        </div>
    </div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>

if(${pwErrMsg != null}) {
	alert('${pwErrMsg}')
	location.href="/user/info"
}

if(${pwChangeMsg != null}) {
	alert('${pwChangeMsg}')
}

// 첫번째 form태그 유효검사
function chk() {
		
	if (frm.nick.value.length > 2 
			&& frm.emailUnChk.value != 'chk'
			) {
		
		alert('이메일 중복확인을 해주세요');
		return false;	
	}
	
	if (frm.nick.value.length > 2 
			&& frm.nickUnChk.value != 'chk'
			) {
		
		alert('닉네임 중복확인을 해주세요');
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
	
}

$('#emailClick').hide(); // 이메일 중복체크 v표
$('#nickClick').hide(); // 닉네임 중복체크 v표

$('#nick_input').keydown(function() {	// 닉네임항목에 키보드를 누르면 중복체크해야지만 submit 되게끔
	$('#nickClick').hide();
	frm.nickUnChk.value = 'unChk'
})
$('#email_txt').keydown(function() {	// ""       ""
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
			frm.nickUnChk.value = 'chk'						
						
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
			frm.emailUnChk.value = 'chk'
			
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

/* ㅡ	ㅡ	ㅡ	비밀번호 변경	ㅡ	ㅡ	ㅡ  */

if(${pwCode != null}) {
	$('#pwModal').show();
}

//모달창 종료
function hideModal() {
	pwModal.style.display = 'none'
}

function pwChk() {
	//비밀번호 정규식 : 숫자, 특문 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력
	if (changePwFrm.user_pw.value.length > 0 || changePwFrm.user_pw.value.length == 0) {
		const pass = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/
		
		if(!pass.test(changePwFrm.user_pw.value)) {
			alert("비밀번호는 숫자,특수문자,영문을 포함한 8자리 이상 입력해주세요");
			changePwFrm.user_pw.value = "";
			changePwFrm.user_pw.focus();
			return false;
		}
	}			

	if (changePwFrm.user_pw.value != changePwFrm.user_rpw.value) {
		alert("두 비밀번호를 확인해주세요");
		changePwFrm.user_rpw.value = "";
		changePwFrm.user_rpw.focus();
		return false;
	}	
}
 


/*	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	*/

</script>
</html>