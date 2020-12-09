<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyMath</title>
<link rel="stylesheet" href="/res/css/animate.css">
<link rel="stylesheet" href="/res/css/math.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
	<div class="container">
	    <div class="mainContainer">
	        <!-- 테스트용으로 4개만 해놓고 잘되면 10개 다 만들기 -->
	        <form id="frm" onsubmit="return chk()">
	            <div class="formContainer">
	                ${data.q1} + ${data.q1_1} = <input class="input" type="number" name="aa1">
	                <span class="an"></span><br>
	                
	                ${data.q2} + ${data.q2_2} = <input class="input" type="number" name="aa2">
	                <span class="an"></span><br>
	
	                ${data.q3} + ${data.q3_3} = <input class="input" type="number" name="aa3">
	                <span class="an"></span><br>
	                
	                ${data.q4} + ${data.q4_4} = <input class="input" type="number" name="aa4">
	                <span class="an"></span><br>
	                
	                ${data.q5} - ${data.q5_5} = <input class="input" type="number" name="aa5">
	                <span class="an"></span><br>
	                
	                ${data.q6} - ${data.q6_6} = <input class="input" type="number" name="aa6">
	                <span class="an"></span><br>
	                
	                ${data.q7} - ${data.q7_7} = <input class="input" type="number" name="aa7">
	                <span class="an"></span><br>
	                
	                ${data.q8} - ${data.q8_8} = <input class="input" type="number" name="aa8">
	                <span class="an"></span><br>
	                
	                ${data.q9} X ${data.q9_9} = <input class="input" type="number" name="aa9">
	                <span class="an"></span><br>
	                
	                ${data.q10} X ${data.q10_10} = <input class="input" type="number" name="aa10">
	                <span class="an"></span><br>
	                
	                <input type="hidden" name="i_user" value="${loginUser.i_user}">	<%-- 포인트 적립용 --%>
	                <input type="hidden" name="level" value="${data.level}">
	            	<button class="mathResult" type="button" onclick="mathResult()">문제 제출</button>
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
	            	<form id="modalFrm" action="/study/math" method="post">
		            	1)&nbsp; ${data.q1} + ${data.q1_1} = <input id="ma1" class="input" type="number" name="a1" readonly>
		                <span id="an1" class="an"></span><br>
		                
		                2)&nbsp; ${data.q2} + ${data.q2_2} = <input id="ma2" class="input" type="number" name="a2" readonly>
		                <span id="an2" class="an"></span><br>
		
		                3)&nbsp; ${data.q3} + ${data.q3_3} = <input id="ma3" class="input" type="number" name="a3" readonly>
		                <span id="an3" class="an"></span><br>
		                
		                4)&nbsp; ${data.q4} + ${data.q4_4} = <input id="ma4" class="input" type="number" name="a4" readonly>
		                <span id="an4" class="an"></span><br>
		                
		                5)&nbsp; ${data.q5} - ${data.q5_5} = <input id="ma5" class="input" type="number" name="a5" readonly>
		                <span id="an5" class="an"></span><br>
		                
		                6)&nbsp; ${data.q6} - ${data.q6_6} = <input id="ma6" class="input" type="number" name="a6" readonly>
		                <span id="an6" class="an"></span><br>
		                
		                7)&nbsp; ${data.q7} - ${data.q7_7} = <input id="ma7" class="input" type="number" name="a7" readonly>
		                <span id="an7" class="an"></span><br>
		                
		                8)&nbsp; ${data.q8} - ${data.q8_8} = <input id="ma8" class="input" type="number" name="a8" readonly>
		                <span id="an8" class="an"></span><br>
		                
		                9)&nbsp; ${data.q9} X ${data.q9_9} = <input id="ma9" class="input" type="number" name="a9" readonly>
		                <span id="an9" class="an"></span><br>
		                
		                10)&nbsp; ${data.q10} X ${data.q10_10} = <input id="ma10" class="input" type="number" name="a10" readonly>
		                <span id="an10" class="an"></span><br>
		                <div class="goodCntDiv">
		                    <div id="goodCnt">정답수 : </div>
		                </div>
		                <div class="timeAttack">
		                	<div id="time"></div>
		                </div>
		                <input type="hidden" name="level" value="${data.level}">
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
		
		
		var q1 = `${data.q1}`
		var q1_1 = `${data.q1_1}`
		var q2 = `${data.q2}`
		var q2_2 = `${data.q2_2}`
		var q3 = `${data.q3}`
		var q3_3 = `${data.q3_3}`
		var q4 = `${data.q4}`
		var q4_4 = `${data.q4_4}`
		var q5 = `${data.q5}`
		var q5_5 = `${data.q5_5}`
		var q6 = `${data.q6}`
		var q6_6 = `${data.q6_6}`
		var q7 = `${data.q7}`
		var q7_7 = `${data.q7_7}`
		var q8 = `${data.q8}`
		var q8_8 = `${data.q8_8}`
		var q9 = `${data.q9}`
		var q9_9 = `${data.q9_9}`
		var q10 = `${data.q10}`
		var q10_10 = `${data.q10_10}`
	
		var ra1 = `${data.q1 + data.q1_1}`
		var ra2 = `${data.q2 + data.q2_2}`
		var ra3 = `${data.q3 + data.q3_3}`
		var ra4 = `${data.q4 + data.q4_4}`
		var ra5 = `${data.q5 - data.q5_5}`
		var ra6 = `${data.q6 - data.q6_6}`
		var ra7 = `${data.q7 - data.q7_7}`
		var ra8 = `${data.q8 - data.q8_8}`
		var ra9 = `${data.q9 * data.q9_9}`
		var ra10 = `${data.q10 * data.q10_10}`
		
		
		
		modalFrm.a1.value = mya1
		modalFrm.a2.value = mya2
		modalFrm.a3.value = mya3
		modalFrm.a4.value = mya4
		modalFrm.a5.value = mya5
		modalFrm.a6.value = mya6
		modalFrm.a7.value = mya7
		modalFrm.a8.value = mya8
		modalFrm.a9.value = mya9
		modalFrm.a10.value = mya10
		
		
		if(ra1 != mya1) {
			an1.append(ra1)
			goodCount -= 1
		}
		
		if(ra2 != mya2) {
			an2.append(ra2)
			goodCount -= 1
		}
		
		if(ra3 != mya3) {
			an3.append(ra3)
			goodCount -= 1
		}
		
		if(ra4 != mya4) {
			an4.append(ra4)
			goodCount -= 1
		}
		
		if(ra5 != mya5) {
			an5.append(ra5)
			goodCount -= 1
		}
		
		if(ra6 != mya6) {
			an6.append(ra6)
			goodCount -= 1
		}
		
		if(ra7 != mya7) {
			an7.append(ra7)
			goodCount -= 1
		}
		
		if(ra8 != mya8) {
			an8.append(ra8)
			goodCount -= 1
		}
		
		if(ra9 != mya9) {
			an9.append(ra9)
			goodCount -= 1
		}
		
		if(ra10 != mya10) {
			an10.append(ra10)
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
</script>
</body>
</html>