<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
	.material-icons {
  font-family: 'Material Icons';
  font-weight: normal;
  font-style: normal;
  font-size: 24px;  /* Preferred icon size */
  display: inline-block;
  line-height: 1;
  text-transform: none;
  letter-spacing: normal;
  word-wrap: normal;
  white-space: nowrap;
  direction: ltr;

  /* Support for all WebKit browsers. */
  -webkit-font-smoothing: antialiased;
  /* Support for Safari and Chrome. */
  text-rendering: optimizeLegibility;

  /* Support for Firefox. */
  -moz-osx-font-smoothing: grayscale;

  /* Support for IE. */
  font-feature-settings: 'liga';
}
</style>

<body>
	<!-- 현재 회원가입후 넘어오는 세션값들
		loginUser는 정상으로 세션박혀있고 
		myPageUser는 세션 지워야됨   (사실 안지워도 크게 문제될건 없어보이는데.. 메모리상 지우자 )
	 -->
	<div>값들 </div>
	<div>${loginUser.user_id }</div>
	<div>${loginUser.nm }</div>
	<div>${loginUser.nick }</div>
	
	<hr>
	<span class="material-icons">close_fullscreen</span>
	<div>${myPageUser.user_id }</div>
	<div>${myPageUser.nm }</div>
</body>
</html>