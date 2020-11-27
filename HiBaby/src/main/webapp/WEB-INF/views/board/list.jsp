<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<style>
	
</style>
</head>
<body>

	<button onclick="moveToWrite(${loginUser.i_user})">글쓰기</button>
	<table>
		<tr>
			<td>게시No</td>
			<td>글제목</td>
			<td>글내용</td>
			<td>작성자</td>
			<td>작성시간</td>
		</tr>
		<c:forEach items="${list}" var="item">
		<tr>
			<td>${item.i_board }</td>
			<td>${item.title }</td>
			<td>${item.ctnt }</td>
			<td>${item.nick }</td>
			<td>${item.r_dt }</td>
		</tr>
		</c:forEach>
	</table>

<script>
	function moveToWrite(i_user) {
		location.href="/board/insBoard?i_user="+i_user
	}
</script>
</body>
</html>