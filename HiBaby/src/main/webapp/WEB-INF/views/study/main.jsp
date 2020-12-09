<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/res/css/animate.css">
<link rel="stylesheet" href="/res/css/studyMain.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
	<div class="container">
        <div class="btnContainer">
            <button id="mathBtn" onclick="openMath()">수학공부</button>
            <button id="engBtn" onclick="openEng()">영어공부</button>
        </div>
    </div>

    <!-- 난이도 선택 모달창 -->
    <div id="mathModal" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <h4>수학 난이도 선택</h4>
            
            <!-- Modal body -->
            <div class="modal-body">
                <form id="frm" action="/study/math" method="get" onsubmit="return chk()">
                    <label>
                   		 상<input id="hard" type="radio" name="level" value="3">&nbsp;                        
                    </label>
                    <label>
                                                     중<input id="normal" type="radio" name="level" value="2">&nbsp;
                    </label>
                    <label>
                                                     하<input id="eazy" type="radio" name="level" value="1" checked>&nbsp;
                    </label>
                    <br>
                    <input type="hidden" name="studyCode" value="1">
                    <button id="submitBtn" type="submit">수학 공부시작</button>
                </form>
            </div>
            
            <!-- Modal bottom -->
            <button id="exitBtn" type="button" class="pop_bt" onclick="mathHide()">종료</button>
        </div>
    </div>


    <div id="engModal"" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <h4>영어 난이도 선택</h4>
            
            <!-- Modal body -->
            <div class="modal-body">
                <form id="frm" action="/study/eng" method="post" onsubmit="return chk()">
                    <label>
                                                 상<input id="hard" type="radio" name="level" value="3">&nbsp;                        
                    </label>
                    <label>
                                                 중<input id="normal" type="radio" name="level" value="2">&nbsp;
                    </label>
                    <label>
                                                 하<input id="eazy" type="radio" name="level" value="1">&nbsp;
                    </label>
                    <br>
                    <input type="hidden" name="studyCode" value="2">
                    <button id="submitBtn" type="submit">영어 공부시작</button>
                </form>
            </div>
            
            <!-- Modal bottom -->
            <button id="exitBtn" type="button" class="pop_bt" onclick="engHide()">종료</button>
         </div>


		<div id="gugudan"></div>
         
     </div>
	
	
	
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
function openMath() {
    mathModal.style.display = 'flex'
}

function openEng() {
    engModal.style.display = 'flex'
}

//모달창 종료
function mathHide() {
	mathModal.style.display = 'none'
}

function engHide() {
    engModal.style.display = 'none'
}


/*
// 구구단 표 만들기 메소드
function make() {
    var result = 0
    var stringText = document.createElement('div')
    var br = document.createElement('br')
    br.setAttribute('class', 'br')
    var text;
    
    for(var i=1; i<=15; i++) {
        result = 2 * i
        
        text = '2 x ' + i + ' = ' + result
        stringText.append(text)
        
        gugudan.append(stringText)
        
    }
}
*/
</script>
</body>
</html>