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
                <li><a class="li-a2" href="#"><span id="li2-1" onclick="showUserList()">친구 목록</span></a></li>
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
                    <button type="button" id="allUserBtn" onclick="searchUserList()">전체 유저 보기</button>
                </div>
                
                <!-- Modal body -->
                <div class="searchModal-body">
                    <div id="userListTableId" class="userListTable">
                    	<!-- 
                        <div id="userListBox">
                                                        계급, 사진, 닉네임, 상태메세지( 20글자이상 ...으로 ) 스크롤 기능 넣기
                            <div class="userListDiv1">
                            	<img class="userListImg" src="/res/img/chall.png">
                            </div>
                            <div class="userListDiv2">
                            	<img class="userListImg" src="/res/img/HiBaby.jpg">
                            </div>
                            <div class="userListDiv3">Test321</div>
                            <div class="userListDiv4">저의 상태메세지 입니다 말은점으로...</div>
                        </div>
                        -->
                    </div>
                </div>
                
                <!-- Modal bottom -->

            </div>
        </div>
        <!-- 유저검색 모달 end -->
 		
        
    </div>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
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
	
	
	
	// 유저 '검색 리스트' 뿌리기 ajax 로 검색기능 start
	function searchUserList() {
		var searchNick = searchNickFrm.searchNick.value
		
		axios.get('/user/searchUserList',{
			params: {
		          searchNick : searchNick,
		    }
			
		}).then(function(res) {
			searchNickFrm.searchNick.value = ''
			userListTableId.innerHTML = ''
			refreshUserList(res.data)
			
		})
	}
	
	 
	function refreshUserList(arr) {
		for (let i = 0; i<arr.length; i++) {
	         makeUserList(arr[i])
	    }
	}
	
	var lastText = '...' // 상태메세지 length 값 초과시 그뒤에 글은 ...
	
	function makeUserList(arr) {		
		
		var userListBox = document.createElement('div')
		userListBox.setAttribute('id', 'userListBox')
		
		userListBox.onclick = function() {
			// ★★ 클릭했을시 상대방 상세화면 띄우기
			alert('i_user 값 : ' + arr.i_user)
			
		}
		
		var userListDiv1 = document.createElement('div')
		userListDiv1.setAttribute('class', 'userListDiv1')
		
		var userListImg1 = document.createElement('img')
		userListImg1.setAttribute('class', 'userListImg')
		if(arr.totalPoint < 150) {			
			userListImg1.setAttribute('src',`/res/img/ion.png`)
			
		} else if(arr.totalPoint < 400) {
			userListImg1.setAttribute('src',`/res/img/gold.png`)
			
		} else if(arr.totalPoint < 600) {
			userListImg1.setAttribute('src',`/res/img/dia.png`)
			
		} else if(arr.totalPoint < 20000) {
			userListImg1.setAttribute('src',`/res/img/master.png`)
			
		} else if(arr.totalPoint > 20000) {
			userListImg1.setAttribute('src',`/res/img/chall.png`)
		}
		
		userListDiv1.append(userListImg1)
		userListBox.append(userListDiv1)
		
		var userListDiv2 = document.createElement('div')
		userListDiv2.setAttribute('class', 'userListDiv2')
		
		var userListImg2 = document.createElement('img')
		userListImg2.setAttribute('class', 'userListImg')
		if(arr.profile_img != null) {
			userListImg2.setAttribute('src',`/res/img/HiBaby/profile_img/user/\${arr.i_user}/\${arr.profile_img}`)
			
		} else {
			userListImg2.setAttribute('src','/res/img/HiBaby.jpg')
		}
		
		userListDiv2.append(userListImg2)
		userListBox.append(userListDiv2)
		
		var userListDiv3 = document.createElement('div')
		userListDiv3.setAttribute('class', 'userListDiv3')
		userListDiv3.append(arr.nick)
		
		userListTableId.append(userListBox)
		userListBox.append(userListDiv3)
		
		var userListDiv4 = document.createElement('div')
		userListDiv4.setAttribute('class', 'userListDiv4')
		
		if(arr.sm == null) {
			userListDiv4.innerText = ' 상태메세지가 없습니다.'
			
		} else if(arr.sm.length < 25) {
			userListDiv4.append(arr.sm)
			
		} else if (arr.sm.length > 25) {
			userListDiv4.append(arr.sm.substring(0,20) + lastText)
			
		} 
		
		userListBox.append(userListDiv4)
	}	
	// 유저 '검색 리스트' 뿌리기 ajax 로 검색기능 end
	
	
	
</script>
</body>
</html>