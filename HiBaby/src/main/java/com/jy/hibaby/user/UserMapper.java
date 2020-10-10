package com.jy.hibaby.user;

import com.jy.hibaby.user.model.UserDMI;
import com.jy.hibaby.user.model.UserPARAM;
import com.jy.hibaby.user.model.UserVO;


public interface UserMapper {
	// select
	UserDMI selUser(UserPARAM param); // 해당유저 전체 컬럼값
	
	UserDMI findPwChk(UserPARAM param); // 비밀번호 변경전 입력정보 체크
	
	UserDMI findId(UserPARAM param); // 아이디 찾기
	
	UserDMI emailChk(UserPARAM param);
	
	int insEmail(UserPARAM param);
		
	
	
	// update 
	int changePw(UserPARAM param); // 비밀번호 변경
	
	int joinUser(UserVO param); // 회원가입
	
	
	
	// delete 
	
	
	
	

}
