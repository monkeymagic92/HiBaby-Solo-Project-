package com.jy.hibaby.study;

import javax.servlet.http.HttpServletRequest;
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
		
		StudyUtils.removeSession(hs);
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
			HttpSession hs, UserPARAM userPARAM, PointVO vo, HttpServletRequest request) {
		
		userPARAM = (UserPARAM)hs.getAttribute("loginUser");
		StudyUtils.ansMath(hs, param, vo, userPARAM);	// 수학 정답
		
		ra.addFlashAttribute("getPoint", vo.getTotalPoint());
		int result = userService.updPoint(vo);	// 정답 개수만큼 포인트 증가
		
		return "redirect:/" + ViewRef.STUDY_MAIN;
	}
	
	
	// 영어 문제 출제
	@RequestMapping(value="/eng", method = RequestMethod.GET)
	public String eng(Model model, StudyPARAM param, HttpSession hs,
			PointVO vo, UserPARAM userPARAM, RedirectAttributes ra, HttpServletRequest request) {
		
		param = StudyUtils.studyEng(param, hs);
		System.out.println("레벨 : " + param.getLevel());
		
		model.addAttribute("dataEng", param);
		model.addAttribute("view", ViewRef.STUDY_ENG);
		
		return ViewRef.DEFAULT_TEMP; 
	}
	
	
	// 영어 정답
	@RequestMapping(value="/eng", method = RequestMethod.POST)
	public String eng(Model model, StudyPARAM param, HttpSession hs,
			PointVO vo, UserPARAM userPARAM, RedirectAttributes ra) {
		
		userPARAM = (UserPARAM)hs.getAttribute("loginUser");
		StudyUtils.ansEng(hs, param, vo, userPARAM);	// 영어 정답
		
		ra.addFlashAttribute("getPoint", vo.getTotalPoint());
		int result = userService.updPoint(vo);	// 정답 개수만큼 포인트 증가
		
		return "redirect:/" + ViewRef.STUDY_MAIN;
	}
	
	
	// 스터디 랭크
	@RequestMapping(value="/rank", method = RequestMethod.GET)
	public String rank(Model model, PointVO vo, UserPARAM param,
			StudyPARAM studyParam) {
		
		model.addAttribute("oneRank", service.oneRank());
		model.addAttribute("twoRank", service.twoRank());
		model.addAttribute("threeRank", service.threeRank());
		model.addAttribute("fourRank", service.fourRank());
		model.addAttribute("fiveRank", service.fiveRank());
		model.addAttribute("otherRank", service.otherRank());
		
		model.addAttribute("view", ViewRef.STUDY_RANK);
		return ViewRef.DEFAULT_TEMP;
	}
	
}
