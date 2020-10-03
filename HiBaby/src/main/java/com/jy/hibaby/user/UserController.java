package com.jy.hibaby.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jy.hibaby.ViewRef;

@Controller
@RequestMapping("/user")
public class UserController {

	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(Model model) {
		model.addAttribute("view",ViewRef.USER_LOGIN);
		model.addAttribute("cssLink",ViewRef.CSS);
		return ViewRef.MENU_TEMP;
	}
}
