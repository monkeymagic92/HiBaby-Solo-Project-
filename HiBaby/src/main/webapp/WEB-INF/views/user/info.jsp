<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<style>
	.formContainer {
		margin: 0 auto;
		margin-top: 30px;
		width: 500px;
	}
</style>
</head>
<body>
	<div class="formContainer">
		<form id="imgFrm" action="/user/imgUpload" method="post" enctype="multipart/form-data" onsubmit="return imgChk()">
            <input type="file" name="user_profile_img" id="file" accept="image/png, image/jpeg, image/jpg">
            <input class="cngImg" type="submit" value="사진변경">
        </form>
        
		<form>
			<input type="text" name="nick" placeholder="닉네임 변경">
			<br>
			<input type="text" name="email" placeholder="이메일 변경">
			<br>
			<textarea name="sm" placeholder="상태메세지 변경"></textarea>
		</form>		
	</div>
</body>
<script>
//프로필 이미지 체크
function imgChk() {
	if(imgFrm.user_profile_img.value.length == 0 ||
			imgFrm.user_profile_img.value == null ||
			imgFrm.user_profile_img.value == '') {
		alert('사진을 변경해주세요')
		return false;
	}
}
</script>
</html>