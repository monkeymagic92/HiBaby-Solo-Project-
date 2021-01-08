<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	2인용 숫자 스묵고개
	<div id="levelMsg">난이도 : ${levelAlert}</div>
	<div id="levelMsg">카운트 : ${count}</div>
	<div id="gameResult">정답 : ${gameResult}</div>
	<c:if test="${count != 20}">
   		<div id="msgResult">내용 : ${msgResult}</div>
   	</c:if>
	<br><br>
	
	<c:if test="${gameEnd == null}">
		<c:if test="${count % 2 == 0}">
		1P nick : ${oneNick}
		
		<form id="oneFrm" action="/pro/peopleGame" method="post" onsubmit="return oneFrmChk()">
			<input id="oneResult" type="number" name="oneResult">
			<button type="submit">입력</button> 
		</form>
		</c:if>
	
	
	
		<c:if test="${count % 2 == 1}">
		2P nick : ${twoNick}
		
		<form id="twoFrm" action="/pro/peopleGame" method="post" onsubmit="return twoFrmChk()">
			<input id="twoResult" type="number" name="twoResult">
			<button type="submit">입력</button> 
		</form>
		</c:if>
	</c:if>
	
	<c:if test="${draw != null}">
		<h1>무승부! 모달창 만들기</h1>
	</c:if>
	
	
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