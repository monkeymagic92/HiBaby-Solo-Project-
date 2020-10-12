<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모달테스트</title>
</head>
<style>
	.modal {
	    display: none;
	    position: fixed;
	    z-index: 1; 
	    left: 0;
	    top: 0;
	    width: 100%; 
	    height: 100%; 
	    overflow: auto; 
	    background-color: rgb(0,0,0); 
	    background-color: rgba(0,0,0,0.4); 
	}
	
	/* Modal Content/Box */
	.modal-content {
	    background-color: #fefefe;
	    margin: 15% auto; 
	    padding: 20px;
	    border: 1px solid #888;
	    width: 30%;                           
	}
	.pop_bt {
		margin-top: 30px;
		width: 200px;
		text-align: center;
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
		      <c:if test="${cerCodeCount == null }">
		      	<div></div>
		      </c:if>
		      <c:if test="${cerCodeCount > 0 }">
		      	<div id="cerCodeCount">${cerCodeCount }회 실패</div>
		      </c:if>
		      
		      <!-- Modal body -->
		    <div class="modal-body">
		    	<form id="frm" action="/user/cerCode" method="post" onsubmit="return chk()">
		    		<input type="text" name="cerCode" placeholder="코드입력">
		    		<input type="submit" value="확인">
		    	</form>
		    </div>
		    
		    <!-- Modal bottom -->
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
window.onload = function() {
	alert('입력하신 메일로 인증코드가 발송되었습니다');
	var url = "https://www.naver.com";
	var name = "비밀번호찾기 인증코드";
	var option = "width = 980, height = 830, top = 100, left = 200, location = no";
	var win = window.open(url, name, option);
}
	
	if(${cerCodeMsg != null}) {
		alert('${cerCodeMsg}');
	}
	
	
	function moveToLogin() {
		location.href="/user/login";
	}
		
	
	jQuery(document).ready(function() {
	    $('#myModal').show();
	});
	
	function close_pop(flag) {
	 $('#myModal').hide();
	}
	
	function chk() {
		if(frm.cerCode.value.length > 6) {
			alert('인증코드 6자리를 입력해주세요');
			frm.cerCode.value = '';
			return false;
		}
	}
	
	
</script>
</html>