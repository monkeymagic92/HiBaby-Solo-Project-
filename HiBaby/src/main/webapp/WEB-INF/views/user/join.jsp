<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form id="joinFrm" class="box" action="/user/join" method="post">
		<h1>회원가입</h1>
		<input type="text" name="user_id" placeholder="아이디">
		<input type="password" name="user_pw" placeholder="비밀번호">
		<input type="password" name="user_rpw" placeholder="비밀번호 확인">
		<input type="text" name="#" placeholder="#">
		<input type="text" name="#" placeholder="#">
		<input type="submit" value="회원가입">
    </form>        
</body>
</html>