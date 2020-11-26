<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HiBaby</title>
<style>
	#navDefaultTemp {
		height: 65px;
		margin-top: 15px;
		border-radius: 5px;
		width: 1050px;
	}
	.navContainer {
		margin: 0 auto;
		width: 1050px;	
					
	}
	.profileImg {
		width: 30px;
		border-radius: 40px;
	}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
</head>
<body>
	<div class="navContainer">
		<nav id="navDefaultTemp">
		    <div id="navWrapperId" class="nav-wrapper">
		        <a href="/index/select" class="brand-logo">&nbsp;&nbsp; HiBaby</a>
		        <ul class="right hide-on-med-and-down">
   		            <li><a href="#">???</a></li>
		            <li><a href="#">쪽지(아이콘넣기)</a></li>
		            <li>
		            	<c:if test="${loginUser.profile_img != null}">
		            		<a href="/user/myPage"><img src="/res/img/HiBaby/profile_img/user/${loginUser.i_user }/${loginUser.profile_img}" class="profileImg"></a>
			            </c:if>
			            <c:if test="${loginUser.profile_img == null}">
			            	<a href="/user/myPage"><img src="/res/img/lion.jpg" class="profileImg"></a>
			            </c:if>
		            </li>
		        </ul>
		    </div>
	  	</nav>
	</div>
    <jsp:include page="/WEB-INF/views/${view}.jsp"></jsp:include>
  	
<script>

</script>
</body>
</html>