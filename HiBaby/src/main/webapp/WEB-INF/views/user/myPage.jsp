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
	
</style>
</head>
<body>
	<!-- 
	
		https://codepen.io/jlalovi/pen/bIyAr     마이페이지 커스텀마이징 할 codepen
	 -->
	<div class="myPageContainer">
        <section class="pro_Img">
            <div class="imgBtn">
                <div class="pImgbox">
                    <label for="file">
                    	<c:if test="${loginUser.profile_img == null }">
                    		<img src="/res/img/lion.jpg" onchange="setThumbnail(e)" alt="" class="img">
                    	</c:if>
                    	<c:if test="${loginUser.profile_img != null }">
                 f           <img src="/res/img/HiBaby/profile_img/user/${loginUser.i_user }/${loginUser.profile_img}" class="img">                    	
                    	</c:if>
                    </label>
                    <br><br>
                    <div class="div-cngBtn">
                        <div class="div-subBtn">
                            <form id="imgFrm" action="/user/imgUpload" method="post" enctype="multipart/form-data" onsubmit="return imgChk()">
                                <input type="ile" name="user_profile_img" id="file" accept="image/png, image/jpeg, image/jpg">
                                <input class="cngImg" type="submit" value="사진 저장">
                            </form>
                        </div>
                        <br><br>
                        <div class="delBtn">
                            <form id="imgDelFrm" action="/user/imgDel" method="post">
                                <input class="cngImg2" type="submit" value="사진 삭제">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <br><br>
        <div>닉네임 : ${loginUser.nick}</div>        
        <div>포인트 : ${loginUser.myPoint}</div><button onclick="#">캐시백</button>
        <div>환급받은 캐시 : ${loginUser.myCash}</div>        
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
		if(confirm('로그아웃 하시겠습니까?')) {
			location.href="/user/logout"	
		}
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