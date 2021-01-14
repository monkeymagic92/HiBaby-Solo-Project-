<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<div class="infoBox">
				<section class="pro_Img">
					<div class="imgBtn">
						<div class="pImgbox">
							<label for="file">
								<c:if test="${selUser.profile_img == null }">
									<img src="/res/img/HiBaby.jpg" onchange="setThumbnail(e)" alt="" class="profileImg">
								</c:if>
								
								<c:if test="${selUser.profile_img != null }">
									<img src="/res/img/HiBaby/profile_img/user/${selUser.i_user }/${selUser.profile_img}" class="profileImg">                    	
								</c:if>
							</label>
							<br><br>
							<div class="div-cngBtn">
								<div class="div-subBtn">
									<form id="imgFrm" action="/user/imgUpload" method="post" enctype="multipart/form-data" onsubmit="return imgChk()">
										<input type="file" name="user_profile_img" id="file" accept="image/png, image/jpeg, image/jpg">
										<input class="cngImg" type="submit" value="저장">
									</form>
								</div>
								<br><br>
								<div class="delBtn">
									<form id="imgDelFrm" action="/user/imgDel" method="post">
										<input class="cngImg2" type="submit" value="삭제">
									</form>
								</div>
							</div>
						</div>
					</div>
				</section>

				<div id="classesDiv">
					<c:choose>
				    	<c:when test="${selUser.totalPoint < 150}">
				    		<img class="classesImg" src="/res/img/ion.png" alt="img">
				    	</c:when>
				    	<c:when test="${selUser.totalPoint < 400}">
				    		<img class="classesImg" src="/res/img/gold.png" alt="img">
				    	</c:when>
				    	<c:when test="${selUser.totalPoint < 600}">
				    		<img class="classesImg" src="/res/img/dia.png" alt="img">
				    	</c:when>
				    	<c:when test="${selUser.totalPoint < 20000}">
				    		<img class="classesImg" src="/res/img/master.png" alt="img">
				    	</c:when>
				    	<c:when test="${selUser.totalPoint > 20000}">
				    		<img class="classesImg" src="/res/img/chall.png" alt="img">
				    	</c:when>
				   	</c:choose>
				</div>

				<div id="myTotalPoint">
					<span id="totalPointIcon" class="material-icons">
						local_parking
					</span>
					<span id="totalPointSpan">
						&nbsp;<fmt:formatNumber value="${selUser.totalPoint}" pattern="#,###" />p 
					</span>
				</div> 

				<div id="nowPoint">
					<span id="nowPointIcon" class="material-icons">
						card_membership
					</span>
					<span id="nowPointSpan">
						&nbsp;<fmt:formatNumber value="${selUser.myPoint}" pattern="#,###" />p
					</span>
				</div>

				<div id="nowCash">
					<span id="nowCashIcon" class="material-icons">
						atm
					</span>
					<span id="nowCashSpan">
						&nbsp;<fmt:formatNumber value="${selUser.myCash}" pattern="#,###" />p
					</span>
				</div>
				
				<button id="myPoint">포인트 환급받기</button>
				<div id="hrDiv"></div>

			
				<div id="nickDiv">
					<span id="nickIcon" class="material-icons">
						tag_faces
					</span>
					<span id="nickSpan">
						${selUser.nick}
					</span>
				</div>       
				<div id="rdtDiv">
					<span id="rdtIcon" class="material-icons">
						date_range
					</span>
					<span id="rdtSpan">
						${selUser.r_dt}
					</span>
				</div>
				<button id="infoChangeBtn" onclick="moveToInfo(${selUser.i_user})">회원정보 변경</button>
				<br>
				<button id="logoutBtn" onclick="logOut()">로그아웃</button>
				
			</div>
		
		

			<!-- PointModal Start -->
			<div id="myModal" class="pointModal">
					<!-- Modal content -->
				<div class="pointModal-content">
					<h4>나의포인트 : <fmt:formatNumber value="${selUser.myPoint}" pattern="#,###" />p</h4>
					
					<!-- Modal body -->
					<div class="pointModal-body">
						
						환급받을 포인트 입력 
						<form id="pointFrm" action="/user/myPoint" method="post" onsubmit="return pointChk()">
							<input id="pointIns" type="number" name="myCash" placeholder="포인트 입력" maxlength="8" oninput="numberMaxLength(this)">
							<input type="hidden" name="myPoint" value="${selUser.myPoint}">
							<input type="hidden" name="i_user" value="${selUser.i_user}">
							<button id="pointSubmitBtn" type="submit">환급받기</button>	
						</form> 
					</div>
					
					<!-- Modal bottom -->
					<div class="modal-bottom">
						
					</div>
					<button type="button" class="pop_bt" onclick="hideModal()">종료</button>
				</div>
			</div>
			<!-- PointModal End -->
		</div>
	
</body>
<script src="/res/js/myPage.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>

	
	//비로그인시 접근할경우
	if(${loginErr != null}) {
			alert('${loginErr}')
			location.href="/user/login"
	}
	
	
	// 회원정보변경
	function moveToInfo(i_user) {
		location.href="/user/info?i_user="+i_user		
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
	
	// 로그아웃
	function logOut() {
		if(confirm('로그아웃 하시겠습니까?')) {
			location.href="/user/logout"	
		}
	}
	
	
	/*		ㅡ		ㅡ		ㅡ		포인트관련		ㅡ		ㅡ		ㅡ*/ 
	
	// 모탈창 나타내기
	$('#myPoint').click(function() {
		$('#myModal').show();
	})
	
	// 모달창 종료
	function hideModal() {
		myModal.style.display = 'none'
	}
	
	//환급포인트 길이 제한
	function numberMaxLength(e){
	    if(e.value.length >= e.maxLength){
	        e.value = e.value.slice(0, e.maxLength);
	    }
	}
	
	// confirm창 띄워서 몇p를 환급할지 알림메세지
	function pointChk() {
		var myCashId = pointFrm.myCash.value
		if(pointFrm.myCash.value.length == 0) {
			alert('환급할 포인트를 입력해주세요')
			return false;
		}
		
		if(confirm(myCashId + 'p 를 환급 하시겠습니까?')) {
			location.href="/user/myPoint"
			
		} else {
			pointFrm.myCash.value = 0
			pointFrm.myCash.focus()
			return false;
		}
		
		
	}
	
	
	// 환급 성공 실패 여부 메세지
	if(${pointMsg != null}) {
		alert('${pointMsg}')		
	}


/*		ㅡ		ㅡ		ㅡ		ㅡ		ㅡ		ㅡ		ㅡ		*/


	
/*

				ㅡ 아작스버전 일단 보류 ㅡ

// 포인트 환급받기
function ajaxPoint() {
	const myPoint = `${loginUser.myPoint}`
	const i_user = `${loginUser.i_user}`
	//var myCash = $('#myCashId').val();   jquery 로 id value값 가져오기
	const myCash = document.getElementById("myCashId").value
	
	if(confirm(myCash + 'p 를 환급 하시겠습니까?')) {
		
		console.log(myPoint)
		console.log(i_user)
		console.log(myCash)
		
		axios.post('/user/ajaxMyPoint', {
			
				i_user,
				myPoint,
				myCash
				
		}).then(function(res) {
			if(res.data =='1') {
				alert('환급되었습니다')
				pointFrm.myCashName.value = 0
				
			} else if(res.data == '2') {
				alert('현재 보유한 포인트를 초과하였습니다')
				pointFrm.myCashName.value = 0
				
			} 
		})	
	}
}
*/
</script>
</html>