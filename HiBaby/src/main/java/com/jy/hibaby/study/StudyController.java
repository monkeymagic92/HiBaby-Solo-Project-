package com.jy.hibaby.study;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jy.hibaby.ViewRef;
import com.jy.hibaby.study.model.StudyPARAM;
import com.jy.hibaby.user.UserService;
import com.jy.hibaby.user.model.UserPARAM;

@Controller
@RequestMapping("/study")
public class StudyController {

	@Autowired
	private StudyService service;
	
	@Autowired
	private UserService userService;	// 포인트 적립 메소드 사용하기위해
	
	
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String main(Model model, RedirectAttributes ra, StudyPARAM param) {
		
		model.addAttribute("view", ViewRef.STUDY_MAIN);
		return ViewRef.DEFAULT_TEMP;
	}
	
	@RequestMapping(value="/main", method = RequestMethod.POST)
	public String main(Model model, RedirectAttributes ra, StudyPARAM param, UserPARAM up) {
		
		
		return "test";
	}
	
	// 반복문 돌려서 난수값 넣기 
}
