<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
</head>
<body>
	<div>${selUser.user_id}</div>
	<div>${selUser.r_dt}</div>
	<div>${selUser.nick}</div>
	<button onclick="logOut()">로그아웃 (테스트용)</button>
</body>
<script>
	// 로그아웃
	function logOut() {
		location.href="/user/logout"
	}
	
	if(${loginErr != null}) {
		alert('${loginErr}')
		location.href="/user/login"
	}
</script>
</html>