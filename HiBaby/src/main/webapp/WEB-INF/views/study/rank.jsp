<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디 랭크</title>
<link rel="stylesheet" type="text/css" href="/res/css/rank.css">
</head>
<body>
	<%-- 
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
	  --%>
	 
	 <div class="rankContainer">
        <h2 id="h2-1">1</h2>
        <div class="firRank">
            <div class="firInfoBox">
                <!-- 유저사진 -->
                <c:if test="${oneRank.profile_img == null}">
                	<img id="userImg1" src="/res/img/Hibaby.jpg" alt="img">
                </c:if>
                <c:if test="${oneRank.profile_img != null}">
                	<img class="pimg" src="/res/img/HiBaby/profile_img/user/${oneRank.i_user }/${oneRank.profile_img}" id="userImg1" alt="">
                </c:if>

                <div class="userInfo">
                    <div id="userNick1">${oneRank.nick}</div>
                    <c:choose>
				    	<c:when test="${oneRank.totalPoint < 150}">
				    		<img id="userRankImg1" src="/res/img/ion.png" alt="img">
				    	</c:when>
				    	<c:when test="${oneRank.totalPoint < 400}">
				    		<img id="userRankImg1" src="/res/img/gold.png" alt="img">
				    	</c:when>
				    	<c:when test="${oneRank.totalPoint < 600}">
				    		<img id="userRankImg1" src="/res/img/dia.png" alt="img">
				    	</c:when>
				    	<c:when test="${oneRank.totalPoint < 20000}">
				    		<img id="userRankImg1" src="/res/img/master.png" alt="img">
				    	</c:when>
				    	<c:when test="${oneRank.totalPoint > 20000}">
				    		<img id="userRankImg1" src="/res/img/chall.png" alt="img">
				    	</c:when>
				   	</c:choose>
                    <div>${oneRank.totalPoint}p</div>
                </div>
            </div>
        </div>

        <div class="otherRank">

            <div>
                <h3 class="otherRankNum">2</h3>
                <div class="oterBox">
                	<c:if test="${twoRank.profile_img == null}">
	                	<img class="otherImg" src="/res/img/HiBaby.jpg" alt="">
	                </c:if>
	                <c:if test="${twoRank.profile_img != null}">
	                	<img class="otherImg" src="/res/img/HiBaby/profile_img/user/${twoRank.i_user }/${twoRank.profile_img}" alt="">
	                </c:if>    
                    <div class="otherInfo">
                        <div class="otherNick">${twoRank.nick}</div>
                         <c:choose>
					    	<c:when test="${twoRank.totalPoint < 150}">
					    		<img class="otherRankImg" src="/res/img/ion.png" alt="img">
					    	</c:when>
					    	<c:when test="${twoRank.totalPoint < 400}">
					    		<img class="otherRankImg" src="/res/img/gold.png" alt="img">
					    	</c:when>
					    	<c:when test="${twoRank.totalPoint < 600}">
					    		<img class="otherRankImg" src="/res/img/dia.png" alt="img">
					    	</c:when>
					    	<c:when test="${twoRank.totalPoint < 20000}">
					    		<img class="otherRankImg" src="/res/img/master.png" alt="img">
					    	</c:when>
					    	<c:when test="${twoRank.totalPoint > 20000}">
					    		<img class="otherRankImg" src="/res/img/chall.png" alt="img">
					    	</c:when>
					   	</c:choose>
                        <div class="otherPoint">${twoRank.totalPoint}p</div>
                    </div>
                </div>
            </div>


            <div>
                <h3 class="otherRankNum">3</h3>
                <div class="oterBox">
                    <img class="otherImg" src="img/HiBaby.jpg" alt="img">
                    <div class="otherInfo">
                        <div class="otherNick">Test321</div>
                        <img class="otherRankImg" src="img/chall.png" alt="rankImg">
                        <div class="otherPoint">8,500p</div>
                    </div>
                </div>
            </div>

            <div>
                <h3 class="otherRankNum">4</h3>
                <div class="oterBox">
                    <img class="otherImg" src="img/HiBaby.jpg" alt="img">
                    <div class="otherInfo">
                        <div class="otherNick">Test321</div>
                        <img class="otherRankImg" src="img/chall.png" alt="rankImg">
                        <div class="otherPoint">8,500p</div>
                    </div>
                </div>
            </div>

            <div>
                <h3 class="otherRankNum">5</h3>
                <div class="oterBox">
                    <img class="otherImg" src="img/HiBaby.jpg" alt="img">
                    <div class="otherInfo">
                        <div class="otherNick">Test321</div>
                        <img class="otherRankImg" src="img/chall.png" alt="rankImg">
                        <div class="otherPoint">8,500p</div>
                    </div>
                </div>
            </div>
        </div>


        <div class="otherTable">
            <table>
                <thead>
                    <tr class="headTr">
                        <th>#</th>
                        <th>유저</th>
                        <th>계급</th>
                        <th>포인트</th>
                    </tr>
                </thead>
                
                <tbody>
                    <tr class="bodyTr">
                        <th>1</th>
                        <th class="bodyTh"><div>Test321</div> <img class="tableImg" src="img/HiBaby.jpg" alt="img"></th>
                        <th class="bodyImg"><img class="tableImg" src="img/chall.png" alt="img"></th>
                        <th>13,000p</th>
                    </tr>
                    
                    <tr class="bodyTr">
                        <th>2</th>
                        <th class="bodyTh"><div>Test321</div> <img class="tableImg" src="img/HiBaby.jpg" alt="img"></th>
                        <th class="bodyImg"><img class="tableImg" src="img/chall.png" alt="img"></th>
                        <th>13,000p</th>
                    </tr>
                </tbody>
            </table>
        </div>


    </div>
	 
</body>
</html>