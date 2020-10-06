package com.jy.hibaby.user;

import com.jy.hibaby.user.model.UserDMI;
import com.jy.hibaby.user.model.UserPARAM;
import com.jy.hibaby.user.model.UserVO;


public interface UserMapper {
	
	int insUser(UserVO param);
	
	UserDMI selUser(UserPARAM param);
	
	UserDMI findPwChk(UserPARAM param);

}
