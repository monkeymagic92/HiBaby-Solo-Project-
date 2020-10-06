<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
	<form id="frm" class="box" action="/user/findPw" method="post" onsubmit="return chk()">
		<h1>비밀번호 찾기</h1>		
		
		<input type="text" name="user_id" placeholder="아이디를 입력해 주세요">		
		<input type="text" name="nm" placeholder="이름을 입력해 주세요">
		<input type="text" name="email" placeholder="가입한 이메일을 입력해 주세요">
		<input type="submit" value="확인">
    </form>
</body>

<script>
	
</script>
</html>