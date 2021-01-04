<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HiBaby</title>
<link rel="stylesheet" href="/res/css/defaultTemp.css">
</head>
<body>
	<div class="main-container">
       <header class="main-header">
            <ul class="header-ul">
                <li><a class="li-a1" href="/index/select"><span id="li1">HiBaby</span></a></li>
                <li><a class="li-a2" href="#"><span id="li2">이동하기</span></a></li>
                <li>
                    <span id="li3">쪽지함</span> 
                    <!-- span으로 쪽지함 ! 나타나게 하기 -->
                </li>
                <li>
                    <div class="dropdown">
                        <button class="dropbtn">
                            <c:if test="${loginUser.profile_img != null}">
                        		<img class="drop-img" src="/res/img/HiBaby/profile_img/user/${loginUser.i_user }/${loginUser.profile_img}" class="profileImg">
                        	</c:if>
                        	<c:if test="${loginUser.profile_img == null}">
                        		<img class="drop-img" src="/res/img/HiBaby.jpg" class="profileImg">
                        	</c:if>
                        </button>
                        <div class="dropdown-content">
                          <a href="/user/myPage">마이페이지</a>
                          <div class="hrDiv">
                              <hr>
                          </div>
                          <a href="#" onclick="logOut()">로그아웃</a>
                        </div>
                    </div>
                </li>
            </ul>
       </header>
       
        <div class="includeContainer">
	    	<jsp:include page="/WEB-INF/views/${view}.jsp"></jsp:include>
 		</div>
    </div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	//로그아웃
	function logOut() {
		if(confirm('로그아웃 하시겠습니까?')) {
			location.href="/user/logout"	
		}
	}

</script>
</body>
</html>