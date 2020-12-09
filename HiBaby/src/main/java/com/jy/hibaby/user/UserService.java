package com.jy.hibaby.user;


import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jy.hibaby.Const;
import com.jy.hibaby.FileUtils;
import com.jy.hibaby.PointVO;
import com.jy.hibaby.SecurityUtils;
import com.jy.hibaby.TimeMaximum;
import com.jy.hibaby.user.model.UserDMI;
import com.jy.hibaby.user.model.UserPARAM;
import com.jy.hibaby.user.model.UserVO;

@Service
public class UserService {
	
	@Autowired
	private UserMapper mapper;

	// 이메일 체크
	public int emailChk(UserPARAM param, HttpSession hs) {
		
		UserDMI dbUser = mapper.emailChk(param);
		
		if(dbUser == null) {
			return 1; 
		}		
		
		if(dbUser.getEmail().equals(param.getEmail())) {
			return 2;		
		}		
		
		return 0;
	}
	
	// 닉네임 체크
	public int nickChk(UserPARAM param) {
		
		UserDMI dbUser = mapper.nickChk(param);
		
		if(dbUser == null) {
			return 1;
		}
		
		if(dbUser.getNick().equals(param.getNick())) {
			return 2;
		}
		
		return 0;
	}
		
		
	// SUCCESS 1:로그인 성공,  NO_ID 2:아이디 없음,  NO_PW 3:비번 틀림
	public int login(UserPARAM param) {
		if(param.getUser_id().equals("")) {
			return Const.BLANK_ID; 
		}
		UserDMI dbUser = mapper.selUser(param);
		
		if(dbUser == null) {
			return Const.NO_ID; 
		} 
						
		String cryptPw = SecurityUtils.getEncrypt(param.getUser_pw(), dbUser.getSalt());
		if(!cryptPw.equals(dbUser.getUser_pw())) {return Const.NO_PW;} // 3
		
		param.setI_user(dbUser.getI_user());
		param.setUser_pw(null);
		param.setNm(dbUser.getNm());
		param.setNick(dbUser.getNick());
		param.setEmail(dbUser.getEmail());
		param.setProfile_img(dbUser.getProfile_img());
		param.setSm(dbUser.getSm());
		param.setMyPoint(dbUser.getMyPoint());
		param.setMyCash(dbUser.getMyCash());
		param.setR_dt(dbUser.getR_dt());
		param.setM_dt(dbUser.getM_dt());
		
		return Const.SUCCESS;
	}

	public UserPARAM selUserInfo(UserPARAM param) {
		return mapper.selUserInfo(param);
	}
	
	// 회원가입
	public int joinUser(UserVO param) {
		String pw = param.getUser_pw();
		String salt = SecurityUtils.generateSalt();
		String cryptPw = SecurityUtils.getEncrypt(pw, salt);
		
		param.setSalt(salt);
		param.setUser_pw(cryptPw);
		
		return mapper.joinUser(param);
	}
	
	
	// 비밀번호 찾기  1. 아디,이멜 검사
	public int findPw (UserPARAM param, HttpSession hs) {
		UserDMI dbUser = mapper.findPwChk(param);
		
		if(dbUser == null) { return Const.FAIL; }
		
		if(dbUser.getUser_id().equals(param.getUser_id())
				&& dbUser.getEmail().equals(param.getEmail())) {
			
			hs.setAttribute("i_user", dbUser.getI_user());
			return Const.SUCCESS;
		} else {
			return Const.FAIL;
		}
	}
		
	
	// 비밀번호 변경 (이메일 인증코드 받을시)
	public int changePw(UserPARAM param) {
		String pw = param.getUser_pw();
		String salt = SecurityUtils.generateSalt();
		String cryptPw = SecurityUtils.getEncrypt(pw, salt);
		
		param.setSalt(salt);
		param.setUser_pw(cryptPw);
		
		int result = mapper.changePw(param);
		return result; 
	}
	
