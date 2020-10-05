package com.jy.hibaby.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.hibaby.Const;
import com.jy.hibaby.SecurityUtils;
import com.jy.hibaby.user.model.UserDMI;
import com.jy.hibaby.user.model.UserPARAM;
import com.jy.hibaby.user.model.UserVO;

@Service
public class UserService {
	
	@Autowired
	private UserMapper mapper;
	
	
	
	// SUCCESS:로그인 성공,  NO_ID:아이디 없음,  NO_PW:비번 틀림
	public int login(UserPARAM param) {
		if(param.getUser_id().equals("")) {
			return Const.NO_ID;
		}
		UserDMI dbUser = mapper.selUser(param);
		
		if(dbUser == null) {
			return Const.NO_ID;
		}
		
		String cryptPw = SecurityUtils.getEncrypt(param.getUser_pw(), dbUser.getSalt());
		if(!cryptPw.equals(dbUser.getUser_pw())) {return Const.NO_PW;}
		
		param.setUser_pw(null);
		param.setNm(dbUser.getNm());
		param.setI_user(dbUser.getI_user());
		param.setProfile_img(dbUser.getProfile_img());
		return Const.SUCCESS;
		
	}



	
	// 회원가입  (10.4 현재 정상적으로 진행됨)
	public int join(UserVO param) {
		String pw = param.getUser_pw();
		String salt = SecurityUtils.generateSalt();
		String cryptPw = SecurityUtils.getEncrypt(pw, salt);
		
		param.setSalt(salt);
		param.setUser_pw(cryptPw);
		
		return mapper.insUser(param);
	}
}
