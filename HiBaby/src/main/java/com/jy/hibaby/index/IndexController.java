package com.jy.hibaby.index;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jy.hibaby.Const;
import com.jy.hibaby.pro.ProService;
import com.jy.hibaby.user.UserService;
import com.jy.hibaby.user.model.UserPARAM;

@Controller
@RequestMapping("/index")
public class IndexController {
	
	@Autowired
	private ProService proService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/select")
	public String index(Model model, HttpSession hs, UserPARAM param) {
		
		param = (UserPARAM)hs.getAttribute(Const.LOGIN_USER);
		userService.loginChkPlus(param); // 로그인 할시 loginChk값 = 2  (접속상태)
		
		proService.staticZero();	// pro 컨트롤러 static값 초기화
		return "/index/select";
	}
}
