<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/res/css/peopleGame.css">
</head>
<body>
	<div class="proContainer">
        <div class="topContainer">
            <div class="marginTop">
                <span id="titleMsg">2인용 숫자 스무고개</span>
                <div id="levelMsg">- 난이도 : <span id="levelNum">${levelAlert}</span></div>
                <div id="countMsg">- <span id="countNum">${count}</span> 회 남았습니다</div>
                <!--<div id="gameResult">정답 : ${gameResult}</div>-->
                <c:if test="${count != 20}">
                    <div id="msgResult">${msgResult}</div>
                </c:if>
            </div>
        </div>
        <br><br>
        <div class="fatherDiv">
        <c:if test="${gameEnd == null}">
            <c:if test="${count % 2 == 0}">
            
	            <div class="ins1">
	                <span class="nick1">1P : ${oneNick}</span>
	            
	                <form id="oneFrm" action="/pro/peopleGame" method="post" onsubmit="return oneFrmChk()">
	                    <input id="oneResult" type="number" name="oneResult"><br>
	                    <button id="submitBtn1" type="submit">입력</button> 
	                </form>
	            </div>
	            </c:if>
	            
	        
	            <span id="vs">VS</span>
	            
	            <c:if test="${count % 2 == 1}">
	            <div class="ins2">
	                <span class="nick2">2P : ${twoNick}</span>
	                
	                <form id="twoFrm" action="/pro/peopleGame" method="post" onsubmit="return twoFrmChk()">
	                    <input id="twoResult" type="number" name="twoResult"><br>
	                    <button id="submitBtn2" type="submit">입력</button> 
	                </form>
	            </div>
            
            </c:if>            
        </c:if>
        </div>
        


        <c:if test="${draw != null}">
            <h1>무승부! 모달창 만들기</h1>
        </c:if>
    </div>
	
	
	<!-- 
		
	 -->
	 
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
	var count = `${count}`
	if(count % 2 == 0) {
		oneFrm.oneResult.focus()
		
	} else {
		twoFrm.twoResult.focus()
	}
	
	function oneFrmChk() {
		if(oneFrm.oneResult.value == '') {
			alert(`${oneNick}` + ' 님 값을 입력해 주세요!')
			oneFrm.oneResult.focus()
			return false;
		}
	}
	
	function twoFrmChk() {
		if(twoFrm.twoResult.value == '') {
			alert(`${twoNick}` + ' 님 값을 입력해 주세요!')
			twoFrm.twoResult.focus()
			return false;
		}
	}
</script>
</body>
</html>