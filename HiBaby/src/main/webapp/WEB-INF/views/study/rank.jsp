<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디 랭크</title>
<link rel="stylesheet" type="text/css" href="/res/css/rank.css">
</head>
<body>
	 
	 <div class="rankContainer">
        <h2 id="h2-1">1</h2>
        <div class="firRank">
            <div class="firInfoBox">
                <!-- 유저사진 -->
                <c:if test="${oneRank.profile_img == null}">
                	<img id="userImg1" src="/res/img/HiBaby.jpg">
                </c:if>
                <c:if test="${oneRank.profile_img != null}">
                	<img class="pimg" src="/res/img/HiBaby/profile_img/user/${oneRank.i_user }/${oneRank.profile_img}" id="userImg1" alt="">
                </c:if>

                <div class="userInfo">
                    <div id="userNick1">&nbsp;${oneRank.nick}</div>
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
                    <div>&nbsp;&nbsp;<fmt:formatNumber value="${oneRank.totalPoint}" pattern="#,###" />p</div>
                </div>
            </div>
        </div>

        <div class="otherRank">

            <div>
                <h3 class="otherRankNum">2</h3>
                <div class="oterBox">
                	<c:if test="${twoRank.profile_img == null}">
	                	<img class="otherImg" src="/res/img/HiBaby.jpg">
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
                        <div>&nbsp;&nbsp;<fmt:formatNumber value="${twoRank.totalPoint}" pattern="#,###" />p</div>
                    </div>
                </div>
            </div>


            <div>
                <h3 class="otherRankNum">3</h3>
                <div class="oterBox">
                    <c:if test="${threeRank.profile_img == null}">
	                	<img class="otherImg" src="/res/img/HiBaby.jpg">
	                </c:if>
	                <c:if test="${threeRank.profile_img != null}">
	                	<img class="otherImg" src="/res/img/HiBaby/profile_img/user/${threeRank.i_user }/${threeRank.profile_img}" alt="">
	                </c:if>
                    <div class="otherInfo">
                        <div class="otherNick">${threeRank.nick}</div>
                        <c:choose>
					    	<c:when test="${threeRank.totalPoint < 150}">
					    		<img class="otherRankImg" src="/res/img/ion.png" alt="img">
					    	</c:when>
					    	<c:when test="${threeRank.totalPoint < 400}">
					    		<img class="otherRankImg" src="/res/img/gold.png" alt="img">
					    	</c:when>
					    	<c:when test="${threeRank.totalPoint < 600}">
					    		<img class="otherRankImg" src="/res/img/dia.png" alt="img">
					    	</c:when>
					    	<c:when test="${threeRank.totalPoint < 20000}">
					    		<img class="otherRankImg" src="/res/img/master.png" alt="img">
					    	</c:when>
					    	<c:when test="${threeRank.totalPoint > 20000}">
					    		<img class="otherRankImg" src="/res/img/chall.png" alt="img">
					    	</c:when>
					   	</c:choose>
                        <div>&nbsp;&nbsp;<fmt:formatNumber value="${threeRank.totalPoint}" pattern="#,###" />p</div>
                    </div>
                </div>
            </div>

            <div>
                <h3 class="otherRankNum">4</h3>
                <div class="oterBox">
                    <c:if test="${fourRank.profile_img == null}">
	                	<img class="otherImg" src="/res/img/HiBaby.jpg">
	                </c:if>
	                <c:if test="${fourRank.profile_img != null}">
	                	<img class="otherImg" src="/res/img/HiBaby/profile_img/user/${fourRank.i_user }/${fourRank.profile_img}" alt="">
	                </c:if>
                    <div class="otherInfo">
                        <div class="otherNick">${fourRank.nick}</div>
                        <c:choose>
					    	<c:when test="${fourRank.totalPoint < 150}">
					    		<img class="otherRankImg" src="/res/img/ion.png" alt="img">
					    	</c:when>
					    	<c:when test="${fourRank.totalPoint < 400}">
					    		<img class="otherRankImg" src="/res/img/gold.png" alt="img">
					    	</c:when>
					    	<c:when test="${fourRank.totalPoint < 600}">
					    		<img class="otherRankImg" src="/res/img/dia.png" alt="img">
					    	</c:when>
					    	<c:when test="${fourRank.totalPoint < 20000}">
					    		<img class="otherRankImg" src="/res/img/master.png" alt="img">
					    	</c:when>
					    	<c:when test="${fourRank.totalPoint > 20000}">
					    		<img class="otherRankImg" src="/res/img/chall.png" alt="img">
					    	</c:when>
					   	</c:choose>
                        <div>&nbsp;&nbsp;<fmt:formatNumber value="${fourRank.totalPoint}" pattern="#,###" />p</div>
                    </div>
                </div>
            </div>

            <div>
                <h3 class="otherRankNum">5</h3>
                <div class="oterBox">
                    <c:if test="${fiveRank.profile_img == null}">
	                	<img class="otherImg" src="/res/img/HiBaby.jpg">
	                </c:if>
	                <c:if test="${fiveRank.profile_img != null}">
	                	<img class="otherImg" src="/res/img/HiBaby/profile_img/user/${fiveRank.i_user }/${fiveRank.profile_img}" alt="">
	                </c:if>
                    <div class="otherInfo">
					<div class="otherNick">${fiveRank.nick}</div>
                        <c:choose>
					    	<c:when test="${fiveRank.totalPoint < 150}">
					    		<img class="otherRankImg" src="/res/img/ion.png" alt="img">
					    	</c:when>
					    	<c:when test="${fiveRank.totalPoint < 400}">
					    		<img class="otherRankImg" src="/res/img/gold.png" alt="img">
					    	</c:when>
					    	<c:when test="${fiveRank.totalPoint < 600}">
					    		<img class="otherRankImg" src="/res/img/dia.png" alt="img">
					    	</c:when>
					    	<c:when test="${fiveRank.totalPoint < 20000}">
					    		<img class="otherRankImg" src="/res/img/master.png" alt="img">
					    	</c:when>
					    	<c:when test="${fiveRank.totalPoint > 20000}">
					    		<img class="otherRankImg" src="/res/img/chall.png" alt="img">
					    	</c:when>
					   	</c:choose>
                        <div>&nbsp;&nbsp;<fmt:formatNumber value="${fiveRank.totalPoint}" pattern="#,###" />p</div>
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
                	<c:forEach items="${otherRank}" var="item"> 
                		<c:set var="i" value="${i+1}" />
	                    <tr class="bodyTr">
	                        <th>${i+5}</th>
	                        <th class="bodyTh">
	                        	<div>${item.nick}</div>
		                        <c:if test="${item.profile_img == null}">
				                	<img class="otherImg" src="/res/img/HiBaby.jpg">
				                </c:if>
				                <c:if test="${item.profile_img != null}">
				                	<img class="otherImg" src="/res/img/HiBaby/profile_img/user/${item.i_user }/${item.profile_img}" alt="">
			               		</c:if>
		               		</th>
		               		
	                        <th class="bodyImg">
	                        	<c:choose>
							    	<c:when test="${item.totalPoint < 150}">
							    		<img class="otherRankImg" src="/res/img/ion.png" alt="img">
							    	</c:when>
							    	<c:when test="${item.totalPoint < 400}">
							    		<img class="otherRankImg" src="/res/img/gold.png" alt="img">
							    	</c:when>
							    	<c:when test="${item.totalPoint < 600}">
							    		<img class="otherRankImg" src="/res/img/dia.png" alt="img">
							    	</c:when>
							    	<c:when test="${item.totalPoint < 20000}">
							    		<img class="otherRankImg" src="/res/img/master.png" alt="img">
							    	</c:when>
							    	<c:when test="${item.totalPoint > 20000}">
							    		<img class="otherRankImg" src="/res/img/chall.png" alt="img">
							    	</c:when>
							   	</c:choose>
	                        </th>
	                        
	                        <th><fmt:formatNumber value="${item.totalPoint}" pattern="#,###" />p</th>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        
        
		<div class="height"></div>

    </div>
	 
</body>
</html>