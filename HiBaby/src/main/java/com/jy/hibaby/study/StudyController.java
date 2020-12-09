package com.jy.hibaby.study;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jy.hibaby.PointVO;
import com.jy.hibaby.SecurityUtils;
import com.jy.hibaby.StudyUtils;
import com.jy.hibaby.ViewRef;
import com.jy.hibaby.study.model.StudyPARAM;
import com.jy.hibaby.user.UserService;
import com.jy.hibaby.user.model.UserDMI;
import com.jy.hibaby.user.model.UserPARAM;

@Controller
@RequestMapping("/study")
public class StudyController {

	@Autowired
	private StudyService service;
	
	@Autowired
	private UserService userService;	// 포인트 적립 메소드 사용하기위해
	
	// 공부메인화면
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String main(Model model, RedirectAttributes ra, StudyPARAM param,
			UserPARAM userParam, HttpSession hs) {
		try { // 비로그인 상태로 접근시 로그인페이지로		
			int i_user = SecurityUtils.getLoginUserPk(hs);
			userParam.setI_user(i_user);
			
		} catch (Exception e) {
			model.addAttribute("loginMsg", "로그인을 해주세요");
			return ViewRef.STUDY_MAIN;
		}
		
		model.addAttribute("view", ViewRef.STUDY_MAIN);
		return ViewRef.DEFAULT_TEMP;
	}
	
	
	// 수학 문제 문제출제
	@RequestMapping(value="/math", method = RequestMethod.GET)
	public String math(Model model, RedirectAttributes ra, StudyPARAM param, 
			UserPARAM up, HttpSession hs) {
		
		param = StudyUtils.studyMath(param, hs);	// 수학 문제
		System.out.println("레벨 : " + param.getLevel());
		
		model.addAttribute("data", param);
		model.addAttribute("view", ViewRef.STUDY_MATH);
		return ViewRef.DEFAULT_TEMP;

	}

	// 수학 문제 정답 판별
	@RequestMapping(value="/math", method = RequestMethod.POST)
	public String math(Model model, RedirectAttributes ra, StudyPARAM param,
			HttpSession hs, UserPARAM userPARAM, PointVO vo) {
		
		userPARAM = (UserPARAM)hs.getAttribute("loginUser");
		StudyUtils.ansMath(hs, param, vo, userPARAM);	// 수학 정답
		
		ra.addFlashAttribute("getPoint", vo.getTotalPoint());
		int result = userService.updPoint(vo);	// 정답 개수만큼 포인트 증가
		
		return "redirect:/" + ViewRef.STUDY_MAIN;
	}
	
}
