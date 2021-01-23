<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HiBaby</title>
<link rel="stylesheet" href="/res/css/defaultTemp.css">
<link rel="stylesheet" href="/res/css/animate.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
</head>
<body>
	<div class="main-container">
		<header class="main-header">
			<ul id="headerBox" class="header-ul">
				<li><a class="li-a1" href="/index/select"><span id="li1">HiBaby</span></a></li>
				<li>
					<a class="li-a2" href="#">
						<span id="li2-1" onclick="showFrList(${loginUser.i_user})">친구 목록</span>
					</a>
				</li>
                <!--  <span id="showAlertMs" class="animate__flash animate__animated material-icons">chat</span>-->
				<li><a class="li-a2" href="#"><span id="li2"
						onclick="showUserList()">유저 목록</span></a></li>
				<li><a class="li-a3" href="#"><span id="li3">쪽지함</span></a> <!-- span으로 쪽지함 ! 나타나게 하기 -->
					<!-- 애니메이션 효과넣어서 !가 나타날때 깜빡임 표시 넣기 --></li>
				<li>
					<div class="dropdown">
						<button class="dropbtn">
							<c:if test="${loginUser.profile_img != null}">
								<img class="drop-img"
									src="/res/img/HiBaby/profile_img/user/${loginUser.i_user }/${loginUser.profile_img}"
									class="profileImg">
							</c:if>
							<c:if test="${loginUser.profile_img == null}">
								<img class="drop-img" src="/res/img/HiBaby.jpg"
									class="profileImg">
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
				<span id="searchExitBtn" class="material-icons"
					onclick="searchBoxHide()">clear</span>
				<div class="searchNickFrmDiv">
					<form id="searchNickFrm">
						<input id="searchNick" type="text" name="searchNick"
							placeholder="유저 검색">
						<div class="searchBtnDiv">
							<span id="userSearchBtn" class="material-icons"
								onclick="searchUserList()"> person_search </span>
						</div>
					</form>
					<button type="button" id="allUserBtn" onclick="searchUserList()">전체
						유저 보기</button>
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




		<!-- 유저검색 상세모달 start -->
		<div id="detailUser" class="detailModal">

			<!-- Modal content -->
			<div class="detailModal-content">
				<span id="detailExitBtn" class="material-icons"
					onclick="detailModalHide()">clear</span>


				<!-- detailUserBox 안에 append 하기 -->
				<div id="detailUserBox">

					<!--  <img class="detailImg1" src="/res/img/chall.png"> -->
					<div id="detailUserInfo" class="detailUserInfo">
						<!-- 
                        <img class="detailImg2" src="/res/img/HiBaby.jpg">
                        <span class="detailNick">
                            testJy
                        </span>
                        -->
					</div>
					<!-- 
                    <span class="detailPoint">
                        12,500p
                    </span>
                     -->
					<div id="detailSm" class="detailSm">
						<!-- 
                        <p class="detailP">
                        동해물과 백두산이 마르고 닳도록동해물과 백두산이 마르고 닳도록동해물과 백두산이 마르고 닳도록동해물과 백두산이 마르고 닳도록동해물과 백두산이 마르고 닳도록
                        </p>
                         -->
					</div>
					<!-- 
                    <div id="detailBtnMall">
		                <button id="frPlusBtn">친구 추가</button>
		                <button id="messageBtn">쪽지</button>
                	</div>
                	 -->
				</div>
				<!-- Modal bottom -->
			</div>
		</div>
		<!-- 유저검색 상세모달 end -->

		<!-- 친구 목록 모달 start-->
		<div id="frList" class="frListmodal">
			<!-- Modal content -->

			<div class="frListmodal-content">
				<span id="frexitBtn" class="material-icons" onclick="frListHide()">clear</span>
				<!-- Modal body -->
				<span id="frTitle">친구 목록</span>
				<div class="frListmodal-body">
					<!-- forEach 돌리기 (클릭할시 친구삭제, 쪽지보내기 모달창 띄우기)-->

					<div id="frListBoxMall">
						<!-- 
	                    <div class="frListTable" onclick="choiceMenu()">
	                    
	                        <div class="userListDiv1">
	                        	<img class="userListImg" src="/res/img/chall.png">
	                        </div>
	                        
	                        <div class="userListDiv2">
	                        	<img class="userListImg" src="/res/img/HiBaby.jpg">
	                        </div>
	                        
	                        <div class="userListDiv3">Test321</div>
	                        <div class="userListDiv4">저의 상태메세지 입니다 말은점으로...</div>                            
	                        <span id="loginChkCir" class="material-icons">child_care</span>
	                    </div>
	                     -->
					</div>


				</div>

				<!-- Modal bottom -->
			</div>
		</div>
		<!-- 친구 목록 모달 end -->


		<!-- 대화창 start -->
		<!-- 대화창 전체 div -->
		<div id="chatDiv">
			<div id="userInfoBox">

				<!-- 	상단 상대방 유저 이미지 / 닉네임 띄우기
            	
                <img src="/res/img/chall.png" id="chatUserImg">
                <span id="chatUserNick">Test321</span>
                 -->

			</div>

			<span id="chatExitBtn" class="material-icons"
				onclick="chatModalHide()">clear</span>
			<div id="chatDivheader">Drag Zone</div>

			<!-- 채팅 화면 div (itemBox)-->
			<div id="chatArea">

				<!-- 상대 채팅 -->
				<div id="youChatBox">

					<!-- 
                    <div id="youChat">
                        <img src="/res/img/chall.png" class="youChatImg">
                        <span class="youChatNick">Test321</span>
                    </div>
                    <div class="youChatText">
                        	동해물과 백두산이 마르고 닳도록 하느님이 
                    </div>
                    <span class="youChatDate">2020. 04. 29 12:35</span>
                     -->
				</div>

				<!-- 구 분 선 -->

				<!-- 내 채팅 -->
				<div id="myChatBox">
					<!-- (일단 이거뺌 (카카오톡처럼 하기 위해서 내껀 정보 안나타냄))
                    <div id="myChat">
                        <span class="myChatNick">Test321</span>
                        <img src="/img/chall.png" class="myChatImg">
                    </div>
                    -->
					<!-- 
                    <div class="myChatText">
                	   	     동해물과 백두산이 마르고 닳도록 하느님이 
                    </div>
                    <span class="myChatDate">2020. 04. 29 12:35</span>
                     -->
				</div>

			</div>

			<div id="chatTextArea">
				<form id="chatForm">
					<textarea id="chatText" name="chatText"></textarea>
				</form>
				<span id="chatSend" class="material-icons"> send </span>
			</div>
		</div>
		<!-- 대화창 end -->


	</div>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script type="text/javascript">
	var isNewCmt = true;	// 채팅 입력시 스크롤바 제일 하단, 마지막 글을 보여줌
	
	var frDetailChk = 0; // 유저목록 상세페이지 화면 = 0 / 친구목록 상세페이지 화면 = 1
			
	// 웹소켓
	var ws;	// 대화 웹소켓	
	var from_user;  
	var to_user;
	var chatModalChk = 0
	
	
	// -	- 유저 상세 목록 (친구목록 / 유저목록 각각 button 다름)-	-
	function showDetailModal(i_user) {
        
       	axios.get('/user/detailUser',{
   			params: {
   		          i_user : i_user
   		    }
   			
   		}).then(function(res) {
   			detailUserBox.innerHTML = ''
   			makeUserDetail(res.data)
   			detailUser.style.display = 'flex'	// 나중에 대비해서 혹시 화면 잘안뜨면 위치 밑으로 뺴기
			
   		})
    }
	
	
	function makeUserDetail(res) {
		
		var loginI_user = `${loginUser.i_user}`
		
		var detailImg1 = document.createElement('img')
		detailImg1.setAttribute('class', 'detailImg1')
		if(res.totalPoint < 150) {			
			detailImg1.setAttribute('src',`/res/img/ion.png`)
			
		} else if(res.totalPoint < 400) {
			detailImg1.setAttribute('src',`/res/img/gold.png`)
			
		} else if(res.totalPoint < 600) {
			detailImg1.setAttribute('src',`/res/img/dia.png`)
			
		} else if(res.totalPoint < 20000) {
			detailImg1.setAttribute('src',`/res/img/master.png`)
			
		} else if(res.totalPoint > 20000) {
			detailImg1.setAttribute('src',`/res/img/chall.png`)
		}
		
		detailUserBox.append(detailImg1)
		
		var detailUserInfo = document.createElement('div')
		detailUserInfo.setAttribute('id', 'detailUserInfo')
		detailUserInfo.setAttribute('class', 'detailUserInfo')
		
		detailUserBox.append(detailUserInfo)
		
		var detailImg2 = document.createElement('img')
		detailImg2.setAttribute('class', 'detailImg2')
		if(res.profile_img != null) {
			detailImg2.setAttribute('src',`/res/img/HiBaby/profile_img/user/\${res.i_user}/\${res.profile_img}`)
			
		} else {
			detailImg2.setAttribute('src','/res/img/HiBaby.jpg')
		}
		detailUserInfo.append(detailImg2)
		
		var detailNick = document.createElement('span')
		detailNick.setAttribute('class', 'detailNick')
		detailNick.append(res.nick)
		
		detailUserInfo.append(detailNick)
		
		var detailPoint = document.createElement('span')
		detailPoint.setAttribute('class', 'detailPoint')
		detailPoint.append(res.totalPoint + 'p')
		
		detailUserBox.append(detailPoint)
		
		var detailSm = document.createElement('div')
		detailSm.setAttribute('class', 'detailSm')
		
		var detailP = document.createElement('p')
		detailP.setAttribute('class', 'detailP')
		
		if(res.sm == null) {
			detailP.innerText = '상태메세지가 없습니다.'
		} else {
			detailP.append(res.sm)
		}
		detailSm.append(detailP)
		
		detailUserBox.append(detailSm)
		
		// 친구추가 / 쪽지 btn 값 넣기
		//순서도 : detailUserBox > detailBtnMall > frPlusBtn 순으로
		
		
		var detailBtnMall = document.createElement('div')
		detailBtnMall.setAttribute('id', 'detailBtnMall')
		

		var frPlusBtn = document.createElement('button')
		frPlusBtn.setAttribute('id', 'frPlusBtn')
		frPlusBtn.innerText = '친구추가'
		frPlusBtn.onclick = function() { // 친구 추가
			
			var loginNick = `${loginUser.nick}`
			if(loginNick == '') {
				alert('로그인을 해주세요')
				return false;
			}
			
			var i_user = `${loginUser.i_user}`
			var to_user = res.i_user
			
			axios.post('/user/insFr',{
				i_user : i_user,
				to_user : to_user
				
			}).then(function(res) {
				if(res.data == 1) {
					alert('친구가 되었습니다.')
					
				} else if(res.data == 2) {
					alert('나자신은 등록할수 없습니다.')
					
				}  else if(res.data == 10){
					alert('이미 등록되어 있는 친구 입니다.')
				} 
			})
		}
		
		var messageBtn = document.createElement('button')
		messageBtn.setAttribute('id', 'messageBtn')
		messageBtn.innerText = '쪽지'
		messageBtn.onclick = function() {
			
			
			alert('쪽지 기능 넣기');
		}	
	
				/* 유저목록에서 상세페이지 띄울때 */
				
		if(frDetailChk == 0) { 	
			
			if(loginI_user != res.i_user) { // 나자신은 쪽지, 친추 금지
				detailBtnMall.append(frPlusBtn)
				detailBtnMall.append(messageBtn)
				detailUserBox.append(detailBtnMall)	
			}
		
		
			/* 친구목록에서 상세페이지 띄울때  */
			
		} else if(frDetailChk == 1)	{
			
			var detailBtnMall = document.createElement('div')
			detailBtnMall.setAttribute('id', 'detailBtnMall')
			
			var frDelBtn = document.createElement('button')
			frDelBtn.setAttribute('id', 'frPlusBtn')
			frDelBtn.innerText = '친구삭제'
			frDelBtn.onclick = function() { // 친구 추가
				
				if(confirm('친구와 절교하시겠습니까?')) {
					var loginNick = `${loginUser.nick}`
						if(loginNick == '') {
							alert('로그인을 해주세요')
							return false;
						}
						
						var i_user = `${loginUser.i_user}`
						var to_user = res.i_user
						
						axios.post('/user/delFr',{
							i_user : i_user,	// 로그인한 pk 값
							to_user : to_user	// 삭제할 친구 pk 값
							
						}).then(function(res) {
							if(res.data == 1) {
								location.reload();
								
							} else {
								alert('절교가 안되었습니다 다시 시도해 주세요')
							}
						})	
				}
			}
			
			var frmessageBtn = document.createElement('button')
			frmessageBtn.setAttribute('id', 'messageBtn')
			frmessageBtn.innerText = '대화하기'
			frmessageBtn.onclick = function() {
				chatModalChk += 1
				if(chatModalChk > 1) {
					alert('기존의 채팅창을 닫아주세요')
					return;
				}
				
				/*
					selChatChk 의 값delete 하는 mapper 만들기 (다만들었으면 주석 지우기)
				*/
				
				/*
					1. 화면 켜고 from_user(나), to_user(상대) pk값 가져옴
					1-1 (아래작업 웹소켓으로 감싸기)
					2. insChat(n,n) 함수 실행후..
					3. 웹소켓 실행(값 뿌리기 )
				*/
				
				chatDiv.style.display = 'flex'
				
				from_user = `${loginUser.i_user}`
				to_user = res.i_user
				
				//chatArea.innerHTML = ''		// 채팅창이 열릴때마다 새로운 n번 유저의 대화목록을 띄우기용
				
				selChatTop(to_user);			// 상대방 챗 상단 부
				selChat(from_user, to_user); 	// 챗 뿌리기
				insChat(from_user, to_user);	// 챗 입력
				
				//selChatChk()	 @@@@@@
		   		
				ws = new WebSocket('ws://localhost:8080/echo')
				// 1. 채팅창 들어오면 웹소켓 연결됨
				ws.onopen = function() {
					console.log('웹소켓 연결 성공(친구목록 -> 대화)')
				}
				
				// 웹소켓 관련
				$("#chatSend").click(function() {
					ws.sendMessage();
					
				});
				
				// 1. 채팅창 들어오면 웹소켓 연결됨
				/*
				ws.onopen = function() {	
					
					console.log('웹소켓 연결 성공(친구목록 -> 대화)')
				}
				*/
				
				// 2. 메세지 전송
				ws.sendMessage = function() {
					console.log('fromUser : ' + from_user)
					console.log('to_user : ' + to_user)
					console.log('222222')
					ws.send($("#chatText").val());
					
				}
				
				
				// 3. 서버로부터 메시지를 받았을 때
				ws.onmessage = function(event) {
					console.log('3333333')
					
					//var data = event.data;
					//$("#chatArea").append(data + "<br/>");
					chatArea.innerHTML = ''		// 채팅창이 열릴때마다 새로운 n번 유저의 대화목록을 띄우기용
					
					selChat(from_user, to_user); // 챗 뿌리기
					
				}	
				
				// 나의 pk 값  = from_user
				// 상대 pk 값 = to_user 매개변수로 2개 ajax post 값 insert 하는함수에 넣기
				
			}
			
			detailBtnMall.append(frDelBtn);
			detailBtnMall.append(frmessageBtn);
			detailUserBox.append(detailBtnMall);
		}
	}
	
	
	// 채팅 내용 입력
	function insChat(from_userParam, to_userParam) {
		
		$('#chatSend').click(function() {
			var from_user = from_userParam
			var to_user = to_userParam
			var ctnt = chatForm.chatText.value
			
			axios.post('/chat/insChat',{
				from_user : from_user,
				to_user : to_user,
				ctnt : ctnt
				
			}).then(function(res) {
				chatForm.chatText.value = ''
				chatForm.chatText.focus()
				//chatArea.innerHTML = ''		// 채팅창이 열릴때마다 새로운 n번 유저의 대화목록을 띄우기용
				console.log('친구목록 채팅 뿌리기 성공')
				
				// 웹소켓 작업하기
				
			})		
		})
	}
	
	// 채팅 알림창 띄우는 함수
	function selChatChk() {
		
		axios.post('/chat/selChatChk',{
			
		}).then(function(res) {
			console.log('res data 값 : ' + res.data)
			if(res.data == 1) {
				showChatAlert()
				
			} else {
				return;
			}
		})		
	}
	
	function showChatAlert() {	// 채팅 알림창 띄우기용
		var showAlertMs = document.createElement('span')
		showAlertMs.setAttribute('id', 'showAlertMs')
		showAlertMs.setAttribute('class', 'animate__flash animate__animated material-icons')
		showAlertMs.innerText = 'chat'
		
		headerBox.append(showAlertMs)
	}
	
	selChatChk();
	
	
	// 상대방 채팅 상단 부
	function selChatTop(to_user) {
		
		axios.get('/chat/selChatTop', {
			
	        params: {
	        	to_user : to_user
	        }
		     
		}).then(function(res) {
			refreshChatTop(res.data)
		})
	}
	
	// 챗 상단부 값 뿌리기
	function refreshChatTop(res) {
		
		var chatUserImg = document.createElement('img')
		chatUserImg.setAttribute('id', 'chatUserImg')
		
		if(res.to_profile_img != null) {
			chatUserImg.setAttribute('src',`/res/img/HiBaby/profile_img/user/\${res.to_user}/\${res.to_profile_img}`)
			
        } else {
        	chatUserImg.setAttribute('src','/res/img/HiBaby.jpg')
        }
		userInfoBox.append(chatUserImg)
		
		var chatUserNick = document.createElement('span')
		chatUserNick.setAttribute('id', 'chatUserNick')
		chatUserNick.append(res.to_nick)
		
		userInfoBox.append(chatUserNick)
	}
	
	// n : n 대화 뿌리기
	function selChat(from_user, to_user) {
		
		axios.get('/chat/selChat', {
			
	        params: {
	        	from_user : from_user,
	        	to_user : to_user
	        }
		     
		}).then(function(res) {
			//chatArea.innerHTML = ''		// 채팅창이 열릴때마다 새로운 n번 유저의 대화목록을 띄우기용
			
			refreshChatMenu(res.data)
			
		})
	}
	
			
	function refreshChatMenu(arr) {
		for (let i = 0; i<arr.length; i++) {
		   makeChatList(arr[i])
		}
	}
		
	// 챗 뿌리기 만들기
	function makeChatList(arr) {
		var from_userPk = `${loginUser.i_user}`
		
		if(from_userPk == arr.from_user) {	// 나 
			
			var myChatBox = document.createElement('div')
			myChatBox.setAttribute('id', 'myChatBox')
			
			var myChatText = document.createElement('div')
			myChatText.setAttribute('class', 'myChatText')
			myChatText.append(arr.ctnt)		
			
			myChatBox.append(myChatText)
			chatArea.append(myChatBox)
			
			var myChatDate = document.createElement('span')
			myChatDate.setAttribute('class', 'myChatDate')
			myChatDate.append(arr.r_dt)
			
			myChatBox.append(myChatDate)
			chatArea.append(myChatBox)
			
			
		} else { // 상대
			
			var youChatBox = document.createElement('div')
			youChatBox.setAttribute('id', 'youChatBox')
			
			var youChat = document.createElement('div')
			youChat.setAttribute('id', 'youChat')
			
			var youChatImg = document.createElement('img')
			youChatImg.setAttribute('class', 'youChatImg')
			if(arr.from_profile_img != null) {
				
				youChatImg.setAttribute('src',`/res/img/HiBaby/profile_img/user/\${arr.from_user}/\${arr.from_profile_img}`)
	    	  
	        } else {
	     	   
	           youChatImg.setAttribute('src','/res/img/HiBaby.jpg')
	        }
		
			youChat.append(youChatImg)
			
			var youChatNick = document.createElement('span')
			youChatNick.setAttribute('class', 'youChatNick')
			youChatNick.append(arr.from_nick)
			
			youChat.append(youChatNick)
			youChatBox.append(youChat)
			
			var youChatText = document.createElement('div')
			youChatText.setAttribute('class', 'youChatText')
			youChatText.append(arr.ctnt)
			youChatBox.append(youChatText)
			
			var youChatDate = document.createElement('span')
			youChatDate.setAttribute('class', 'youChatDate')
			youChatDate.append(arr.r_dt)
			youChatBox.append(youChatDate)
			
			chatArea.append(youChatBox)
		}
		if(isNewCmt){
	    	  document.getElementById('chatArea').scrollTop = document.getElementById('chatArea').scrollHeight;
	    }
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
			
			frDetailChk = 0;	// 유저 목록에서 상세페이지 열때
			
			var i_user = arr.i_user
			showDetailModal(i_user)
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
	
	
	
    // frList Start
    
    // frList hide
    function frListHide() {
        frList.style.display = 'none'
       	
    }
    
    
    // frList show
    function showFrList(i_user) {
        frList.style.display = 'flex'
        
        axios.get('/user/selFr',{
   			params: {
   		          i_user : i_user
   		    }
   			
   		}).then(function(res) {
   			frListBoxMall.innerHTML = ''
   			refreshFrList(res.data)
   		})
        
    }
    
    function refreshFrList(arr) {
		for (let i = 0; i<arr.length; i++) {
	         makeFrList(arr[i])
	    }
	}
    
    var lastText = '...'
    function makeFrList(arr) {	// 친구리스트 값 뿌리기
    	
    	var frListTable = document.createElement('div')
    	frListTable.setAttribute('class', 'frListTable')
    	
    	frListTable.onclick = function() {
    		
    		frDetailChk = 1	//	친구 목록에서 상세 페이지 열때
    		
    		frList.style.display = 'none'
    		var i_user = arr.to_user
			showDetailModal(i_user)
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
    	frListTable.append(userListDiv1)
    	
    	var userListDiv2 = document.createElement('div')
    	userListDiv2.setAttribute('class', 'userListDiv2')
    	
    	var userListImg2 = document.createElement('img')
		userListImg2.setAttribute('class', 'userListImg')
		if(arr.profile_img != null) {
			userListImg2.setAttribute('src',`/res/img/HiBaby/profile_img/user/\${arr.to_user}/\${arr.profile_img}`)
			
		} else {
			userListImg2.setAttribute('src','/res/img/HiBaby.jpg')
		}
    	
    	userListDiv2.append(userListImg2)
    	frListTable.append(userListDiv2)
    	
    	var userListDiv3 = document.createElement('div')
    	userListDiv3.setAttribute('class', 'userListDiv3')
    	userListDiv3.append(arr.nick)
    	
    	frListTable.append(userListDiv3)
    	
    	var userListDiv4 = document.createElement('div')
    	userListDiv4.setAttribute('class', 'userListDiv4')
    	if(arr.sm == null) {
			userListDiv4.innerText = ' 상태메세지가 없습니다.'
			
		} else if(arr.sm.length < 16) {
			userListDiv4.append(arr.sm)
			
		} else if (arr.sm.length > 16) {
			userListDiv4.append(arr.sm.substring(0,15) + lastText)
		} 
    	
    	frListTable.append(userListDiv4)
    	
    	var loginChkCir = document.createElement('span')
    	loginChkCir.setAttribute('id', 'loginChkCir')
    	loginChkCir.setAttribute('class', 'material-icons')
    	loginChkCir.innerText = 'child_care'
    	
    	
    	/*
    	
    		따로 밑에 ajax 함수 만들어서 매개변수값 arr.i_user 값을 보내어
    		
    		
    	*/
    	var test = document.createElement('span')
    	test.setAttribute('id', 'loginChkCir')
    	test.setAttribute('class', 'material-icons')
    	test.innerText = 'chat'
    	
    	
    	if(arr.loginChk == 2) {	// 로그인이 되어있다면 child_care 아이콘 띄움
    		frListTable.append(loginChkCir)
    	}
    	
    	// 마지막 최종 셋트 한묶음 넣기
    	frListBoxMall.append(frListTable)
    	
    }
    // frList End
    
    
    //로그아웃
	function logOut() {
		if(confirm('로그아웃 하시겠습니까?')) {
			location.href="/user/logout"	
		}
	}
	
	
	/* ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	유저 검색 관련	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ */
	
	// 화면 켜졌을때 유저 검색창 닫기
	searchBox.style.display = 'none'
	// ""   ""      유저 detail 모달 닫기
    detailUser.style.display = 'none'
	
	// 유저 검색창 열기
	function showUserList() {
		searchBox.style.display = 'flex'
	}
	
	// 닫기 눌렀을시 userList 검색창 닫기
	function searchBoxHide() {
	    searchBox.style.display = 'none'
	}    
	// userDetailModal 닫기
    function detailModalHide() {
        detailUser.style.display = 'none'
    }
    

	
	
	
    // 채팅창 드래그
    
    // Make the DIV element draggable:
	dragElement(document.getElementById("chatDiv"));
	
	function dragElement(elmnt) {
	  var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
	  if (document.getElementById(elmnt.id + "header")) {
	    // if present, the header is where you move the DIV from:
	    document.getElementById(elmnt.id + "header").onmousedown = dragMouseDown;
	  } else {
	    // otherwise, move the DIV from anywhere inside the DIV:
	    elmnt.onmousedown = dragMouseDown;
	  }
	
	  function dragMouseDown(e) {
	    e = e || window.event;
	    e.preventDefault();
	    // get the mouse cursor position at startup:
	    pos3 = e.clientX;
	    pos4 = e.clientY;
	    document.onmouseup = closeDragElement;
	    // call a function whenever the cursor moves:
	    document.onmousemove = elementDrag;
	  }
	
	  function elementDrag(e) {
	    e = e || window.event;
	    e.preventDefault();
	    // calculate the new cursor position:
	    pos1 = pos3 - e.clientX;
	    pos2 = pos4 - e.clientY;
	    pos3 = e.clientX;
	    pos4 = e.clientY;
	    // set the element's new position:
	    elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
	    elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
	  }
	
	  function closeDragElement() {
	    // stop moving when mouse button is released:
	    document.onmouseup = null;
	    document.onmousemove = null;
	  }
	}
	
	
	// 채팅창 닫기
	function chatModalHide() {
		chatModalChk = 0
		console.log('챗 모달 체크 값 : ' + chatModalChk)
	    chatDiv.style.display = 'none'
	    //ws.close()
	    location.reload();
	}
	
	
	

    
    
</script>
</body>
</html>