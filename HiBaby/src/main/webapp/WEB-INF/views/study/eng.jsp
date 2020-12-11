<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영어 문제</title>
<link rel="stylesheet" href="/res/css/animate.css">
<!-- math.css로 일단 해놨음 -->
<link rel="stylesheet" href="/res/css/math.css"> 
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
	#h4s {
		color: red;
	}
</style>
</head>
<body>
<div class="container">
    <div class="mainContainer">
    	 <!-- 문제풀이창 열리면 시간초가 흘러감 -->
        <div id="testStartBtn"></div>
        <h4 id="h4s">정답은 소문자로 입력해 주세요</h4>
        <form id="frm" onsubmit="return chk()">
        	
            <div class="formContainer">
                ${dataEng.eq1} = <input class="input" type="text" name="aa1">
                <span class="an"></span><br>
                
                ${dataEng.eq2} = <input class="input" type="text" name="aa2">
                <span class="an"></span><br>

                ${dataEng.eq3} = <input class="input" type="text" name="aa3">
                <span class="an"></span><br>
                
                ${dataEng.eq4} = <input class="input" type="text" name="aa4">
                <span class="an"></span><br>
                
                ${dataEng.eq5} = <input class="input" type="text" name="aa5">
                <span class="an"></span><br>
                
                ${dataEng.eq6} = <input class="input" type="text" name="aa6">
                <span class="an"></span><br>
                
                ${dataEng.eq7} = <input class="input" type="text" name="aa7">
                <span class="an"></span><br>
                
                ${dataEng.eq8} = <input class="input" type="text" name="aa8">
                <span class="an"></span><br>
                
                ${dataEng.eq9} = <input class="input" type="text" name="aa9">
                <span class="an"></span><br>
                
                ${dataEng.eq10} = <input class="input" type="text" name="aa10">
                <span class="an"></span><br>
                
                <input type="hidden" name="i_user" value="${loginUser.i_user}">	<%-- 포인트 적립용 --%>
                <input type="hidden" name="level" value="${data.level}">
                <!-- 문제제출 버튼 누름과 동시에 스톱워치 기능이 멈춤 -->
            	<button id="stopWatch" class="mathResult" type="button" onclick="mathResult()">문제 제출</button>
            </div>
		</form>        
    </div>
    
	<!-- 난이도 선택 모달창 -->
    <div id="mathModal" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <h2>정답확인</h2>
            
            <!-- Modal body -->
            <div class="modal-body">
            	<form id="modalFrm" action="/study/eng" method="post">
	            	1)&nbsp; ${dataEng.eq1} = <input id="ma1" class="input" type="text" name="userEa1" readonly>
	                <span id="an1" class="an"></span><br>
	                
	                2)&nbsp; ${dataEng.eq2} = <input id="ma2" class="input" type="text" name="userEa2" readonly>
	                <span id="an2" class="an"></span><br>
	
	                3)&nbsp; ${dataEng.eq3} = <input id="ma3" class="input" type="text" name="userEa3" readonly>
	                <span id="an3" class="an"></span><br>
	                
	                4)&nbsp; ${dataEng.eq4} = <input id="ma4" class="input" type="text" name="userEa4" readonly>
	                <span id="an4" class="an"></span><br>
	                
	                5)&nbsp; ${dataEng.eq5} = <input id="ma5" class="input" type="text" name="userEa5" readonly>
	                <span id="an5" class="an"></span><br>
	                
	                6)&nbsp; ${dataEng.eq6} = <input id="ma6" class="input" type="text" name="userEa6" readonly>
	                <span id="an6" class="an"></span><br>
	                
	                7)&nbsp; ${dataEng.eq7} = <input id="ma7" class="input" type="text" name="userEa7" readonly>
	                <span id="an7" class="an"></span><br>
	                
	                8)&nbsp;${dataEng.eq8} = <input id="ma8" class="input" type="text" name="userEa8" readonly>
	                <span id="an8" class="an"></span><br>
	                
	                9)&nbsp; ${dataEng.eq9} = <input id="ma9" class="input" type="text" name="userEa9" readonly>
	                <span id="an9" class="an"></span><br>
	                
	                10)&nbsp; ${dataEng.eq10} = <input id="ma10" class="input" type="text" name="userEa10" readonly>
	                <span id="an10" class="an"></span><br>
	                <hr>
	                <div class="goodCntDiv">		                			                	
	                    <div id="goodCnt">정답수 : </div>
	                </div>
	                <div class="timeAttack">
	                	<div id="time"></div>
	                </div>
	                <input type="hidden" name="level" value="${dataEng.level}">
	                <!-- 시간기능@@@@@@@@@@@@@@@@@@@ -->
                       <div class="timeWatchDiv">
                           <div>
                           	Time :
                               <span id="postTestMin">00</span><!-- 분 -->
                               <span>:</span>
                               <span id="postTestSec">00</span>
                               <!--초-->
                               <span>.</span>
                               <span id="postTestMilisec">00</span>
                               <!--밀리초-->
                               <hr>
                           </div>
                       </div>
                       
                       
                        
                       <!-- 시간기능@@@@@@@@@@@@@@@@@@@ -->
                       <button id="submitBtn" type="submit" class="pop_bt" onclick="mathHide()">문제 제출</button>
                </form>
            </div>
            
            <!-- Modal bottom -->
         
        </div>
    </div>
    
