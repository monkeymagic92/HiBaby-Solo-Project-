<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HiBaby</title>
<!--  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">-->
<style>
</style>
</head>
<style>
body {
	background-color: #fff7ed;
	font-family: 'Nerko One', cursive;
}

ul {
	list-style-type: none;
	margin: 0;
	padding-left: 0;
}
p {
	font-size: 15px;
}
a {
	text-decoration: none;
	font-size: 15px;
}
	a:hover {
		text-decoration: underline;
	}

	.scnd-font-color {
		color: #9099b7;
	}
/* header 위치 관련 */
.horizontal-list {
	margin: 0;
	padding: 0;
	list-style-type: none;
}
	.horizontal-list li {
		float: left;
	}
.clear {
	clear: both;
}
.icon {
	font-size: 25px;
}
/* 프로필 이미지 사진관련 */
.profile-picture {
	border-radius: 100%;
	overflow: hidden;
	-webkit-box-sizing: content-box;
  	-moz-box-sizing: content-box;
  	box-sizing: content-box;	
}
.big-profile-picture {
    margin: 0 auto;		
    border: 5px solid #50597b;
    width: 150px;
    height: 150px;
}
.small-profile-picture {
    border: 2px solid #50597b;
    width: 40px;
    height: 40px;
}
/** MAIN CONTAINER **/
.main-container {
	font-family: 'Ubuntu', sans-serif;
	width: 1080px;
	height: 850px;
	margin: 2em auto;
}	
.button {
	display: block;
	width: 175px;
	line-height: 50px;
	font-size: 16px;
	font-weight: 700;
	text-align: center;
	margin: 0 auto;
	border-radius: 5px;
	-webkit-transition: background .3s;
	transition: background .3s;
}
.button:hover {
	text-decoration: none;
}
	/*********************************************** HEADER ***********************************************/
	header {
		height: 90px;
        
	}
	.header-menu {
	font-size: 17px;
	line-height: 80px;
	}
	.header-menu li {
		position: relative;
		
	}
	.header-menu-tab {
		padding: 0 27px;
		display: block;
		line-height: 90px;
		font-size: 17px;
		-webkit-transition: background .3s;
		transition: background .3s;
	}
		.header-menu-tab:hover {
			
			text-decoration: none;
		}
		.header-menu-tab .icon {
			padding-right: 15px;
		}
	.header-menu-number {
		position: absolute;
		line-height: 22px;
		padding: 0 6px;
		font-weight: 700;
		background: #e64c65;
		border-radius: 100%;
		top: 18px;
		right: 2px;
		-webkit-transition: all .3s linear;
		transition: all .3s linear;
		
	}
	.header-menu li:hover .header-menu-number {
		text-decoration: none;
		-webkit-transform: rotate(360deg);
		transform: rotate(360deg);
	}
	.profile-menu {
		float: right;
		height: 90px;
		padding-right: 20px;
	}
	.profile-menu p {
		font-size: 17px;
		display: inline-block;
		line-height: 90px;
		margin: 0;
		padding-right: 15px;
	}
	.profile-menu a {
		padding-left: 5px;
		width: 50px;
	}
	.profile-menu a:hover {
		text-decoration: none;
		width: 50px;
	}
	.small-profile-picture {
		display: inline-block;
		vertical-align: middle;				
		
	}
	/** CONTAINERS **/
	.container {
		float: left;
		width: 300px;
	}
	.block {
		
		margin-bottom: 25px;
		background: pink;
		border-radius: 5px;
	}
		
#aa {
    margin-left: 160px;
}
#HiBabyLogo {
    font-size: 1.7em;
	
}
#dropdownMenuButton{
	cursor: pointer;
}
.pimg {
	width:50px;
    height: 50px;
    margin-top: 20px;
	border-radius: 140px;
    cursor:pointer;
}
.dropdown-menu {
	margin-top: 32px;
	margin-left: 16px;
}
#logOutA{
	cursor: pointer;
}
.spanli {
    color: white;
}

#marginLefta {
	margin-left: 550px;
}



.nav .button-dropdown {
    position: relative;
}

.nav li a {
    display: block;
    color: #333;
    
   
    
}

