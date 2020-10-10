<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
</head>
<body>
	<div>pk : ${loingUser.i_user }</div>
	<div>아디 : ${loginUser.user_id }</div>
	<div>비번 : ${loginUser.user_pw }</div>
	<div>이름 : ${loginUser.nm }</div>
	<div>닉넴 : ${loginUser.nick }</div>
	<div>이멜 : ${loginUser.email }</div>
	<div>포인트 : ${loginUser.myPoint }</div>
	<div>r_dt : ${loginUser.r_dt }</div>
</body>
</html>