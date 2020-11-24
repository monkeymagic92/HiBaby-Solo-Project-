<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<style>
	.myPageContainer {
		
		margin-top: 30px;
		width: 500px;
	}
</style>
</head>
<body>
	<div class="myPageContainer">
		<button onclick="moveToInfo(${loginUser.i_user})">회원정보 변경</button>
		<button onclick="logOut()">로그아웃</button>
	</div>
</body>
<script>
	function moveToInfo(i_user) {
		location.href="/user/info?i_user="+i_user		
	}

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