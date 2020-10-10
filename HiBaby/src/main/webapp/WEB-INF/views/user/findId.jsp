<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
</head>
<body>
	<form id="frm" class="box" action="/user/findId" method="post" onsubmit="return chk()">
		<h1>아이디 찾기</h1>		
		<input type="text" name="email" placeholder="이메일을 입력해 주세요">
		<input id="submitBtn" type="submit" value="전송">
    </form>
</body>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

$('#submitBtn').click(function() {
	if(confirm('입력하신 이메일로 아이디가 발송되었습니다\n새창을 여시겠습니까 ?')) {
		window.open('http://www.naver.com', '_blank');
	} else {
		
		location.href="/user/login";
	}
})

if(${findIdMsg != null}) {
	alert("${findIdMsg}");
	
} else if (${findIdSuccessMsg != null}) {
	alert("${findIdSuccessMsg}")
	location.href="/user/login";
}


function chk() {
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

	if (frm.email.value.length > 0) {
		const email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
		if(!email.test(frm.email.value)) {
			alert('올바른 이메일을 입력해 주세요');
			frm.email.focus();
			return false;
		}
	}	
}


</script>
</html>