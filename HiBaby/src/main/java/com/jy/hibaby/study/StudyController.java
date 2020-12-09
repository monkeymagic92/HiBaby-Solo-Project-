package com.jy.hibaby.study;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jy.hibaby.PointVO;
import com.jy.hibaby.StudyUtils;
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
	
	@RequestMapping(value="/math", method = RequestMethod.GET)
	public String math(Model model, RedirectAttributes ra, StudyPARAM param, 
			UserPARAM up, HttpSession hs) {
		
		param = StudyUtils.studyMath(param, hs);
		System.out.println("레벨 : " + param.getLevel());
		
		model.addAttribute("data", param);
		model.addAttribute("view", ViewRef.STUDY_MATH);
		return ViewRef.DEFAULT_TEMP;

	}
	
	@RequestMapping(value="/math", method = RequestMethod.POST)
	public String math(Model model, RedirectAttributes ra, StudyPARAM param,
			HttpSession hs, UserPARAM userParam, PointVO vo) {
		
		userParam = (UserPARAM)hs.getAttribute("loginUser");
		
		StudyUtils.ansMath(hs, param, vo, userParam);
		
		System.out.println("-0----------");
		System.out.println(param.getA1());
		System.out.println(vo.getI_user());
		System.out.println(vo.getTotalPoint());
		int result = userService.updPoint(vo);
		
		return "redirect:/" + ViewRef.STUDY_MAIN;
	}
	
	
	
	
	
	
	
	
	
	
	
}
