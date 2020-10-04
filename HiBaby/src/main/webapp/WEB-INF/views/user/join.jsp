<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form id="frm" class="box" action="/user/join" method="post" onsubmit="return chk()">
		<h1>회원가입</h1>
		<input type="text" name="user_id" placeholder="아이디">
		<div><button type="button" onclick="chkId()">중복확인(ajax) / 버튼 css 입히기</button></div>
		<input type="password" name="user_pw" placeholder="비밀번호">
		<input type="password" name="user_rpw" placeholder="비밀번호 확인">
		<input type="text" name="nm" placeholder="이름">
		<input type="text" name="nick" placeholder="닉네임">
		<input type="hidden" name="uNum" value="${uNumCode }">
		<input type="submit" value="회원가입">
    </form>        
</body>
<script>
window.onload = function() {
	frm.user_id.focus()
}

function chk() {
	// *******    ID 정규화있으면 ID 정규화 적용시키기         ************
	
	if (frm.user_id.value.length < 5) {
		alert("ID는 5글자 이상 입력해주세요");		
		frm.user_id.focus();
		return false;
	} 
	
	if (frm.user_id.value.length > 19) {
		alert("ID가 너무 깁니다");
		frm.user_id.focus();
		return false;
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
			alert("올바른 이름을 입력해 주세요");
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
}
	
</script>
</html>