<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HiBaby</title>
<link rel="stylesheet" href="/res/css/defaultTemp.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
	<div class="main-container">
       <header class="main-header">
            <ul class="header-ul">
                <li><a class="li-a1" href="/index/select"><span id="li1">HiBaby</span></a></li>
                <li><a class="li-a2" href="#"><span id="li2" onclick="showUserList()">유저 목록</span></a></li>
                <li>
                    <a class="li-a3" href="#"><span id="li3">쪽지함</span></a> 
                    <!-- span으로 쪽지함 ! 나타나게 하기 -->
                    <!-- 애니메이션 효과넣어서 !가 나타날때 깜빡임 표시 넣기 -->
                </li>
                <li>
                    <div class="dropdown">
                        <button class="dropbtn">
                            <c:if test="${loginUser.profile_img != null}">
                        		<img class="drop-img" src="/res/img/HiBaby/profile_img/user/${loginUser.i_user }/${loginUser.profile_img}" class="profileImg">
                        	</c:if>
                        	<c:if test="${loginUser.profile_img == null}">
                        		<img class="drop-img" src="/res/img/HiBaby.jpg" class="profileImg">
                        	</c:if>
                        </button>
                        <div class="dropdown-content">
                          <a href="/user/myPage">마이페이지</a>
                          <div class="hrDiv">
                              <hr>
                          </div>
                          <a href="#" onclick="logOut()">로그아웃</a>
                        </div>
                    </div>
                </li>
            </ul>
       </header>
       
        <div class="includeContainer">
	    	<jsp:include page="/WEB-INF/views/${view}.jsp"></jsp:include>
 		</div>
 		
 		
 		<!-- 유저검색 모달 start -->
       <div id="searchBox" class="searchModal">
            <!-- Modal content -->
            
            <div class="searchModal-con">                
                <span id="searchExitBtn" class="material-icons" onclick="searchBoxHide()">clear</span>
                <div class="searchNickFrmDiv">
                    <form id="searchNickFrm">
                        <input id="searchNick" type="text" name="searchNick" placeholder="유저 검색">
                        <div class="searchBtnDiv">
                            <span id="userSearchBtn" class="material-icons" onclick="searchUserList()">
                                person_search
                            </span>
                        </div>
                    </form>
                    <button type="button" id="allUserBtn" onclick="allUserBtn()">전체 유저 보기</button>
                </div>
                
                <!-- Modal body -->
                <div class="searchModal-body">
                    <div class="userListTable">
                        <div id="userListBox">
                            <!-- 계급, 사진, 닉네임, 상태메세지( 20글자이상 ...으로 ) 스크롤 기능 넣기-->
                            <div class="userListDiv1"><img class="userListImg" src="/res/img/chall.png"></div>
                            <div class="userListDiv2"><img class="userListImg" src="/res/img/HiBaby.jpg"></div>
                            <div class="userListDiv3">Test321</div>
                            <div class="userListDiv4">저의 상태메세지 입니다 말은점으로...</div>
                        </div>
                        <div id="userListBox">
                            <!-- 계급, 사진, 닉네임, 상태메세지( 20글자이상 ...으로 ) 스크롤 기능 넣기-->
                            <div class="userListDiv1"><img class="userListImg" src="/res/img/chall.png"></div>
                            <div class="userListDiv2"><img class="userListImg" src="/res/img/HiBaby.jpg"></div>
                            <div class="userListDiv3">Test321</div>
                            <div class="userListDiv4">저의 상태메세지 입니다 말은점으로...</div>
                        </div>
                        <div id="userListBox">
                            <!-- 계급, 사진, 닉네임, 상태메세지( 20글자이상 ...으로 ) 스크롤 기능 넣기-->
                            <div class="userListDiv1"><img class="userListImg" src="/res/img/chall.png"></div>
                            <div class="userListDiv2"><img class="userListImg" src="/res/img/HiBaby.jpg"></div>
                            <div class="userListDiv3">Test321</div>
                            <div class="userListDiv4">저의 상태메세지 입니다 말은점으로...</div>
                        </div>
                        <div id="userListBox">
                            <!-- 계급, 사진, 닉네임, 상태메세지( 20글자이상 ...으로 ) 스크롤 기능 넣기-->
                            <div class="userListDiv1"><img class="userListImg" src="/res/img/chall.png"></div>
                            <div class="userListDiv2"><img class="userListImg" src="/res/img/HiBaby.jpg"></div>
                            <div class="userListDiv3">Test321</div>
                            <div class="userListDiv4">저의 상태메세지 입니다 말은점으로...</div>
                        </div>
                        <div id="userListBox">
                            <!-- 계급, 사진, 닉네임, 상태메세지( 20글자이상 ...으로 ) 스크롤 기능 넣기-->
                            <div class="userListDiv1"><img class="userListImg" src="/res/img/chall.png"></div>
                            <div class="userListDiv2"><img class="userListImg" src="/res/img/HiBaby.jpg"></div>
                            <div class="userListDiv3">Test321</div>
                            <div class="userListDiv4">저의 상태메세지 입니다 말은점으로...</div>
                        </div>
                        <div id="userListBox">
                            <!-- 계급, 사진, 닉네임, 상태메세지( 20글자이상 ...으로 ) 스크롤 기능 넣기-->
                            <div class="userListDiv1"><img class="userListImg" src="/res/img/chall.png"></div>
                            <div class="userListDiv2"><img class="userListImg" src="/res/img/HiBaby.jpg"></div>
                            <div class="userListDiv3">Test321</div>
                            <div class="userListDiv4">저의 상태메세지 입니다 말은점으로...</div>
                        </div>
                        <div id="userListBox">
                            <!-- 계급, 사진, 닉네임, 상태메세지( 20글자이상 ...으로 ) 스크롤 기능 넣기-->
                            <div class="userListDiv1"><img class="userListImg" src="/res/img/chall.png"></div>
                            <div class="userListDiv2"><img class="userListImg" src="/res/img/HiBaby.jpg"></div>
                            <div class="userListDiv3">Test321</div>
                            <div class="userListDiv4">저의 상태메세지 입니다 말은점으로...</div>
                        </div>
                        <div id="userListBox">
                            <!-- 계급, 사진, 닉네임, 상태메세지( 20글자이상 ...으로 ) 스크롤 기능 넣기-->
                            <div class="userListDiv1"><img class="userListImg" src="/res/img/chall.png"></div>
                            <div class="userListDiv2"><img class="userListImg" src="/res/img/HiBaby.jpg"></div>
                            <div class="userListDiv3">Test321</div>
                            <div class="userListDiv4">저의 상태메세지 입니다 말은점으로...</div>
                        </div>
                    </div>
                </div>
                
                <!-- Modal bottom -->

            </div>
        </div>
        <!-- 유저검색 모달 end -->
 		
        
    </div>
    
<script>
	//로그아웃
	function logOut() {
		if(confirm('로그아웃 하시겠습니까?')) {
			location.href="/user/logout"	
		}
	}
	
	
	/* ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	유저 검색 관련	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ */
	
	// 화면 켜졌을때 유저 검색창 닫기
	searchBox.style.display = 'none'
	
	// 유저 검색창 열기
	function showUserList() {
		searchBox.style.display = 'flex'
	}
	
	// 닫기 눌렀을시 유저 검색창 닫기
	function searchBoxHide() {
	    searchBox.style.display = 'none'
	}    
	
	
	
	// 유저 '검색 리스트' 뿌리기 ajax 로 검색기능
	function searchUserList() {
		var searchNick = searchNickFrm.searchNick.value 
		console.log('searchNick1 : ' + searchNick)
		
		axios.get('/user/searchUserList',{
			searchNick : searchNick
			
		}).then(function(res) {
			console.log('searchNick2 : ' + searchNick)
		})
	}
	
	
	
	// 유저  '전체 리스트' 뿌리기 ajax로 만들기
	function allUserBtn() {
		
	}
	
	

</script>
</body>
</html>