package com.jy.hibaby.user;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jy.hibaby.ViewRef;
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
	public String login() {
		
		// 로그인 성공시 index로 보내기  (if문으로 위에서 거르기)
		return ViewRef.INDEX_SELECT;
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
	public String join(Model model, UserVO param) {
		int result = service.join(param);
		
		if(result == 1) {
			model.addAttribute("view",ViewRef.USER_LOGIN);
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
	
	
	
	
}
