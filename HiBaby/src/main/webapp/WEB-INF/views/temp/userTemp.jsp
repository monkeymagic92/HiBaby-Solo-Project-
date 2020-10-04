<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HiBaby</title>
<link rel="stylesheet" type="text/css" href="/res/css/user/user.css">
</head>
<body>
	<nav role="navigation">
        <div id="menuToggle">         
            <input type="checkbox" />
                <span></span>
                <span></span>
                <span></span>
            <ul id="menu">
                <a href="/user/login"><li>로그인</li></a>
                <a href="/user/join"><li>회원가입</li></a>
                <a href="#"><li>아이디 찾기</li></a>
                <a href="#"><li>비밀번호 찾기</li></a>
                <a href="https://github.com/monkeymagic92" target="_blank"><li>제작자 Github 둘러보기</li></a>
            </ul>
        </div>
    </nav>
    
    <!-- 로그인, 비밀번호찾기, 아이디찾기 등 include  -->
	<jsp:include page="/WEB-INF/views/${view}.jsp"></jsp:include>
</body>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

	// 회원가입시 에러났을경우 알림창 띄우는 기능
	if(${joinErrMsg != null}) {
		alert('${joinErrMsg}');
	}	
	
	
	// 로그인 버튼 효과 기능
	$('#login-button').click(function(){
	    $('#login-button').fadeOut("slow",function(){
	        $("#container").fadeIn();
	    });
	});
</script>
</html>