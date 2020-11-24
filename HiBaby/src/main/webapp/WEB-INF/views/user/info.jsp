<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
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
			<br>
			<h5>이메일 변경</h5>
			<hr>
			<input type="email" name="email" placeholder="이메일 변경" value="${loginUser.email}">
			<br>
			<h5>상태메세지 변경</h5>
			<hr>
			<textarea name="sm" placeholder="상태메세지 변경">${loginUser.sm}</textarea>
			<button type="submit">회원정보 수정</button>
		</form>		
	</div>
</body>
<script>

</script>
</html>