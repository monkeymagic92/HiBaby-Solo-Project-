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
	        <form id="frm" action="/study/math" method="post" onsubmit="return chk()">
	            <div class="formContainer">
	                ${data.q1} + ${data.q1_1} = <input class="input" type="number" name="a1">
	                <span class="an"></span><br>
	                
	                ${data.q2} + ${data.q2_2} = <input class="input" type="number" name="a2">
	                <span class="an"></span><br>
	
	                ${data.q3} + ${data.q3_3} = <input class="input" type="number" name="a3">
	                <span class="an"></span><br>
	                
	                ${data.q4} + ${data.q4_4} = <input class="input" type="number" name="a4">
	                <span class="an"></span><br>
	                
	                ${data.q5} - ${data.q5_5} = <input class="input" type="number" name="a5">
	                <span class="an"></span><br>
	                
	                ${data.q6} - ${data.q6_6} = <input class="input" type="number" name="a6">
	                <span class="an"></span><br>
	                
	                ${data.q7} - ${data.q7_7} = <input class="input" type="number" name="a7">
	                <span class="an"></span><br>
	                
	                ${data.q8} - ${data.q8_8} = <input class="input" type="number" name="a8">
	                <span class="an"></span><br>
	                
	                ${data.q9} X ${data.q9_9} = <input class="input" type="number" name="a9">
	                <span class="an"></span><br>
	                
	                ${data.q10} X ${data.q10_10} = <input class="input" type="number" name="a10">
	                <span class="an"></span><br>
	                
	                <input type="hidden" name="i_user" value="${loginUser.i_user}">	<%-- 포인트 적립용 --%>
	                <input type="hidden" name="level" value="${data.level}">
	            	<button type="submit">전송</button>
	            </div>
	        </form>
	    </div>
	    
	</div>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>	
<script>
	
</script>
</body>
</html>