package com.jy.hibaby.pro;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.hibaby.ViewRef;
import com.jy.hibaby.pro.model.ProPARAM;
import com.jy.hibaby.pro.model.ProVO;

@Controller
@RequestMapping("/pro")
public class ProController {

	// pro_num.jsp(get,post) 에 사용될 static 값
	public static int level = 0;
	public static int count = 21;
	public static int gameResult = 0;
	public static int userResult = 0;
	public static int comResult = 0;
	 
	
	
	@Autowired
	private ProService service;
	
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String main(Model model) {
		service.staticZero();
		
		model.addAttribute("view", ViewRef.PRO_MAIN);
		return ViewRef.DEFAULT_TEMP;
	}
	
	// level 1,2,3 = 스무고개 , 4 = ??, 5 = ??, 6 = ?? 쭉 만들기
	@RequestMapping(value="/main", method = RequestMethod.POST)
	public String main(Model model, ProPARAM param) {
		
		level = 0;
		System.out.println("레벨 : " + param.getLevel());
		if(param.getLevel() == 1) {	// 랜덤값 미리 찍어서 static 에다가 넣기
			level = 1;
			return "redirect:/" + ViewRef.PRO_NUM;
			
		} else if(param.getLevel() == 2) {
			level = 2;
			return "redirect:/" + ViewRef.PEOPLEGAME;
			
		} else if(param.getLevel() == 3) { // 다른 거 나오면 else if로 계속 분기하기
			level = 3;
			return "redirect:/" + ViewRef.PEOPLEGAME;
			
		} else if(param.getLevel() == 4) {
			level = 4;
			return "redirect:/" + ViewRef.PEOPLEGAME;
			
		} else {
			return "redirect:/" + ViewRef.PRO_MAIN;
		}
	}
	

	// 스무고개 화면
	@RequestMapping(value="/pro_num", method = RequestMethod.GET)
	public String pro_num(Model model, ProPARAM param) {		
		if(level == 1) {			
			// gameResult가 0일경우 랜덤값을 박음   그이후 그 랜덤값은 계속 유지
			if(gameResult == 0) {
				int ranNum = (int)(Math.random() * 100) + 1;
				gameResult = ranNum;
			}			
			model.addAttribute("levelAlert", "1~100 까지 맞추기");

		} 

		// -	-	-	-	- level end -	-	-	-	-
		
		
		count--;
		// 유저 관련
		if(param.getUserResult() < gameResult) {
			model.addAttribute("msgResult", param.getUserResult()
					+ " 보다 큰숫자 입니다.");
			
		} else if(param.getUserResult() > gameResult) {
			model.addAttribute("msgResult", param.getUserResult()
					+ " 보다 작은 숫자 입니다.");
			
		} else {
			model.addAttribute("msgResult","유저 정답!");
			model.addAttribute("gameEnd", "유저 승리!");
			model.addAttribute("view", ViewRef.PRO_NUM);
			return ViewRef.DEFAULT_TEMP; 
		}
	
	
	
		// 컴퓨터 관련
		if(param.getUserResult() < gameResult) {	// 유저가 값이 작다면
			
			int maxmin = param.getUserResult() + 1;
			int a = (101 - maxmin);
			
			comResult = (int)(Math.random() * a) + maxmin;
			
			if(comResult == gameResult) {
				model.addAttribute("msgResult","컴퓨터 정답!");
				model.addAttribute("gameEnd", "컴퓨터 승리!");
			}
			model.addAttribute("comResult", comResult);
			

		} else if(param.getUserResult() > gameResult) {	 // 유저가 값이 크다면
	
			int maxmin = param.getUserResult() - 1;
			int a = (param.getUserResult() - maxmin);
			comResult = (int)(Math.random() * param.getUserResult()) + 1;
			
			if(comResult == gameResult) {
				model.addAttribute("msgResult","컴퓨터 정답!");
				model.addAttribute("gameEnd", "컴퓨터 승리!");
			}
			model.addAttribute("comResult", comResult);
		}
		
		model.addAttribute("gameResult", gameResult); // 게임정답
		model.addAttribute("count", count); // 총 횟수		
		model.addAttribute("view", ViewRef.PRO_NUM);
		return ViewRef.DEFAULT_TEMP;
	}
	
	// 스무고개 post
	/*
	 *	pro_num.jsp 에서 넘어온값 홀짝 구별해서 get, post 에서 홀 짝 구분값 줌
	 *
	 *	정답 일시 모든 스태틱값 초기화 시키기 (메소드 하나 만들어서 스태틱 초기화 메소드 사용)
	 *
	 *	index/select 가더라도 모든 스태틱값 초기화하는 메소드 사용하기
	 */

	@RequestMapping(value="/pro_num", method=RequestMethod.POST) 
    private String pro_num(ProPARAM param, HttpSession hs,
    		 HttpServletRequest request){
		
		System.out.println("userResult 값 :" + param.getUserResult());
		
		return "redirect:/" + ViewRef.PRO_NUM;
	}
	
	
	// 2p 스무고개 
	@RequestMapping(value="/peopleGame", method=RequestMethod.GET)
	private String peopleGame(ProPARAM param, Model model) {
		if(level == 2) {			
			// gameResult가 0일경우 랜덤값을 박음   그이후 그 랜덤값은 계속 유지
			if(gameResult == 0) {
				int ranNum = (int)(Math.random() * 100) + 1;
				gameResult = ranNum;
			}			
			model.addAttribute("levelAlert", "1~100 까지 맞추기");

		} else if(level == 3) {
			// gameResult가 0일경우 랜덤값을 박음   그이후 그 랜덤값은 계속 유지
			if(gameResult == 0) {
				int ranNum = (int)(Math.random() * 500) + 1;
				gameResult = ranNum;
			}			
			model.addAttribute("levelAlert", "1~500 까지 맞추기");
			
		} else if(level == 4) {
			// gameResult가 0일경우 랜덤값을 박음   그이후 그 랜덤값은 계속 유지
			if(gameResult == 0) {
				int ranNum = (int)(Math.random() * 1000) + 1;
				gameResult = ranNum;
			}			
			model.addAttribute("levelAlert", "1~1000 까지 맞추기");
		}
		
		model.addAttribute("view", ViewRef.PEOPLEGAME);
		return ViewRef.DEFAULT_TEMP;
	}
	
}
