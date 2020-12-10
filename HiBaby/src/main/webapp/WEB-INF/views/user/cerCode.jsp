<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모달테스트</title>
<link rel="stylesheet" href="/res/css/cerCode.css">
</head>
<body>
	<div id="myModalCer" class="modal">
 
		<!-- Modal content -->
		<div class="modal-content">
              <h1>HiBaby</h1>
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
		    		<input id="cerCodeIns" type="text" name="cerCode" placeholder="코드입력">
		    		<input id="submitIns" type="submit" value="확인">
		    	</form>
		    </div>
		    
		    <!-- Modal bottom -->
		    <div class="modal-bottom">
				
		    </div>
		    <button type="button" class="pop_bt" onclick="moveToLogin()">
					종료
			</button>
		</div>
    </div>
</body>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
window.onload = function() {
	alert('입력하신 메일로 인증코드가 발송되었습니다');
	var url = "https://www.naver.com";
	var name = "비밀번호찾기 인증코드";
	var option = "width = 980, height = 830, top = 100, left = 200, location = yes";
	var win = window.open(url, name, option);
}
	
	if(${cerCodeMsg != null}) {
		alert('${cerCodeMsg}');
	}
	
	
	function moveToLogin() {
		location.href="/user/login";
	}
		
	
	jQuery(document).ready(function() {
	    $('#myModalCer').show();
	});
	
	function close_pop(flag) {
	 $('#myModalCer').hide();
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