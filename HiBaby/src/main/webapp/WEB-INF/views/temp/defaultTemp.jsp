<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HiBaby</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<style>

</style>
</head>
<style>

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

h1, h2, p, a, span{
	color: #fff;
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
	width: 950px;
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
	border-radius: 140px;
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


a, a:visited {
	text-decoration:none;
	outline:none;
	color:#54a6de;
}

a:hover{
	text-decoration:underline;
}

section, footer, nav{
	display: block;
}



#colorNav > ul{
	width: 450px; /* Increase when adding more menu items */
	margin:0 auto;
}

#colorNav > ul > li{ /* will style only the top level li */
	list-style: none;
	box-shadow: 0 0 10px rgba(100, 100, 100, 0.2) inset,1px 1px 1px #CCC;
	display: inline-block;
	line-height: 1;
	margin: 1px;
	border-radius: 3px;
	position:relative;
}

#colorNav > ul > li > a{
	color:inherit;
	text-decoration:none !important;
	font-size:24px;
	padding: 25px;
}

#colorNav li ul{
	position:absolute;
	list-style:none;
	text-align:center;
	width:180px;
	left:50%;
	margin-left:-90px;
	top:70px;
	font:bold 12px 'Open Sans Condensed', sans-serif;
	
	/* This is important for the show/hide CSS animation */
	max-height:0px;
	overflow:hidden;
	
	-webkit-transition:max-height 0.4s linear;
	-moz-transition:max-height 0.4s linear;
	transition:max-height 0.8s linear;
}

#colorNav li ul li{
	background-color:#313131;
}

#colorNav li ul li a{
	padding:12px;
	color:#fff !important;
	text-decoration:none !important;
	display:block;
}

#colorNav li ul li:nth-child(odd){ /* zebra stripes */
	background-color:#363636;
}

#colorNav li ul li:hover{
	background-color:#444;
}

#colorNav li ul li:first-child{
	border-radius:3px 3px 0 0;
	margin-top:25px;
	position:relative;
}

#colorNav li ul li:first-child:before{ /* the pointer tip */
	content:'';
	position:absolute;
	width:1px;
	height:1px;
	border:5px solid transparent;
	border-bottom-color:#313131;
	left:50%;
	top:-10px;
	margin-left:-5px;
}

#colorNav li ul li:last-child{
	border-bottom-left-radius:3px;
	border-bottom-right-radius:3px;
}

#colorNav li:hover ul{
	max-height:200px; /* Increase when adding more dropdown items */
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
                    <a id="aa" class="header-menu-tab" href="#1"><span class="icon entypo-cog scnd-font-color"></span><span class="spanli">이동하기</span></a>
                </li>
                <li class="asc">
                    <a class="header-menu-tab" href="#2"><span class="icon fontawesome-user scnd-font-color"></span><span class="spanli">????</span></a>
                </li>
                <li>
                    <a class="header-menu-tab" href="#3"><span class="icon fontawesome-envelope scnd-font-color"></span><span class="spanli">쪽지함</span></a>
                    <a class="header-menu-number">5</a>
                </li>
                <li>
                    <a class="header-menu-tab" href="/user/myPage?i_user=${loginUser.i_user}"><span class="icon fontawesome-star-empty scnd-font-color"></span><span class="spanli">마이페이지</span></a>
                </li>
            </ul>
         
            
            <div class="profile-menu">
                <p><a href="fsdfsda"><span class="entypo-down-open scnd-font-color"></span></a></p>
				<nav id="colorNav">
			        <ul>
			            <li class="yellow">
				            <c:if test="${loginUser.profile_img != null}">
			            		<img class="pimg" src="/res/img/HiBaby/profile_img/user/${loginUser.i_user }/${loginUser.profile_img}" class="profileImg">
				            </c:if>
				            <c:if test="${loginUser.profile_img == null}">
				            	<img class="pimg" src="/res/img/HiBaby.jpg" class="profileImg">
				            </c:if>	
							<ul>
			                    <li><a href="#">Dropdown item 1</a></li>
			                    <li><a href="#">Dropdown item 2</a></li>
			                    <li><a href="#">Dropdown item 2</a></li>
			                    <li><a href="#">Dropdown item 2</a></li>
			                </ul>
			            </li>
			        </ul>
			    </nav>
			</div>			
        </header>
        
        <div class="includeContainer">
	    	<jsp:include page="/WEB-INF/views/${view}.jsp"></jsp:include>
  		</div>
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
	
  	
  	
  	
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
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