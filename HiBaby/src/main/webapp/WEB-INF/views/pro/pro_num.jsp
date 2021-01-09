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
	
</script>
</body>
</html>