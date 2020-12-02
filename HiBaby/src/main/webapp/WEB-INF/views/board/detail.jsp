<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세페이지</title>
</head>
<style>
	.detailContainer {
		width: 850px;
		margin: 0 auto;
	}
</style>
<body>
	<div class="detailContainer">
		<c:if test="${data.i_board != null}">
			<c:if test="${data.image_1 != '' }">
				<img src="/res/img/board/${data.i_board }/${data.image_1}" class="selProductFile">
			</c:if>
			<c:if test="${data.image_2 != '' }">
				<img src="/res/img/board/${data.i_board }/${data.image_2}" class="selProductFile">
			</c:if>					
			<c:if test="${data.image_3 != '' }">
				<img src="/res/img/board/${data.i_board }/${data.image_3}" class="selProductFile">
			</c:if>
			<c:if test="${data.image_4 != '' }">
				<img src="/res/img/board/${data.i_board }/${data.image_4}" class="selProductFile">
			</c:if>
		</c:if>
		
		<div>${data.i_user}</div>
		<div>${data.nick }</div>
		<div>${data.title }</div>
		<div>${data.ctnt }</div>
		
		<c:if test="${loginUser.profile_img == null }">
     		<img src="/res/img/HiBaby.jpg" onchange="setThumbnail(e)" alt="" class="img">
     	</c:if>
     	<c:if test="${loginUser.profile_img != null }">
             <img src="/res/img/HiBaby/profile_img/user/${loginUser.i_user }/${loginUser.profile_img}" class="img">                    	
     	</c:if>
	</div>
	
<script>
	
</script>
</body>
</html>