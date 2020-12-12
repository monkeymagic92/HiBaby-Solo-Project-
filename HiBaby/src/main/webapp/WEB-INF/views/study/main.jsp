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
<link rel="stylesheet" href="/res/css/main.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
</head>
<body>
	<div class="container">
        <video class="videoTest" src="/res/av/loginBGM.mp4" width="1px" autoplay height="1px" controls></video>    
        <h2 id="h2-1">수학공부</h2>
        <img id="studyImg" onclick="openMath()" src="/res/img/math.jpg">

        <br><br>

        <h2 id="h2-2">영어공부</h2>
        <img id="studyImg" onclick="openEng()" src="/res/img/eng.png">

        <br><br>

        <h2 id="h2-3">구구단</h2>
        <img id="studyImg" onclick="#" src="/res/img/gugudan.jpg">
        <br><br>

        <h2 id="h2-3">계산기</h2>
        <img id="showCarcul" src="/res/img/carcul.png">
        <br><br>
        
        <h2 id="h2-3">랭킹</h2>
        <img id="studyImg" onclick="openRank()" src="/res/img/bestMember.png">
        <br><br>

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


        <div id="engModal" class="modal">
            <!-- Modal content -->
            <div class="modal-content">
                <h4>영어 난이도 선택</h4>
                
                <!-- Modal body -->
                <div class="modal-body">
                    <form id="frm" action="/study/eng" method="get" onsubmit="return chk()">
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
                        <input type="hidden" name="studyCode" value="2">
                        <button id="submitBtn" type="submit">영어 공부시작</button>
                    </form>
                </div>
                
                <!-- Modal bottom -->
                <button id="exitBtn" type="button" class="pop_bt" onclick="engHide()">종료</button>
            </div>

            
        </div>
        <!---->

        
    <div id="carModal" class="modalCar">
 
		<!-- Modal content -->
		<div class="modal-content-car">
            
		    <div class="modal-body">
                <button id="hideCarcul"><div id="x">X</div></button>    
                <!-- 계산기 -->
                <div id="calculator">
                    
                    <div class="top">
                        <span class="clear">C</span>
                        <div class="screen"></div>
                    </div>
                    
                    <div class="keys">
                        <span>7</span>
                        <span>8</span>
                        <span>9</span>
                        <span class="operator">+</span>
                        <span>4</span>
                        <span>5</span>
                        <span>6</span>
                        <span class="operator">-</span>
                        <span>1</span>
                        <span>2</span>
                        <span>3</span>
                        <span class="operator">÷</span>
                        <span>0</span>
                        <span>.</span>
                        <span class="eval">=</span>
                        <span class="operator">x</span>
                    </div>
                </div>

		    </div> <!-- body 끝 -->
		    
		    <!-- Modal bottom -->
		</div>
    </div>	
	
	
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>

if(${getPoint != null}) {
	alert('${getPoint}p를 획득하였습니다')
}

if(${loginMsg != null}) {
	alert('${loginMsg}')
	location.href="/user/login"
}


function openMath() {
    mathModal.style.display = 'flex'
}

function openEng() {
    engModal.style.display = 'flex'
}

function openRank() {
	location.href = "/study/rank"	
} 



//모달창 종료
function mathHide() {
	mathModal.style.display = 'none'
}

function engHide() {
    engModal.style.display = 'none'
}

$('#carModal').hide(); 

jQuery('#showCarcul').click(function() {
	    $('#carModal').show();
	});

jQuery('#hideCarcul').click(function() {
    $('#carModal').hide(); 
});


var keys = document.querySelectorAll('#calculator span');
var operators = ['+', '-', 'x', '÷'];
var decimalAdded = false;


for(var i = 0; i < keys.length; i++) {
	keys[i].onclick = function(e) {
		
		var input = document.querySelector('.screen');
		var inputVal = input.innerHTML;
		var btnVal = this.innerHTML;
		var total;
		if(btnVal == 'C') {
			input.innerHTML = '';
			decimalAdded = false;
		}
		
		else if(btnVal == '=') {
			var equation = inputVal;
			var lastChar = equation[equation.length - 1];
			
			equation = equation.replace(/x/g, '*').replace(/÷/g, '/');
			
			if(operators.indexOf(lastChar) > -1 || lastChar == '.')
				equation = equation.replace(/.$/, '');
			
			if(equation)
				{
             total = eval(equation);
              if(total.toString().indexOf('.') != -1)
                total= total.toFixed(2);
          
          input.innerHTML = total;
        }
				
			decimalAdded = false;
		}
		
		
		else if(operators.indexOf(btnVal) > -1) {
			
			var lastChar = inputVal[inputVal.length - 1];
			
			if(inputVal != '' && operators.indexOf(lastChar) == -1) 
				input.innerHTML += btnVal;
			
			else if(inputVal == '' && btnVal == '-') 
				input.innerHTML += btnVal;
			
			if(operators.indexOf(lastChar) > -1 && inputVal.length > 1) {
				input.innerHTML = inputVal.replace(/.$/, btnVal);
			}
			
			decimalAdded =false;
		}
		
		else if(btnVal == '.') {
			if(!decimalAdded) {
				input.innerHTML += btnVal;
				decimalAdded = true;
			}
		}
		
		else {
			input.innerHTML += btnVal;
		}
		
		e.preventDefault();
	} 
}
</script>
</body>
</html>