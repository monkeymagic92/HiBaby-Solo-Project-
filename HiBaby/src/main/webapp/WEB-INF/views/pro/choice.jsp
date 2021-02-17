<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choice 화면</title>
<link rel="stylesheet" href="/res/css/choice.css">
<link rel="stylesheet" type="text/css" href="/res/css/animate.css">
</head>
<body>
	<div class="choiceContainer">
	
	    <h1 id="choiceMsg">고민되는 항목을 입력해 주세요.</h1>
	
	    <div class="boxContainer">
	        <div id="choiceBox">
	            <button type="button" id="categoryBox" onclick="categoryBox()">항목 추가</button>
	            <button type="button" id="allDel" onclick="allDelBtn()">전체 삭제</button>
	        </div>
	        <div id="insMoll">
	            <form id="choiceFrm" action="/pro/choice" method="post">
	                <!--
	                <div id="insDiv">
	                    <input class="ins" id="ins1" name="choiceArr" type="text">
	                </div>
	                -->
	                <div>
	                    <button type="submit" id="choiceSubmit" onclick="choiceSubmit()">전송</button>
	                </div>
	            </form>
	        </div>
	    </div>
	</div>
	
	<c:if test="${arrResult != null}">
		<div id="numModal" class="modal">
	        <!-- Modal content -->
	        <div class="modal-content animate__rubberBand animate__animated">
	            
	            <!-- Modal body -->
	            <div class="modal-body">
	               	<span id="modalDraw">${arrResult}</span>
	            </div>
	            
	            <!-- Modal bottom -->
	            <a id="exitBtn" class="pop_bt" onclick="backBtn()">뒤로가기</a>
	        </div>
	    </div>
    </c:if>



<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

var count = 0;
var arr = [];

function categoryBox() {
    ++count
    var insDiv = document.createElement('div')
    insDiv.setAttribute('id', 'insDiv')
    
    var ins = document.createElement('input')
    ins.setAttribute('id', 'ins' + count)
    ins.setAttribute('class', 'ins')
    ins.setAttribute('name', 'choiceArr')

    var choiceDel = document.createElement('button')
    choiceDel.setAttribute('id', 'del' + count)
    choiceDel.setAttribute('type', 'button')
    choiceDel.setAttribute('class', 'choiceDel')
    choiceDel.innerText = '-'
    choiceDel.onclick = function() {
        
        $('#ins'+count).remove();
        $('#del'+count).remove();
        --count
        console.log('카운트 값' + count)
    }
    
    for(var i=0; i<count; i++) {
        arr[i-1] = $('#ins'+i).val();
    }
    choiceSubmit()

    insDiv.append(ins)
    insDiv.append(choiceDel)
    choiceFrm.append(insDiv)
    
}

function choiceSubmit() {
    console.log('arr ' + arr[0])
    console.log('arr ' + arr[1])
    console.log('arr ' + arr[2])
    console.log('arr ' + arr[3])
}


// 전체 삭제
function allDelBtn() {
    for(var i=0; i<count; i++) {
        $('#insDiv').remove();
    }
}

//모달 뒤로가기
function backBtn() {
    location.href="/pro/choice"
}
</script>
</body>
</html>