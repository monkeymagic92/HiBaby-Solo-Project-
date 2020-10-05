package com.jy.hibaby;

public class Const {
	
	public static final String LOGIN_USER = "loginUser"; // 로그인한 유저의 session의 key값
	public static final String MYPAGE_USER = "myPageUser"; // 회원가입후 바로 mypage로 갈때 사용할 session의 key값
	
	
	
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;	// 로그인성공 (참고 : UserService)
	public static final int NO_ID = 2;	// 아이디 없을시 2번값 반환(참고 : UserService)
	public static final int NO_PW = 3; // 비번 없을시 3번값 반환(참고 UserService)
}