	// info페이지에서 비밀번호 변경
	public int infoChangepw(UserPARAM param) {
		int result = 0;
		
		UserDMI dbUser = mapper.selDetailUser(param);
		String cryptPw = SecurityUtils.getEncrypt(param.getUser_pw(), dbUser.getSalt());
		
		if(dbUser.getUser_pw().equals(cryptPw)) {
			result = 1;
			return result;
		} else {
			return result;
		}
	}
	
	
	// 아이디 찾기
	public int findId(UserPARAM param, HttpSession hs) {
		UserDMI dbUser = new UserDMI();
		dbUser = mapper.findId(param);
		
		if(dbUser == null) {
			return Const.FAIL;
		} else {
			hs.setAttribute("user_id", dbUser.getUser_id());
			return Const.SUCCESS;
		}		 
	}
	
	// 프로필사진 등록
	public String insUserProfileImg(MultipartHttpServletRequest mReq, UserVO vo) {
		
		int i_user = SecurityUtils.getLoginUserPk(mReq.getSession());
		//String path = mReq.getServletContext().getRealPath("") +  "resources/img/profile_img/user/" + i_user + "/"; 원래 원본 (잘될때 코드) 
		String path = mReq.getServletContext().getRealPath("") +  "resources/img/HiBaby/profile_img/user/" + i_user + "/"; // dd,hibaby 구분짓기위해
		
		File file = new File(path + vo.getProfile_img());
		
		System.out.println("파일경로 : " + file);
		
		if(file.exists()) {
			file.delete();	
		} 
		
		MultipartFile fileList = mReq.getFile("user_profile_img");
		
		
		System.out.println("------------");
		System.out.println(fileList);
		System.out.println("------------");
		
		File dir = new File(path);		
		if(!dir.exists()) {  
			dir.mkdirs(); 
		}
		
		// String oldFile = path;		
				
		System.out.println("사진저장주소  : " + path);
		
		String originFileNm = fileList.getOriginalFilename(); 
		String ext = FileUtils.getExt(originFileNm); 
		String saveFileNm = UUID.randomUUID() + ext; 
				
		//vo.setProfile_img(saveFileNm);
		//vo.setI_user(i_user);
				
		try {
			fileList.transferTo(new File(path + saveFileNm));
			vo.setI_user(i_user);
			vo.setProfile_img(saveFileNm);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		mapper.insProfile_img(vo);
		
		return saveFileNm;
	}
	
	// 프로필사진 삭제
	public int delUserProfileImg(int i_user) {
		mapper.delImg(i_user);
		return 1;
	}	 
	
	// 유저정보 변경
	public int userInfoChange(UserPARAM param) {
		return mapper.userInfoChange(param);
	}
	
	// Study에서 문제 맞췄을경우 포인트 적립
	public int updPoint(PointVO vo) {
		return mapper.updPoint(vo);
	}
	
	// t_user 포인트 변환시 업데이트 메소드
	public int updMyPoint(UserPARAM param) {
		return mapper.updMyPoint(param);
	}
	
	// t_myPoint 에 전환 내역 담는 매소드
	public int insMyPointPage (PointVO vo) {
		return mapper.insMyPointPage(vo);
	}
	
	// pointMall 환급내역 조회
	public List<PointVO> selPointMall(UserPARAM param) {
		return mapper.selPointMall(param);
	}
	
	// ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ
	
	
	public UserDMI selDetailUser(UserPARAM param) {
		UserDMI dbUser = mapper.selDetailUser(param);
		return transVoR_dt(dbUser);
	}
	
	//등록일자 변경 메소드
	public static UserDMI transVoR_dt(UserDMI param) {
		String paramR_dt = param.getR_dt();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		try {
			date = sdf.parse(paramR_dt);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		String strR_dt = TimeMaximum.calculateTime(date);
		param.setR_dt(strR_dt);
		
		return param;
	}
		
	
	
	
}
