package com.jy.hibaby.user;

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
		return "#";
	}
	
	
	
	//	회원가입
	@RequestMapping(value="/join", method = RequestMethod.GET)
	public String join(Model model) {
		model.addAttribute("view",ViewRef.USER_JOIN);
		return ViewRef.USER_TEMP;
	}
	
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String join() {
		return "#";
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
