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
	<div class="numContainer">

		<!-- msgBox -->
        <div class="msgBox">        	
        	<div id="levelMsg">난이도 : ${levelAlert}</div>
        	<div id="gameResult">정답 : ${gameResult}</div>
            <div id="numCount">${count} 회</div>
            <div id="numMsg">${turn} 홀수 짝수 구분지어 홀수 = user / 짝수 = com</div>
        </div>

		<!-- inputBox -->
        <div class="inputBox">
            <div>user</div>
            <!-- ajax로 값 넘기기 -->
            <form id="userInsFrm" action="/pro/pro_num" method="post" onsubmit="return userChk()">
                <input type="number" id="userResult">
                <button type="submit">입력</button>
            </form>
            <div id="comResult">ComResult</div>
        </div>
        
        
    </div>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
	
	
</script>
</body>
</html>