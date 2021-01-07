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
        	<c:if test="${count != 20}">
        		<div id="msgResult">내용 : ${msgResult}</div>
        	</c:if>
            <div id="numCount">${count} 회 남았습니다</div>
            
        </div>

		<!-- inputBox -->
        <div class="inputBox">
            
            <form id="userInsFrm" action="/pro/pro_num" method="get" onsubmit="return userChk()">
                <input type="number" id="userResult" name="userResult">
                <button type="submit">입력</button>
            </form>
            
            <%-- 위 if문 때문에 css 포지션으로 잡아야됨 (아니면 com 위치 왼쪽으로 옴) --%>
			<c:if test="${count != 20}">
				<div id="computer">com</div>
            	<div id="comResult">${comResult}</div>
			</c:if>
			
        </div>
        
        
    </div>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
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