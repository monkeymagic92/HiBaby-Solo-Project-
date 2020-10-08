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
		<input type="submit" value="전송">
    </form>
</body>

<script>

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