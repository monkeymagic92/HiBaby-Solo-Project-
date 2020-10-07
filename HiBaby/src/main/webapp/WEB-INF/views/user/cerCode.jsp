<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모달테스트</title>
</head>
<style>
	
	.modal {
	    display: none; /* Hidden by default */
	    position: fixed; /* Stay in place */
	    z-index: 1; /* Sit on top */
	    left: 0;
	    top: 0;
	    width: 100%; /* Full width */
	    height: 100%; /* Full height */
	    overflow: auto; /* Enable scroll if needed */
	    background-color: rgb(0,0,0); /* Fallback color */
	    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	/* Modal Content/Box */
	.modal-content {
	    background-color: #fefefe;
	    margin: 15% auto; /* 15% from the top and centered */
	    padding: 20px;
	    border: 1px solid #888;
	    width: 30%; /* Could be more or less, depending on screen size */                          
	}
	.pop_bt {
		cursor: pointer;
	}
	
	#cerCodeCount {
		color: red;
	}
</style>
<body>
	<div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
            <h2>인증번호를 입력해 주세요</h2>
            <div id="cerCodeCount">
            	${cerCodeCount } 회 실패 ! (5회 틀릴시 팅김)
            </div>
            
            <!-- Modal body -->
            <div class="modal-body">
            	<form id="frm" action="/user/cerCode" method="post" onsubmit="return chk()">
            		<input type="text" name="cerCode" placeholder="코드입력">
            		<input type="hidden" name="authKey" value="${authKey }">
            		<input type="submit" value="확인">
            	</form>
            </div>
            
            <!-- Modal bottom -->
            <!--  <div class="modal-bottom" onclick="close_pop()"> -->
            <div class="modal-bottom" onclick="moveToLogin()">
                <button type="button" class="pop_bt">
             		 종료
                </button>
            </div>
      </div>
    </div>
</body>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	
	if(${cerCodeMsg != null}) {
		alert('${cerCodeMsg}');
		location.href="/user/cerCode";
	}
	
	function moveToLogin() {
		location.href="/user/login";
	}
	
	
	function chk() {
		if(frm.cerCode.value.length == 0) {
			alert('인증번호를 입력해 주세요');
			frm.cerCode.focus();
			return false();
		}
		
		if(frm.cerCode.value.length < 6) {
			alert('인증번호 6자리를 입력해 주세요');
			frm.cerCode.focus();
			return false();
		}
	}
	
	jQuery(document).ready(function() {
	    $('#myModal').show();
	});
	
	function close_pop(flag) {
	 $('#myModal').hide();
	};
</script>
</html>