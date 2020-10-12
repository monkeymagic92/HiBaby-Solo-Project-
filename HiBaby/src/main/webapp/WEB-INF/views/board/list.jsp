<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
</head>
<body>
	<c:choose>
		<c:when test="${loginUser != null }">
			<div>유저이름 : ${loginUser.nm }</div>
			<div>유저 나이 : ${loginUser.user_id }</div>
		</c:when>
		<c:when test="${loginUser == null }">
			<div>로그인</div>
		</c:when>
	</c:choose>		
	<hr>
	<table>
		<tr>
			<td>게시No</td>
			<td>글제목</td>
			<td>글내용</td>
			<td>작성자</td>
			<td>작성시간</td>
		</tr>
		<c:forEach items="${list }" var="item">
		<tr>
			<td>${item.i_board }</td>
			<td>${item.title }</td>
			<td>${item.ctnt }</td>
			<td>${item.nm }</td>
			<td>${item.r_dt }</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>