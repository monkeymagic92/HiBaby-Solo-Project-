package com.jy.hibaby.user;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jy.hibaby.Const;
import com.jy.hibaby.PointVO;
import com.jy.hibaby.SecurityUtils;
import com.jy.hibaby.ViewRef;
import com.jy.hibaby.mail.MailSendService;
import com.jy.hibaby.mail.model.EmailVO;
import com.jy.hibaby.user.model.UserDMI;
import com.jy.hibaby.user.model.UserPARAM;
import com.jy.hibaby.user.model.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {
	static int cerCodeCount = 0; // 인증코드 틀렸을시 카운트 
		
	@Autowired
	private UserService service;	
	
	@Autowired
	private MailSendService mss; 

	@RequestMapping(value="/intro", method=RequestMethod.GET)
	public String intro(Model model) {
		model.addAttribute("view","/user/intro");
		return ViewRef.USER_TEMP;
	}
	
	// 아이디 중복체크 (aJax) 
	@RequestMapping(value="/ajaxIdChk", method=RequestMethod.POST)
	@ResponseBody	
	public String ajaxIdChk(@RequestBody UserPARAM param, HttpSession hs) {
		
		int result = service.login(param);
		return String.valueOf(result);
	}
	
	
	// 이메일 중복체크(aJax)
	@RequestMapping(value="/ajaxEmailChk", method=RequestMethod.POST)
	@ResponseBody	
	public String ajaxEmailChk(@RequestBody UserPARAM param, HttpSession hs) {
		
		int result = service.emailChk(param, hs);	
		return String.valueOf(result);
	}
	
	// 닉네임 중복체크(aJax)
	@RequestMapping(value="/ajaxNickChk", method=RequestMethod.POST)
	@ResponseBody	
	public String ajaxNickChk(@RequestBody UserPARAM param, HttpSession hs) {
		
		int result = service.nickChk(param);
		
		if(result == 0) {
			System.out.println("result : " + result);
		}
		return String.valueOf(result);
	}
	
	// 로그아웃
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(Model model, HttpSession hs) {
		hs.invalidate();
		return "redirect:/" + ViewRef.USER_LOGIN;
	}
	
	
	//	로그인
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(Model model, HttpServletRequest request) {
		// 로그인이 되어있다면 로그인페이지로 갈수없게 막아놓음 
		// 메소드 다시 만들기  // 또는 인터셉터에서 추후에 걸러줄것임 @@@@@@@@
		UserVO param = SecurityUtils.getLoginUser(request);
				
		if(param != null) {
			return ViewRef.INDEX_SELECT;
		}
		
		model.addAttribute("view",ViewRef.USER_LOGIN);
		return ViewRef.USER_TEMP;
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(Model model, UserPARAM param, HttpSession hs, RedirectAttributes ra) {
		
		int result = service.login(param);
		
		if(result == Const.SUCCESS) {
			hs.setAttribute(Const.LOGIN_USER, param);
			return "redirect:/" + ViewRef.INDEX_SELECT;
		}
		
		String msg = null;
		if (result == Const.NO_ID) {
			msg = "아이디를 확인해 주세요";
		} else if (result == Const.NO_PW) {
			msg = "비밀번호를 확인해 주세요";
		}
		
		ra.addFlashAttribute("data", msg);
		ra.addFlashAttribute("user_id", param.getUser_id());
		return "redirect:/" + ViewRef.USER_LOGIN;
	}
	
		
	//	회원가입
	@RequestMapping(value="/join", method = RequestMethod.GET)
	public String join(Model model, RedirectAttributes ra) {
		int uNumCode = (int)(Math.random() * 88888888 + 10000000); // 고유번호 8자리 랜덤으로 지정
		model.addAttribute("uNumCode",uNumCode);
		model.addAttribute("joinErrMsg"); // 서버에러시 띄우는 alert창
		model.addAttribute("view",ViewRef.USER_JOIN);
		
		return ViewRef.USER_TEMP;
	}	

	@RequestMapping(value="/join", method = RequestMethod.POST) 
	public String join(Model model, UserVO param, HttpSession hs, RedirectAttributes ra) {
		//int result = service.join(param);
		int result = service.joinUser(param);
		
		if(result == Const.SUCCESS) {
			return "redirect:/" + ViewRef.USER_LOGIN;

		} else { 
			ra.addFlashAttribute("joinErrMsg","서버에러! 다시 회원가입을 시도해 주세요");
			return "redirect:/" + ViewRef.USER_JOIN;
		}
	}
	
	
	//	비밀번호 찾기1-1 (아이디, 이메일 검사)
	@RequestMapping(value="/findPw", method = RequestMethod.GET)
	public String findPw(Model model, HttpServletRequest request) {
		model.addAttribute("view",ViewRef.USER_FINDPW);		
		model.addAttribute("user_id");
		model.addAttribute("Email");		
		model.addAttribute("findPwMsg");
		
		return ViewRef.USER_TEMP;
	}
	
	@RequestMapping(value="/findPw", method = RequestMethod.POST)
	public String findPw(Model model, UserPARAM param, HttpSession hs, UserDMI dmi, RedirectAttributes ra) {
		int result = service.findPw(param, hs);
		int i_user = 0;  // 노란줄그여도 무시 ( 매개변수로 i_user 넣으니 제대로 파싱안됨 ) 
		
		try { // service에서 i_user에 세션값을 못박을경우
			i_user = (int)hs.getAttribute("i_user");
			
		} catch(Exception e) {
			result = Const.FAIL;
		}
		
		if(result == Const.SUCCESS) { // 정보가 '일치한다면'
			String authKey = mss.sendAutoMailFindPw(param.getEmail());
			hs.setAttribute("authKey", authKey);
			return "redirect:/" + ViewRef.USER_CERCODE; 
			
		} else { // 정보가 '틀렸다면'			
			ra.addFlashAttribute("user_id", param.getUser_id());
			ra.addFlashAttribute("email", param.getEmail());
			model.addAttribute("view","/user/findPw");
			ra.addFlashAttribute("findPwMsg","입력하신 정보를 다시 확인해 주세요");
			return "redirect:/" + ViewRef.USER_FINDPW;
		}
	}
	
	
	// 비번찾기 1-2 (이메일 인증코드 입력)
	@RequestMapping(value="/cerCode", method=RequestMethod.GET)
	public String modal(Model model, UserPARAM param, EmailVO vo) {
		cerCodeCount += 1; 
		
		model.addAttribute("view","/user/cerCode");
		model.addAttribute("cerCodeCount"); 
		//model.addAttribute("cerCodeMsg");
		return ViewRef.USER_TEMP;
	}	

	@RequestMapping(value="/cerCode", method=RequestMethod.POST) // post 확인
	public String modal(Model model, EmailVO param, 
			HttpSession hs, RedirectAttributes ra) {
		
		String authKey = (String)hs.getAttribute("authKey");
		
		if(authKey.equals(param.getCerCode())) { 
			cerCodeCount = 0;
			return "redirect:/" + ViewRef.USER_CHANGEPW; 
			
		} else {
			ra.addFlashAttribute("cerCodeCount", cerCodeCount); 
			ra.addFlashAttribute("cerCodeMsg", "인증번호를 다시 확인해 주세요");
			return "redirect:/" + ViewRef.USER_CERCODE;
		}
	}
	
	
	// 비번찾기 1-3 (비밀번호 변경)
	@RequestMapping(value="/changePw", method = RequestMethod.GET)
	public String changePw(Model model, UserPARAM param) {
		model.addAttribute("view", "/user/changePw");
		model.addAttribute("changePwMsg");
		return ViewRef.USER_TEMP; 
	}
	
	@RequestMapping(value="/changePw", method = RequestMethod.POST)
	public String changePw(Model model, UserPARAM param, 
			HttpSession hs, RedirectAttributes ra) {
		
		int i_user = (int)hs.getAttribute("i_user");
		param.setI_user(i_user);
		
		int result = service.changePw(param);
		
		if(result == Const.SUCCESS) {
			hs.removeAttribute("i_user"); 
			hs.removeAttribute("authKey");
			ra.addFlashAttribute("changePwMsg", "비밀번호가 변경되었습니다");
			return "redirect:/" + ViewRef.USER_CHANGEPW;
			
		} else {
			ra.addFlashAttribute("changePwMsg", "서버 문제가 발생되었습니다 잠시후 다시 시도해주세요 ");
			return "redirect:/" + ViewRef.USER_CHANGEPW; // DB에러시 (다시 비번찾기 창으로 돌려서 비번만 입력하게끔 만들기)
		}
	}
	
	
	// 아이디 찾기
	@RequestMapping(value="findId", method = RequestMethod.GET)
	public String findId(Model model) {
		model.addAttribute("view",ViewRef.USER_FINDID);
		return ViewRef.USER_TEMP;
	}
	
	@RequestMapping(value="findId", method = RequestMethod.POST)
	public String findId(UserPARAM param, HttpSession hs, RedirectAttributes ra) {
		UserDMI dbUser = new UserDMI();
		
		int result = service.findId(param, hs);
		
		if(result == Const.SUCCESS) {
			dbUser.setUser_id((String)hs.getAttribute("user_id")); 
			mss.sendAutoMailFindId(param.getEmail(), dbUser.getUser_id());
			hs.removeAttribute("user_id");
			ra.addFlashAttribute("findIdSuccessMsg", "가입하신 이메일로 아이디가 전송되었습니다");
			return "redirect:/" + ViewRef.USER_FINDID;
			
		} else {
			ra.addFlashAttribute("findIdMsg", "가입하신 이메일을 다시 확인해 주세요");
			return "redirect:/" + ViewRef.USER_FINDID;
		}
	}
	
	
	// myPage
	@RequestMapping(value="/myPage", method = RequestMethod.GET)
	public String myPage(Model model, RedirectAttributes ra, UserPARAM param, HttpSession hs) {
		try {
			int i_user = SecurityUtils.getLoginUserPk(hs);
			param.setI_user(i_user);
			
		} catch(Exception e) {
			model.addAttribute("loginErr", "로그인을 해주세요");
		}
		
		model.addAttribute("selUser", service.selUserInfo(param));
		model.addAttribute("view", "/user/myPage");
		return ViewRef.DEFAULT_TEMP;
	}
	
	
	// 회원정보변경
	@RequestMapping(value="/info", method = RequestMethod.GET)
	public String info(Model model, RedirectAttributes ra, 
			UserPARAM param, HttpSession hs) {
		
		try {			
			int i_user = SecurityUtils.getLoginUserPk(hs);
			param.setI_user(i_user);
			hs.setAttribute(Const.LOGIN_USER, service.selDetailUser(param));
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("loginMsg", "로그인을 해주세요");
			return ViewRef.USER_INFO;
		}
		
		model.addAttribute("view", ViewRef.USER_INFO);
		return ViewRef.DEFAULT_TEMP;
	}
	
	@RequestMapping(value="/info", method = RequestMethod.POST)
	public String info(Model model, RedirectAttributes ra, 
			HttpSession hs, UserPARAM param) {
		
		int result = service.userInfoChange(param);
		if(result == 1) {
			ra.addFlashAttribute("infoMsg", "회원정보가 수정되었습니다");
			
			
		} else {
			ra.addFlashAttribute("infoMsg", "서버에러가 발생하였습니다 다시시도해 주세요");
		}
		
		return "redirect:/" + ViewRef.USER_INFO;
	}
	
	// info에서 본인 현재 비밀번호 확인 Post
	@RequestMapping(value="/infoChangePw", method = RequestMethod.POST)
	public String infoChangePw(Model model, UserPARAM param, RedirectAttributes ra,
			HttpServletRequest request) {
		
		int result = service.infoChangepw(param);
		
		if(result == 1) {
			ra.addFlashAttribute("pwCode", "Pw Success!!");
			return "redirect:/" + ViewRef.USER_INFO;
			
		} else {
			ra.addFlashAttribute("pwErrMsg", "비밀번호를 다시 확인해 주세요");
			return "redirect:/" + ViewRef.USER_INFO;
		}
	}
	
	// 위 infoChangePw 에서 맞을경우 이쪽으로 넘어옴 (비밀번호 변경) 
	@RequestMapping(value="/pwChange", method = RequestMethod.POST)
	public String pwChange(Model model, UserPARAM param, RedirectAttributes ra) {
		int result = service.changePw(param);
		
		if(result == 1) {
			ra.addFlashAttribute("pwChangeMsg", "비밀번호가 변경되었습니다");
			return "redirect:/" + ViewRef.USER_INFO;
			
		} else {
			ra.addFlashAttribute("pwChangeMsg", "서버에러가 발생하였습니다/n 다시시도해주세요");
			return "redirect:/" + ViewRef.USER_INFO;
		}
	}
	
	
	// 프로필 사진 등록 / 수정  (mReq를 info.post에 넣으니 에러뜸) (코드 수정해야됨)
	@RequestMapping(value="/imgUpload", method = RequestMethod.POST)
	public String imgUpload(Model model, UserVO vo, UserPARAM param, HttpServletRequest request,
			HttpSession hs, RedirectAttributes ra, MultipartHttpServletRequest mReq) {
		
		try {
			int i_user = SecurityUtils.getLoginUserPk(hs);
			param.setI_user(i_user);
			
			System.out.println("5");
			System.out.println("멀티파트쳌 : " + mReq);
			String dbUser = ((UserVO)hs.getAttribute(Const.LOGIN_USER)).getProfile_img();
			
			System.out.println("dbUser : " + dbUser);
			vo.setProfile_img(dbUser);
			
			String fileNm = service.insUserProfileImg(mReq, vo);
			UserVO param2 = ((UserVO)hs.getAttribute(Const.LOGIN_USER));
			param2.setProfile_img(fileNm);
			hs.removeAttribute(Const.LOGIN_USER);
			hs.setAttribute(Const.LOGIN_USER, param2);
			
		} catch(Exception e) {
			e.printStackTrace();
			ra.addFlashAttribute("imgErr","프로필사진을 새로 등록해 주세요");
			return "redirect:/" +  ViewRef.USER_MYPAGE;
		}
		
		return "redirect:/" + ViewRef.USER_MYPAGE;
	}
	
	
	@RequestMapping(value="/imgDel", method = RequestMethod.POST)
	public String imgDel(UserPARAM param, HttpSession hs) {
		int i_user = SecurityUtils.getLoginUserPk(hs);
		int result = 0;
		
		String dbUserImg = ((UserVO)hs.getAttribute(Const.LOGIN_USER)).getProfile_img();
		String path = hs.getServletContext().getRealPath("") +  "resources/img/HiBaby/profile_img/user/" + i_user + "/" + dbUserImg;
		
		System.out.println("사진명 : " + dbUserImg);
		System.out.println("경로 : " + path);
		
		File file = new File(path);
		if(file.exists()) {
			result = service.delUserProfileImg(i_user);
			file.delete();
			UserVO param2 = ((UserVO)hs.getAttribute(Const.LOGIN_USER));
			param2.setProfile_img(null);
			hs.removeAttribute(Const.LOGIN_USER);
			hs.setAttribute(Const.LOGIN_USER, param2);
			return "redirect:/" + ViewRef.USER_MYPAGE;
		}
		return "redirect:/" +  ViewRef.USER_MYPAGE;		
	}	
	
	
	// 포인트 환급 관련
	@RequestMapping(value="/myPoint", method=RequestMethod.POST)
	public String ajaxMyPoint(UserPARAM param, HttpSession hs, Model model,
			RedirectAttributes ra, PointVO vo, HttpServletRequest request) {
		
		int result = 0;
		int nowPoint = Integer.parseInt(request.getParameter("myPoint"));
		
		if(param.getMyCash() <= param.getMyPoint()) { // 환급완료
			int lastMyPoint = param.getMyPoint() - param.getMyCash();
			param.setMyPoint(lastMyPoint);
			
			int success = service.updMyPoint(param); // t_user 포인트 / 캐시 내역
			
			// t_myPoint 테이블에 담길 내역 ( 포인트몰 )
			vo.setMyCash(param.getMyCash());// 환급받은 캐시백
			vo.setMyPoint(nowPoint);		// 현재 포인트
			vo.setMyPointNow(lastMyPoint);	// 환급후 남은 포인트
			vo.setI_user(param.getI_user());
			
			int pointMall = service.insMyPointPage(vo);
			
			hs.setAttribute(Const.LOGIN_USER, service.selDetailUser(param));
			ra.addFlashAttribute("pointMsg", "환급 되었습니다");
			
		} else if(param.getMyCash() > param.getMyPoint()) { // 환급금액 초과
			ra.addFlashAttribute("pointMsg", "환급금액 초과되었습니다");
		} 
		
		return "redirect:/" + ViewRef.USER_MYPAGE;
	}

	
	// 해당유저 포인트 몰 (환급 내역조회)
	@RequestMapping(value="/myPointMall", method=RequestMethod.GET)
	public String ajaxMyPoint(UserPARAM param, HttpSession hs, Model model) {
		
		System.out.println("i_user 값 : " + param.getI_user());
		model.addAttribute("selPoint", service.selPointMall(param));
		model.addAttribute("view", "/user/myPointMall");
		return ViewRef.DEFAULT_TEMP;
	}
			
}



