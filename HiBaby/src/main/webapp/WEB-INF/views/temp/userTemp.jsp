<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HiBaby</title>
<link rel="stylesheet" type="text/css" href="/res/css/animate.css">
<link rel="stylesheet" type="text/css" href="/res/css/userTemp.css">
</head>
<body>
	<nav role="navigation">
        <div id="menuToggle" class="animate__flash animate__animated fas fa-check">  
            <input type="checkbox" />
            	<!-- 아이콘으로 변경하기 -->
                <span></span>
                <span></span>
                <span></span>
            
            
            <ul id="menu">
                <li><a href="/user/login">로그인</a></li>
                <li><a href="/user/join">회원가입</a></li>
                <li><a href="/user/findId">아이디 찾기</a></li>
                <li><a href="/user/findPw">비밀번호 찾기</a></li>
                <li><hr></li>
                <li><a href="#" target="_blank">HiBaby 프로젝트 소개</a></li>
                <li><a href="https://github.com/monkeymagic92" target="_blank">제작자 Github 둘러보기</a></li>
                <li><a href="https://blog.naver.com/ddw0099" target="_blank">제작자 blog 둘러보기</a></li>
                <li><a href="http://ddmarket.ga:8080/index/main" target="_blank">TeamProject 단디마켓</a></li>
            </ul>
        </div>
    </nav>
    
    <!-- 로그인, 비밀번호찾기, 아이디찾기 등 include  -->
    <main>
    	<section>
			<jsp:include page="/WEB-INF/views/${view}.jsp"></jsp:include>
		</section>
	</main>
</body>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

	// 회원가입시 에러났을경우 알림창 띄우는 기능
	if(${msg != null}) {
		alert('${msg}');
	}	
	
	// 회원가입시 상세등록을 바로할것인지? 아니면 로그인할것인지..
	if(${insMyPage != null}) {
		if(confirm('상세정보를 등록하시겠습니까 ?')) {
			location.href="/user/myPage";
		} else {
			location.href="/user/login";
		}
	}
	
	
	// 로그인 박스 효과 기능
	$('#login-button').click(function(){
	    $('#login-button').fadeOut("slow",function(){
	        $("#container").fadeIn();
	    });
	});
</script>
</html>