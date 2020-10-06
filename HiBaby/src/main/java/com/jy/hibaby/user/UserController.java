package com.jy.hibaby.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jy.hibaby.Const;
import com.jy.hibaby.SecurityUtils;
import com.jy.hibaby.ViewRef;
import com.jy.hibaby.mail.MailSendService;
import com.jy.hibaby.mail.model.EmailVO;
import com.jy.hibaby.user.model.UserPARAM;
import com.jy.hibaby.user.model.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService service;
			
	@Autowired
	private MainService mainService;

	@Autowired
	private UserMapper mapper;
	
	@Autowired
	private MailSendService mss;

	
	// @@@@@@@@@@@@@@@  테스트용
	// index/select 에서 홈버튼눌렀을때 loginUser 세션값과 myPageUser 세션값이 넘어오는지 확인용
	// myPageUser 세션값은 지우기 
	@RequestMapping(value="/test")
	public String userTest() {
		return "/user/test";
	}
	
	
	
	//	로그인
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(Model model, HttpServletRequest request) {
		// 로그인이 되어있다면 로그인페이지로 갈수없게 막아놓음 
		UserVO param = SecurityUtils.getLoginUser(request);
		if(param != null) {
			return ViewRef.INDEX_SELECT;
		}
		
		
		
		///////// 이메일 관련	/////////
		// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@		
		// 테스트용으로 로그인시 실행되게 해놨음 (값비교 정상적으로 됨)
		String authKey = mss.sendAutoMail("ddw0099@naver.com");
		EmailVO vo = new EmailVO();
		
		vo.setCerCode(authKey);
		System.out.println("인증코드 : " + vo.getCerCode());
		if(vo.getCerCode().equals("1234")) {
			System.out.println(authKey);
		} else {
			System.out.println("틀림@@@@@@@@");
		}
		///////// 이메일 관련	/////////
		// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
		
		
		model.addAttribute("view",ViewRef.USER_LOGIN);
		return ViewRef.USER_TEMP;
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(Model model, UserPARAM param, HttpSession hs, RedirectAttributes ra) {
		
		int result = service.login(param);
		
		
		if(result == Const.SUCCESS) {
			hs.setAttribute(Const.LOGIN_USER, param);
			return ViewRef.INDEX_SELECT;	
		}
		
		String msg = null;
		if (result == Const.NO_ID) {
			msg = "아이디를 확인해 주세요";
		} else if (result == Const.NO_PW) {
			msg = "비밀번호를 확인해 주세요";
		}
		
		ra.addFlashAttribute("data", msg);
		ra.addFlashAttribute("id", param.getUser_id());
		return "redirect:/user/login";
	}
	
	
	
		
	
	//	회원가입
	@RequestMapping(value="/join", method = RequestMethod.GET)
	public String join(Model model) {
		int uNumCode = (int)(Math.random() * 88888888 + 10000000); // 고유번호 8자리 랜덤으로 지정
		model.addAttribute("uNumCode",uNumCode);
		model.addAttribute("view",ViewRef.USER_JOIN);
		return ViewRef.USER_TEMP;
	}
	

	@RequestMapping(value="/join", method = RequestMethod.POST) 
	public String join(Model model, UserPARAM param, HttpSession hs) {
		int result = service.join(param);
		
		if(result == 1) {			
			model.addAttribute("view",ViewRef.USER_LOGIN);
			model.addAttribute("insMyPage","insMyPage");
			int myPageSession = service.login(param);
			hs.setAttribute(Const.MYPAGE_USER, param); // 회원가입시 myPage로 바로 넘어갈때 세션 박아서 넘김
			return ViewRef.USER_TEMP;
			
		} else {
			model.addAttribute("joinErrMsg","Error!! 관리자에게 문의해 주십시오");
			model.addAttribute("view",ViewRef.USER_JOIN);
			return ViewRef.USER_TEMP;
		}
	}
	
	
	
	
	
	//	비밀번호 찾기  
	// @@@@@@@@@@@@@@@@@@@@	여기서작업하기 @@@@@@@@@@@@@@@@@@@@@@@
	// @@@@@@@@@@@@@@@@@@@@	여기서작업하기 @@@@@@@@@@@@@@@@@@@@@@@
	// @@@@@@@@@@@@@@@@@@@@	여기서작업하기 @@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping(value="findPw", method = RequestMethod.GET)
	public String findPw(Model model) {
		model.addAttribute("view",ViewRef.USER_FINDPW);
		
		return ViewRef.USER_TEMP;
	}
	
	@RequestMapping(value="findPw", method = RequestMethod.POST)
	public String findPw() {
		
		return "redirect:/user/changePw"; // changePw 매핑으로 가게끔   ( 실제 아디,이름,이멜 정상입력했을시 비번 바꾸는 창으로가게 )
	}
	
	
	
	
	
	
	
	// 상세 프로필 등록 (로그인후 상세페이지로 이동하는 부분)
	@RequestMapping(value="myPage", method = RequestMethod.GET)
	public String myPage(Model model, HttpSession hs) {
		
		// userTemp.jsp - confirm에서 확인눌렀을경우 회원가입한 세션값을 그대로 들고와서 상세등록 가능하게 함
		UserVO param = (UserVO)hs.getAttribute(Const.MYPAGE_USER);
		
		model.addAttribute(Const.MYPAGE_USER,param);
		model.addAttribute("view","/user/myPage");
		return ViewRef.USER_TEMP;
	}
	
	@RequestMapping(value="myPage", method = RequestMethod.POST)
	public String myPage (HttpSession hs) {
		// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
		
		
		// 여기부분 확인해보기 
		// 일단 회원가입시 박아놓은 세션값을 지워줘야됨 
		// 마이페이지에서 post 값으로 값 넘어왔을떄 위에서 처리다해주고 마지막에 세션 지우는걸로 해보기 
		// 현재 로그인 컨트롤러에서 세션값 지우니까 에러남
		// 특정 세션값만 지우는 명령어 알아내기 
		hs.invalidate();
		return "gg";
	}
	

  
	// 아이디 중복체크 (aJax기법) 
	@RequestMapping(value="/ajaxIdChk", method=RequestMethod.POST)
	@ResponseBody	
	public String ajaxIdChk(@RequestBody UserPARAM param) {
		
		System.out.println("uesr_id : " + param.getUser_id());
		int result = service.login(param);
		return String.valueOf(result);
	}	
	
	
	
}
