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
</head>
<body>
	<div class="main-container">
       <header class="main-header">
            <ul class="header-ul">
                <li><a class="li-a1" href="/index/select"><span id="li1">HiBaby</span></a></li>
                <li><a class="li-a2" href="#"><span id="li2" onclick="showUserList()">유저목록</span></a></li>
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
 		
 		
 		
 		<!-- 유저검색 모달창start( ajax로 만들기 ) -->
 		<div id="searchBox" class="modal">
            <!-- Modal content -->
            <div class="modal-content">
                <div>
                	<form id="searchNickFrm">
						<input id="searchNick" type="text" name="searchNick" placeholder="유저 검색">
						<button type="button" onclick="searchUserList()">구글 아이콘 돋보기 넣기</button>                	
                	</form>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body">
                    <div id="userListBox">
                    	<!-- 계급, 사진, 닉네임, 상태메세지( 20글자이상 ...으로 ) 스크롤 기능 넣기-->
                    </div>
                </div>
                
                <!-- Modal bottom -->
                <button id="exitBtn" type="button" class="pop_bt" onclick="engHide()">종료</button>
            </div>
        </div>
        <!-- 유저검색 End -->
        
        
    </div>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	//로그아웃
	function logOut() {
		if(confirm('로그아웃 하시겠습니까?')) {
			location.href="/user/logout"	
		}
	}
	
	searchBox.style.display = 'none'
	
	function showUserList() {
		searchBox.style.display = 'flex'
	}
	
	function searchUserList() {
		alert('아작스로 검색 만들기')
	}
	
	// 유저 리스트 뿌리기 ajax로 만들기

</script>
</body>
</html>