package com.jy.hibaby.user;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.jy.hibaby.user.model.UserDMI;
import com.jy.hibaby.user.model.UserPARAM;
import com.jy.hibaby.user.model.UserVO;


public interface UserMapper {
	
	int insUser(UserVO param);
	
	UserDMI selUser(UserPARAM param);
	
	// 이메일 비번찾기 테스트
	public String getPw(Map<String, Object> paramMap);
	
	public UserPARAM findPw(UserPARAM param);
}
