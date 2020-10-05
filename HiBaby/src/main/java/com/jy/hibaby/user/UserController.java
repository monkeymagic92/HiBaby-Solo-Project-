package com.jy.hibaby.user;

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
import com.jy.hibaby.ViewRef;
import com.jy.hibaby.user.model.UserPARAM;
import com.jy.hibaby.user.model.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService service;
	
	//	로그인
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(Model model) {
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
	@RequestMapping(value="findPw", method = RequestMethod.GET)
	public String findPw(Model model) {
		model.addAttribute("view",ViewRef.USER_FINDPW);
		model.addAttribute("findPw","model.addAttribute");
		return ViewRef.USER_TEMP;
	}
	
	@RequestMapping(value="findPw", method = RequestMethod.POST)
	public String findPw() {
		return "#";
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
		// 현재 로그인상태에서 세션값 지우니까 에러남 
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
