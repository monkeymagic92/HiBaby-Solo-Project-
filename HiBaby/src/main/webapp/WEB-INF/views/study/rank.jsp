<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디 랭크</title>
</head>
<body>
	<div>스터디 래읔</div>
	1등정보
	<c:choose>
    	<c:when test="${oneRank.totalPoint < 150}">
    		<img src="/res/img/ion.png" class="classesImg">
    	</c:when>
    	<c:when test="${oneRank.totalPoint < 400}">
    		<img src="/res/img/gold.png" class="classesImg">
    	</c:when>
    	<c:when test="${oneRank.totalPoint < 600}">
    		<img src="/res/img/dia.png" class="classesImg">
    	</c:when>
    	<c:when test="${oneRank.totalPoint < 20000}">
    		<img src="/res/img/master.png" class="classesImg">
    	</c:when>
    	<c:when test="${oneRank.totalPoint > 20000}">
    		<img src="/res/img/chall.png" class="classesImg">
    	</c:when>
   	</c:choose>
	<div>${oneRank.nick}</div>
	<div>${oneRank.totalPoint}</div>
	<br><br>
	
	2등정보
	<div>${twoRank.nick}</div>
	<div>${twoRank.totalPoint}</div>
	<br><br>
	
	3등정보
	<div>${threeRank.nick}</div>
	<div>${threeRank.totalPoint}</div>
	<br><br>
	
	
	<c:forEach items="${otherRank}" var="item">    
		<div>${item.nick}</div>
		<div>${item.totalPoint}</div>
	</c:forEach>
</body>
</html>