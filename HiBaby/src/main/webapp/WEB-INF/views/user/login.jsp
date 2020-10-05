<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 로그인 페이지 css --%>
</head>
<body>
    <div id="login-button">
        <img src="https://dqcgrsy5v35b9.cloudfront.net/cruiseplanner/assets/img/icons/login-w-icon.png"></img>
    </div>
    <div id="container">
        <span class="close-btn">
            <img src="https://cdn4.iconfinder.com/data/icons/miu/22/circle_close_delete_-128.png"></img>
        </span>
         
        
        <form id="frm" class="box" action="/user/login" method="post">
            <h1>Login</h1>
            <input type="text" name="user_id" placeholder="아이디">
            <input type="password" name="user_pw" placeholder="비밀번호">
            <input type="submit" value="로그인">
        </form>        
    </div> 
</body>
<script>
window.onload = function() {
	frm.user_id.focus();
}
	
if(${data != null}) {
	alert('${data}');
	frm.user_id.focus();
}
</script>
</html>