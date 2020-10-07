package com.jy.hibaby.user;

import com.jy.hibaby.user.model.UserDMI;
import com.jy.hibaby.user.model.UserPARAM;
import com.jy.hibaby.user.model.UserVO;


public interface UserMapper {
	
	UserDMI selUser(UserPARAM param); // 해당유저 전체 컬럼값
	
	UserDMI findPwChk(UserPARAM param); // 비밀번호 변경전 입력정보 체크
	
	int insUser(UserVO param); // 회원가입
		
	
	
	// update 
	int changePw(UserPARAM param); // 비밀번호 변경
	
	
	
	// delete 
	
	
	
	

}
