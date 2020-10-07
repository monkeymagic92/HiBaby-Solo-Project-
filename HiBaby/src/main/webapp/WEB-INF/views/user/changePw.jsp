<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 </title>
</head>
<body>
	<form id="frm" class="box" action="/user/changePw" method="post" onsubmit="return chk()">
		<h1>비밀번호 변경</h1>		
		<input type="password" name="user_pw" placeholder="비밀번호 입력">
		<input type="password" name="user_rpw" placeholder="비밀번호 확인">
		<input type="submit" value="변경">
    </form>  
</body>
<script>

if(${changePwMsg != null}) {
	alert('${changePwMsg}');
	location.href="/user/login";
}

function chk() {
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
	
	if (frm.user_pw.value.length > 8) {
		alert('비밀번호가 변경되었습니다');
	}
}

</script>

</html>