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
	private MailSendService mss;  // 현재 이메일 부분 주석처리해놔서 노란줄 끄이는거임

	// @@@@@@@@@@@@@         중요            @@@@@@@@@@@@@@@@@@@
	
	// 이메일 인증 테스트 중 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	// 회원가입(join)에서 이메일을 받은다음 
	// 원리 :
	// 컨트롤러 signUpConfirm() 메소드가 POST방식으로 jsp를 열어준다음 
	// 그 jsp 에서 값 비교되게끔 (세션에 값박고 지우기)
	// MailSendService에서 sendAutoMail() 메소드에서
	
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// 됬고 그냥 아래 메소드 주석풀고
	// String authKey = mss.sendAutoMail("ddw0099@naver.com"); join창에서 켜봐라
	
	

//  이메일 관련    MailSendService에서 이런식으로 값이 날라옴
//	@RequestMapping(value="signUpConfirm", method = RequestMethod.POST)
//	public String signUpConfirm(UserPARAM param, HttpServletRequest request) {
//		String a = request.getParameter("email");
//		String b = request.getParameter("authKey");
//		
//		System.out.println(a);
//		System.out.println(b);
//		return "/user/signUpConfirm";
//	}
	
	
	
	
	
	
	
	// @@@@@@@@@@@@@@@  테스트용
	// index/select 에서 홈버튼눌렀을때 loginUser 세션값과 myPageUser 세션값이 넘어오는지 확인용
	// myPageUser 세션값은 지우기 
	@RequestMapping(value="/test")
	public String userTest() {
		return "/user/test";
	}
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	
	
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
	public String join(Model model, UserPARAM param, HttpSession hs, RedirectAttributes ra) {
		int result = service.join(param);
		
		if(result == Const.SUCCESS) {
			int myPageSession = service.login(param);
			hs.setAttribute(Const.MYPAGE_USER, param); // 회원가입시 myPage로 바로 넘어갈때 세션 박아서 넘김
			//ra.addAttribute("joinMsg", "회원가입이 되었습니다");
			return "redirect:/" + ViewRef.USER_LOGIN;

		} else {
			ra.addFlashAttribute("joinErrMsg","Error!! 관리자에게 문의해 주십시오");
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
		
		try { // 만약 service에서 i_user에 세션값을 못박을경우
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
			ra.addFlashAttribute("Email", param.getEmail());
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
		model.addAttribute("cerCodeCount"); //
		model.addAttribute("cerCodeMsg");
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
	
	
	
	
	// 비밀번호 변경
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
	
	
	
	
	
		
	
	// 상세 프로필 등록 (로그인후 상세페이지로 이동)
	@RequestMapping(value="/myPage", method = RequestMethod.GET)
	public String myPage(Model model, HttpSession hs) {
		
		// userTemp.jsp - confirm에서 확인눌렀을경우 회원가입한 세션값을 그대로 들고와서 상세등록 가능하게 함
		UserVO param = (UserVO)hs.getAttribute(Const.MYPAGE_USER);
		
		model.addAttribute(Const.MYPAGE_USER,param);
		model.addAttribute("view","/user/myPage");
		return ViewRef.USER_TEMP;
	}
	
	@RequestMapping(value="/myPage", method = RequestMethod.POST)
	public String myPage (HttpSession hs) {
		
		// 여기부분 확인해보기 
		// 일단 회원가입시 박아놓은 세션값을 지워줘야됨 
		// 마이페이지에서 post 값으로 값 넘어왔을떄 위에서 처리다해주고 마지막에 세션 지우는걸로 해보기 
		// 현재 로그인 컨트롤러에서 세션값 지우니까 에러남
		hs.removeAttribute(Const.MYPAGE_USER);
		return "gg";
	}
	
	
	
	
	// 아이디 찾기
	@RequestMapping(value="findId", method = RequestMethod.GET)
	public String findId(Model model) {
		model.addAttribute("view",ViewRef.USER_FINDID);
		//model.addAttribute("findIdMsg");
		//model.addAttribute("findIdSuccessMsg");
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
	

	
	// 아이디 중복체크 (aJax) 
	@RequestMapping(value="/ajaxIdChk", method=RequestMethod.POST)
	@ResponseBody	
	public String ajaxIdChk(@RequestBody UserPARAM param) {
		
		System.out.println("uesr_id : " + param.getUser_id());
		int result = service.login(param);
		return String.valueOf(result);
	}
	
	
}