.nav li a span {
    display: inline-block;
    margin-left: 5px;
    font-size: 10px;
    color: #999;
}

.nav li a:hover, .nav li a.dropdown-toggle.active {
    
    color: #fff;
}

.nav li a:hover span, .nav li a.dropdown-toggle.active span {
    color: red;
}

.nav li .dropdown-menu {
    display: none;
    position: absolute;
    left: 0;
    padding: 0;
    margin: 0;
    margin-top: 3px;
    text-align: left;
}

.nav li .dropdown-menu.active {
    display: block
    
}

.nav li .dropdown-menu a {
    margin-top: 30px;
    margin-right: 30px;
    background-color:  #fff7ed;
    width: 150px;
    text-align: center;
}

#HiBabyLogo {
	color: white;
}

</style>
<body>
	<div class="main-container">
        <!-- HEADER -->
        <header class="block">
            <ul class="header-menu horizontal-list">
                <li>
                    <a class="header-menu-tab" href="/index/select"><span class="icon entypo-cog scnd-font-color"></span><span id="HiBabyLogo">HiBaby</span></a>
                </li>
                <li>
                    <a id="marginLefta" class="header-menu-tab" href="#1"><span class="icon entypo-cog scnd-font-color"></span><span class="spanli">이동하기</span></a>
                </li>
                
                <li>
                    <a id="marginRighta" class="header-menu-tab" href="#3"><span class="icon fontawesome-envelope scnd-font-color"></span><span class="spanli">쪽지함</span></a>
                    <a class="header-menu-number">5</a>
                </li>
                
            </ul>
            <div class="profile-menu">
            	<ul class="nav">
                    <li class="button-dropdown">
                        <a href="javascript:void(0)" class="dropdown-toggle">
                        	<c:if test="${loginUser.profile_img != null}">
                        		<img class="pimg" src="/res/img/HiBaby/profile_img/user/${loginUser.i_user }/${loginUser.profile_img}" class="profileImg">
                        	</c:if>
                        	<c:if test="${loginUser.profile_img == null}">
                        		<img class="pimg" src="/res/img/HiBaby.jpg" class="profileImg">
                        	</c:if>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                              <a href="/user/myPage">
                                                                마이페이지
                              </a>
                            </li>
                            <li>
                              <a href="#">
                                Drop Item 2
                              </a>
                            </li>
                            <li>
                              <a href="#">
                                Drop Item 3
                              </a>
                            </li>
                            <li>
                            <hr>
                              <a href="#" onclick="logOut()">
                                                                로그아웃
                              </a>
                            </li>
                          </ul>
                    </li>
                </ul>
			</div>			
        </header>
        
        <div class="includeContainer">
	    	<jsp:include page="/WEB-INF/views/${view}.jsp"></jsp:include>
  		</div>
  		
  		
  		
  		<!-- FOOTER -->
  		
	</div>
	
  	
  	

	<!-- 
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
	 -->
	

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	//로그아웃
	function logOut() {
		if(confirm('로그아웃 하시겠습니까?')) {
			location.href="/user/logout"	
		}
	}
	
	
	// dropdown 
	jQuery(document).ready(function (e) {
	    function t(t) {
	        e(t).bind("click", function (t) {
	            t.preventDefault();
	            e(this).parent().fadeOut()
	        })
	    }
	    e(".dropdown-toggle").click(function () {
	        var t = e(this).parents(".button-dropdown").children(".dropdown-menu").is(":hidden");
	        e(".button-dropdown .dropdown-menu").hide();
	        e(".button-dropdown .dropdown-toggle").removeClass("active");
	        if (t) {
	            e(this).parents(".button-dropdown").children(".dropdown-menu").toggle().parents(".button-dropdown").children(".dropdown-toggle").addClass("active")
	        }
	    });
	    e(document).bind("click", function (t) {
	        var n = e(t.target);
	        if (!n.parents().hasClass("button-dropdown")) e(".button-dropdown .dropdown-menu").hide();
	    });
	    e(document).bind("click", function (t) {
	        var n = e(t.target);
	        if (!n.parents().hasClass("button-dropdown")) e(".button-dropdown .dropdown-toggle").removeClass("active");
	    })
	});
</script>
</body>
</html>