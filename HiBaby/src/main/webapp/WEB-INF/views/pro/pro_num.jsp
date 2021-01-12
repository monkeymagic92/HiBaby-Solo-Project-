<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숫자 스무고개</title>
<link rel="stylesheet" href="/res/css/pro_num.css">
</head>
<body>
	<div class="proContainer">
            <div class="topContainer">
                <div class="marginTop">
                    <span id="titleMsg">스무고개 연습</span>
                    <div id="countMsg">- <span id="countNum">${count}</span> 회 남았습니다</div>
                    <!--  <div id="gameResult">정답 : ${gameResult}</div>-->
                    <c:if test="${count != 20}">
                        <div id="msgResult">${msgResult}</div>
                    </c:if>
                </div>
            </div>
            <br><br>

            <div class="inputBox">
                <div class="userBox">
                    <img src="/res/img/userGif.gif" class="userGif">
                    <form id="userInsFrm" action="/pro/pro_num" method="get" onsubmit="return userChk()">
                        <input type="number" id="userResult" name="userResult">
                        <button id="submitBtn1" type="submit">입력</button>
                    </form>
                </div>
                
                <c:if test="${count != 20}">                    
                    <div class="comBox">
                        <img src="/res/img/robot.gif" class="robotGif">   
                        <div id="comResult">${comResult}</div>
                    </div>
                </c:if>
            </div>
    </div>
	

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
	// 창이 켜지면 user input 커서 
	window.onload = function(){
		userInsFrm.userResult.focus()
	}

	function userChk() {
		if(userInsFrm.userResult.value > 100) {
			alert('100 이하 숫자를 입력해 주세요')
			userInsFrm.userResult.focus()
			return false;
		}
		
		if(userInsFrm.userResult.value < 1) {
			alert('1 이상 숫자를 입력해주세요')
			userInsFrm.userResult.focus()
			return false;
		} 
		
		if(userInsFrm.userResult.value == '') {
			alert('숫자를 입력해 주세요')
			userInsFrm.userResult.focus()
			return false;
		} 
		
	} 
	
	
	
	
	
	
	// 삭제하기 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	function makeUserList(arr) {		
		
		var userListBox = document.createElement('div')
		userListBox.setAttribute('id', 'userListBox')
		
		userListBox.onclick = function() {
			// ★★ 클릭했을시 상대방 상세화면 띄우기
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
	// 삭제하기 @@@@@@@@@@@@@@@@@@@@@@@@@
	
	
</script>
</body>
</html>