</div>




<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
function mathResult() {
	var goodCount = 10
	
	if(frm.aa1.value.length == 0) {
		alert('첫번째 문제 정답을 입력해 주세요')
		return false;
		
	} else if(frm.aa2.value.length == 0) {
		alert('두번째 문제 정답을 입력해 주세요')
		return false;
		
	} else if(frm.aa3.value.length == 0) {
		alert('세번째 문제 정답을 입력해 주세요')
		return false;
		
	} else if(frm.aa4.value.length == 0) {
		alert('네번째 문제 정답을 입력해 주세요')
		return false;
		
	} else if(frm.aa5.value.length == 0) {
		alert('다섯번째 문제 정답을 입력해 주세요')
		return false;
		
	} else if(frm.aa6.value.length == 0) {
		alert('여섯번째 문제 정답을 입력해 주세요')
		return false;
		
	} else if(frm.aa7.value.length == 0) {
		alert('일곱번째 문제 정답을 입력해 주세요')
		return false;
		
	} else if(frm.aa8.value.length == 0) {
		alert('여덞번째 문제 정답을 입력해 주세요')
		return false;
		
	} else if(frm.aa9.value.length == 0) {
		alert('아홉번째 문제 정답을 입력해 주세요')
		return false;
		
	} else if(frm.aa10.value.length == 0) {
		alert('열번째 문제 정답을 입력해 주세요')
		return false;
	}
		
	mathModal.style.display = 'flex'
	
	
	var mya1 = frm.aa1.value
	var mya2 = frm.aa2.value
	var mya3 = frm.aa3.value
	var mya4 = frm.aa4.value
	var mya5 = frm.aa5.value
	var mya6 = frm.aa6.value
	var mya7 = frm.aa7.value
	var mya8 = frm.aa8.value
	var mya9 = frm.aa9.value
	var mya10 = frm.aa10.value
		
	
	var ea1 = `${dataEng.ea1}`	
	var ea2 = `${dataEng.ea2}`	
	var ea3 = `${dataEng.ea3}`	
	var ea4 = `${dataEng.ea4}`	
	var ea5 = `${dataEng.ea5}`	
	var ea6 = `${dataEng.ea6}`	
	var ea7 = `${dataEng.ea7}`	
	var ea8 = `${dataEng.ea8}`	
	var ea9 = `${dataEng.ea9}`	
	var ea10 = `${dataEng.ea10}`
	
	
	modalFrm.userEa1.value = mya1
	modalFrm.userEa2.value = mya2
	modalFrm.userEa3.value = mya3
	modalFrm.userEa4.value = mya4
	modalFrm.userEa5.value = mya5
	modalFrm.userEa6.value = mya6
	modalFrm.userEa7.value = mya7
	modalFrm.userEa8.value = mya8
	modalFrm.userEa9.value = mya9
	modalFrm.userEa10.value = mya10
	
	
	if(ea1 != mya1) {
		an1.append(ea1)
		goodCount -= 1
	}
	
	if(ea2 != mya2) {
		an2.append(ea2)
		goodCount -= 1
	}
	
	if(ea3 != mya3) {
		an3.append(ea3)
		goodCount -= 1
	}
	
	if(ea4 != mya4) {
		an4.append(ea4)
		goodCount -= 1
	}
	
	if(ea5 != mya5) {
		an5.append(ea5)
		goodCount -= 1
	}
	
	if(ea6 != mya6) {
		an6.append(ea6)
		goodCount -= 1
	}
	
	if(ea7 != mya7) {
		an7.append(ea7)
		goodCount -= 1
	}
	
	if(ea8 != mya8) {
		an8.append(ea8)
		goodCount -= 1
	}
	
	if(ea9 != mya9) {
		an9.append(ea9)
		goodCount -= 1
	}
	
	if(ea10 != mya10) {
		an10.append(ea10)
		goodCount -= 1
	}

	goodCnt.append(goodCount)
	
}



//모달창 종료
function mathHide() {
	mathModal.style.display = 'none'
}

function engHide() {
    engModal.style.display = 'none'
}

var stTime
var timerStart
$('#testStartBtn').ready(function() {
    if (!stTime) {
        stTime = new Date().getTime() //클릭한 시점의 현재시간 timestamp를 stTime에 저장
    }
    timerStart = setInterval(function () {
        var nowTime = new Date().getTime() //1ms당 한 번씩 현재시간 timestamp를 불러와 nowTime에 저장
        var newTime = new Date(nowTime - stTime) //(nowTime - stTime)을 new Date()에 넣는다
        var min = newTime.getMinutes() //분
        var sec = newTime.getSeconds() //초
        var milisec = Math.floor(newTime.getMilliseconds() / 10) //밀리초
        document.getElementById('postTestMin').innerText = addZero(min)
        document.getElementById('postTestSec').innerText = addZero(sec)
        document.getElementById('postTestMilisec').innerText = addZero(milisec)
        
    }, 1)
})

document.getElementById('stopWatch').addEventListener('click', function () {
	
    if (timerStart) {
        clearInterval(timerStart)
    }
})

function addZero(num) {
    return (num < 10 ? '0' + num : '' + num)
}
</script>
</body>
</html>