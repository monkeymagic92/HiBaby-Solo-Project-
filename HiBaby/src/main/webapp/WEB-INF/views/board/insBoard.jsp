<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	
</style>
<body>
	<form id="frm" action="/board/insBoard" method="post" enctype="multipart/form-data" onsubmit="return chk()">
		파일등록 :
		<input type="file" name="images"  id="mfile" multiple accept="image/png, image/jpeg, image/jpg">
		<br><br>
		제목 :
		<input type="text" name="title">
		<br><br>
		내용 :
		<textarea name="ctnt" rows="100" cols="10">
			
		</textarea>
		<input type="hidden" name="i_user" value="${loginUser.i_user}">
		<input type="submit" value="글등록">
	</form>
</body>
</html>