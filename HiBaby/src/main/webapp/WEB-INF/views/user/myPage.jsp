<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.testContainer {
		width:400px;
		margin: 0 auto;
	}
</style>
<body>
	<div class="testContainer">
		<div>마이페이지부분</div>
		<div>${myPageUser.user_id }</div>
		<div>${myPageUser.nm }</div>
		<div>${myPageUser.nick }</div>
	</div>
</body>
</html>