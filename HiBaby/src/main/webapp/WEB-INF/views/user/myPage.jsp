<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link rel="stylesheet" href="/res/css/myPage.css">
<style>
	.myPageContainer {
		margin: 0 auto;
		margin-top: 30px;
		width: 500px;
	}
</style>
</head>
<body>
	<div class="myPageContainer">
        <section class="pro_Img">
            <div class="imgBtn">
                <div class="pImgbox">
                    <label for="file">
                    	<c:if test="${loginUser.profile_img == null }">
                    		<img src="/res/img/lion.jpg" onchange="setThumbnail(e)" alt="" class="img">
                    	</c:if>
                    	<c:if test="${loginUser.profile_img != null }">
                            <img src="/res/img/HiBaby/profile_img/user/${loginUser.i_user }/${loginUser.profile_img}" class="img">                    	
                    	</c:if>
                    </label>
                    <br>
                    <div class="div-cngBtn">
                        <form id="imgFrm" action="/user/imgUpload" method="post" enctype="multipart/form-data" onsubmit="return imgChk()">
                            <input type="file" name="user_profile_img" id="file" accept="image/png, image/jpeg, image/jpg">
                            <input class="cngImg" type="submit" value="사진변경">
                        </form>
                    </div>
                    <br>
                    <div class="delBtn">
                        <form id="imgDelFrm" action="/user/imgDel" method="post">
                            <input class="cngImg2" type="submit" value="사진삭제">
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <br>
        <button onclick="moveToInfo(${loginUser.i_user})">회원정보 변경</button>
		<button onclick="logOut()">로그아웃</button>
	</div>
	
</body>
<script src="/res/js/myPage.js"></script>
<script>
	// 회원정보변경
	function moveToInfo(i_user) {
		location.href="/user/info?i_user="+i_user		
	}

	// 로그아웃
	function logOut() {
		location.href="/user/logout"
	}
	
	// 비로그인시 접근할경우
	if(${loginErr != null}) {
		alert('${loginErr}')
		location.href="/user/login"
	}
	
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