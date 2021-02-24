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
<!-- <link rel="icon" href="data:;base64,iVBORw0KGgo=">  favico 에러 제거 -->
<link rel="shortcut icon" type="image/x-icon" href="/res/img/HiBabyLogo.ico">
</head>
<style>
	.modal {
    display: none;
    position: fixed;
    z-index: 1; 
    left: 0;
    top: -200px;
    width: 100%; 
    height: 100%; 
    overflow: auto; 
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 15% auto; 
    padding: 20px;
    border: 1px solid #888;
    width: 50%;        
    text-align: center;                   
}
.pop_bt {
	margin-top: 30px;
	margin-left: 70px;
	width: 200px;
	text-align: center;
	cursor: pointer;
}

.introBtn {
	cursor: pointer;
}
</style>
<body>
	<nav role="navigation">
        <div id="menuToggle" class="animate__flash animate__animated">  
            <input type="checkbox" />
            	
                <span></span>
                <span></span>
                <span></span>
                
            <ul id="menu">
                <li><a href="/user/login">로그인</a></li>
                <li><a href="/user/join">회원가입</a></li>
                <li><a href="/user/findId">아이디 찾기</a></li>
                <li><a href="/user/findPw">비밀번호 찾기</a></li>
                <li><hr></li>
                <li class="introBtn"><a class="introBtn" onclick="showIntro()">HiBaby 프로젝트 소개</a></li>
                <li><a href="https://github.com/monkeymagic92" target="_blank">Github 둘러보기</a></li>
                <li><a href="https://blog.naver.com/ddw0099" target="_blank">blog 둘러보기</a></li>
                <li><a href="https://monkeydvl.tistory.com/" target="_blank">tistory 둘러보기</a></li>
                <li><a href="http://ddmarket.ga:8080/index/main" target="_blank">TeamProject 단디마켓</a></li>
                <li><a href="http://118.67.132.252:8080/" target="_blank">aboutMe 프로젝트</a></li>
            </ul>
        </div>
    </nav>
    
    <div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
		    <h2>HiBaby Introduce..</h2>
		    
            <!-- Modal body -->
		    <div class="modal-body">
		    	<div>
					HiBaby 개발을 하게된 이재용 개발자 입니다.<br><br>
					
					HiBaby를 개발하게된 계기는 제가 개발길을 처음 걷게된 시기때 아무것도 모르던 시절<br>
					내가 프로그램을 만들수있다면 이런걸 만들고싶다란 프로그램중 하나가 지금의 HiBaby 입니다.<br><br>
					
					제가 추후 결혼을하고 자식을낳고 아버지가 되었을때 아버지로서 내가 자식에게 내 재능을 보여줄수있는<br>
					여러 요소중 하나가 저의 앞으로 평생 분야를 살린 프로그래머로서의 재능입니다.<br><br>
						
					HiBaby는 6~8세 아동들의 시점에 맞추어 동네아이들과 서로 커뮤니티 소통을 나누며<br><br>
					공부 카테고리에서 문제를 풀고 맞추며 포인트를 적립하는 방식으로<br><br>
					추후 누적된 포인트로 캐시백 전환을 하여 부모님께 용돈을 받는 시스템 입니다.<br><br>
					그로인해 자연스럽게 공부와 경제관념을 학습하며<br><br>
					세상 돈버는것이 쉽지않다란 개념을 심어주고<br><br>
					굳이 비싼돈 들여가며 어릴때부터 학원, 과외를 안시켜도 되는 두마리 토끼를 잡는 시스템입니다.<br><br>
					
					- 12.2 10:30am 이재용 올림 -
		    	</div>
		    </div>
		    
		    <!-- Modal bottom -->
		    <button type="button" class="pop_bt" onclick="hideModal()">종료</button>
		</div>
    </div>
    
    
    
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
	
	function showIntro() {
		$('#myModal').show();
	}
	
	// 모달창 종료
	function hideModal() {
		myModal.style.display = 'none'
	}
</script>
</html>