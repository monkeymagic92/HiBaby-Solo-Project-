package com.jy.hibaby.user;

import org.apache.ibatis.annotations.Mapper;

import com.jy.hibaby.user.model.UserDMI;
import com.jy.hibaby.user.model.UserPARAM;
import com.jy.hibaby.user.model.UserVO;

@Mapper
public interface UserMapper {
	// select
	UserDMI selUser(UserPARAM param); 	// 해당유저 전체 컬럼값
	
	UserDMI findPwChk(UserPARAM param); // 비밀번호 변경전 입력정보 체크
	
	UserDMI findId(UserPARAM param);	// 아이디 찾기
	
	UserDMI emailChk(UserPARAM param);	// 이메일 중복체크
	
	UserDMI nickChk(UserPARAM param);	// 닉네임 중복체크
	
	UserPARAM selUserInfo(UserPARAM param); // n번 유저의 정보
	
	
	// isnert
	int joinUser(UserVO param);		// 회원가입
	
	
	
	// update 
	int changePw(UserPARAM param);	// 비밀번호 변경
	
	int insProfile_img(UserVO vo); 	  // 프로필사진 등록
	
	int userInfoChange(UserPARAM param);	// 유저정보 변경
	
	
	
	// delete 
	
	int delProfile_img(UserPARAM param); // 프로필 사진 삭제
	
	int delImg(int i_user);
	
}
